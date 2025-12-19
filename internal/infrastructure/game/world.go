package game

import (
	"context"
	"sync"
	"time"

	"mini-mud/internal/domain/entity"
	"mini-mud/internal/domain/event"
	"mini-mud/internal/domain/repository"
)

// World represents the game world state backed by Redis.
type World struct {
	stateRepo repository.WorldStateRepository
	EventChan chan event.Event
	mu        sync.RWMutex
	stopChan  chan struct{}
}

// NewWorld creates a new game world with Redis backing.
func NewWorld(stateRepo repository.WorldStateRepository) *World {
	return &World{
		stateRepo: stateRepo,
		EventChan: make(chan event.Event, 100),
		stopChan:  make(chan struct{}),
	}
}

// Start starts the world update loop.
func (w *World) Start(ctx context.Context) {
	go w.initMonster(ctx)
	go w.respawnLoop(ctx)
}

// Stop stops the world update loop.
func (w *World) Stop() {
	close(w.stopChan)
}

// initMonster initializes the monster in Redis if not exists.
func (w *World) initMonster(ctx context.Context) {
	monster, err := w.stateRepo.GetMonster(ctx)
	if err != nil || monster == nil {
		monster = entity.NewMonster("monster-1", "Goblin")
		_ = w.stateRepo.SaveMonster(ctx, monster)
	}
}

// respawnLoop checks for monster respawn.
func (w *World) respawnLoop(ctx context.Context) {
	ticker := time.NewTicker(1 * time.Second)
	defer ticker.Stop()

	for {
		select {
		case <-ctx.Done():
			return
		case <-w.stopChan:
			return
		case <-ticker.C:
			w.checkRespawn(ctx)
		}
	}
}

// checkRespawn checks if the monster should respawn.
func (w *World) checkRespawn(ctx context.Context) {
	w.mu.Lock()
	defer w.mu.Unlock()

	monster, err := w.stateRepo.GetMonster(ctx)
	if err != nil || monster == nil {
		return
	}

	if monster.ShouldRespawn() {
		monster.Respawn()
		if err := w.stateRepo.SaveMonster(ctx, monster); err != nil {
			return
		}
		if err := w.stateRepo.ClearMonsterDamage(ctx); err != nil {
			return
		}
		w.emitEvent(event.NewMonsterSpawnedEvent(monster.ID, monster.GetPosition()))
	}
}

// PlayerJoin adds a player to the world.
func (w *World) PlayerJoin(ctx context.Context, player *entity.Player) error {
	w.mu.Lock()
	defer w.mu.Unlock()

	if err := w.stateRepo.SavePlayer(ctx, player); err != nil {
		return err
	}
	if err := w.stateRepo.SetPlayerOnline(ctx, player.ID); err != nil {
		return err
	}
	// Add to position index
	if err := w.stateRepo.UpdatePlayerPosition(ctx, player.ID, player.Position, player.Position); err != nil {
		return err
	}

	w.emitEvent(event.NewPlayerJoinedEvent(player.ID, player.Name, player.Position))
	return nil
}

// PlayerLeave removes a player from the world.
func (w *World) PlayerLeave(ctx context.Context, playerID string) error {
	w.mu.Lock()
	defer w.mu.Unlock()

	player, err := w.stateRepo.GetPlayer(ctx, playerID)
	if err != nil || player == nil {
		return nil
	}

	// Clean up position index
	posKey := player.Position
	if err := w.stateRepo.UpdatePlayerPosition(ctx, playerID, posKey, entity.Position{X: -1, Y: -1}); err != nil {
		// Ignore position cleanup errors
	}

	if err := w.stateRepo.SetPlayerOffline(ctx, playerID); err != nil {
		return err
	}
	if err := w.stateRepo.DeleteCombatState(ctx, playerID); err != nil {
		// Ignore combat state cleanup errors
	}

	w.emitEvent(event.NewPlayerLeftEvent(playerID))
	return nil
}

// GetPlayer returns an online player by ID.
func (w *World) GetPlayer(ctx context.Context, playerID string) (*entity.Player, bool) {
	w.mu.RLock()
	defer w.mu.RUnlock()

	player, err := w.stateRepo.GetPlayer(ctx, playerID)
	if err != nil || player == nil {
		return nil, false
	}
	return player, true
}

// GetMonster returns the world monster.
func (w *World) GetMonster(ctx context.Context) *entity.Monster {
	w.mu.RLock()
	defer w.mu.RUnlock()

	monster, err := w.stateRepo.GetMonster(ctx)
	if err != nil || monster == nil {
		return nil
	}
	return monster
}

// MovePlayer moves a player to a new position.
func (w *World) MovePlayer(ctx context.Context, playerID string, newPos entity.Position) error {
	w.mu.Lock()
	defer w.mu.Unlock()

	player, err := w.stateRepo.GetPlayer(ctx, playerID)
	if err != nil || player == nil {
		return nil
	}

	oldPos := player.Position
	if err := player.MoveTo(newPos); err != nil {
		return err
	}

	if err := w.stateRepo.SavePlayer(ctx, player); err != nil {
		return err
	}
	if err := w.stateRepo.UpdatePlayerPosition(ctx, playerID, oldPos, newPos); err != nil {
		return err
	}

	w.emitEvent(event.NewPlayerMovedEvent(playerID, oldPos, newPos))

	// Check if player entered monster's tile
	monster, _ := w.stateRepo.GetMonster(ctx)
	if monster != nil && monster.IsAlive() && newPos.Equals(monster.GetPosition()) {
		w.startCombat(ctx, player, monster)
	}

	return nil
}

// startCombat initiates combat between a player and the monster.
func (w *World) startCombat(ctx context.Context, player *entity.Player, monster *entity.Monster) {
	player.EnterCombat()
	_ = w.stateRepo.SavePlayer(ctx, player)

	combatState := &repository.CombatState{
		PlayerID: player.ID,
		Turn:     1,
		Active:   true,
	}
	_ = w.stateRepo.SaveCombatState(ctx, combatState)

	w.emitEvent(event.NewCombatStartedEvent(player.ID, monster.ID))
}

// ProcessAttack handles a player attacking the monster.
func (w *World) ProcessAttack(ctx context.Context, playerID string) (*CombatResult, error) {
	w.mu.Lock()
	defer w.mu.Unlock()

	player, err := w.stateRepo.GetPlayer(ctx, playerID)
	if err != nil || player == nil || !player.InCombat {
		return nil, nil
	}

	combat, err := w.stateRepo.GetCombatState(ctx, playerID)
	if err != nil || combat == nil || !combat.Active {
		return nil, nil
	}

	monster, err := w.stateRepo.GetMonster(ctx)
	if err != nil || monster == nil || !monster.IsAlive() {
		return nil, nil
	}

	result := &CombatResult{
		PlayerID:  playerID,
		MonsterID: monster.ID,
		Turn:      combat.Turn,
	}

	// Player attacks monster
	playerDamage := player.CalculateDamage(monster.Defense)
	actualDamage, shouldMove, monsterDied := monster.TakeDamage(playerID, playerDamage)
	result.PlayerDamage = actualDamage
	result.MonsterHP = monster.GetHP()
	result.MonsterMaxHP = monster.MaxHP

	// Save monster state and damage contribution
	_ = w.stateRepo.SaveMonster(ctx, monster)
	_ = w.stateRepo.AddMonsterDamage(ctx, playerID, actualDamage)

	// Monster moves if threshold reached
	if shouldMove && !monsterDied {
		oldPos := monster.GetPosition()
		if monster.Move() {
			_ = w.stateRepo.SaveMonster(ctx, monster)
			w.emitEvent(event.NewMonsterMovedEvent(monster.ID, oldPos, monster.GetPosition()))
		}
	}

	// Monster died
	if monsterDied {
		result.MonsterDied = true
		result.ExpGained = w.distributeExp(ctx, playerID, monster)
		w.handleMonsterDeath(ctx, playerID, monster)
		return result, nil
	}

	// Monster attacks player
	monsterDamage := monster.CalculateDamage(player.Defense)
	player.TakeDamage(monsterDamage)
	result.MonsterDamage = monsterDamage
	result.PlayerHP = player.HP
	result.PlayerMaxHP = player.MaxHP

	_ = w.stateRepo.SavePlayer(ctx, player)

	w.emitEvent(event.NewCombatTurnEvent(
		playerID, monster.ID,
		result.PlayerDamage, result.MonsterDamage,
		player.HP, player.MaxHP,
		monster.GetHP(), monster.MaxHP,
		combat.Turn,
	))

	// Player died
	if player.IsDead() {
		result.PlayerDied = true
		w.handlePlayerDeath(ctx, player, monster)
		return result, nil
	}

	_ = w.stateRepo.IncrementCombatTurn(ctx, playerID)
	return result, nil
}

// distributeExp distributes EXP to a player based on damage contribution.
func (w *World) distributeExp(ctx context.Context, playerID string, monster *entity.Monster) int {
	expReward := monster.CalculateExpReward(playerID)
	player, err := w.stateRepo.GetPlayer(ctx, playerID)
	if err != nil || player == nil {
		return expReward
	}

	leveledUp := player.AddEXP(expReward)
	_ = w.stateRepo.SavePlayer(ctx, player)

	if leveledUp {
		w.emitEvent(event.NewPlayerLevelUpEvent(playerID, player.Level))
	}
	return expReward
}

// handleMonsterDeath handles monster death and distributes rewards.
func (w *World) handleMonsterDeath(ctx context.Context, killerID string, monster *entity.Monster) {
	contributors := monster.GetAllDamageContributors()

	// Distribute EXP to all contributors
	for _, playerID := range contributors {
		if playerID != killerID {
			w.distributeExp(ctx, playerID, monster)
		}
	}

	// End all active combats
	activeCombats, _ := w.stateRepo.GetAllActiveCombats(ctx)
	for _, combat := range activeCombats {
		player, err := w.stateRepo.GetPlayer(ctx, combat.PlayerID)
		if err != nil || player == nil {
			continue
		}
		player.LeaveCombat()
		_ = w.stateRepo.SavePlayer(ctx, player)
		_ = w.stateRepo.DeleteCombatState(ctx, combat.PlayerID)

		expGained := monster.CalculateExpReward(combat.PlayerID)
		w.emitEvent(event.NewCombatEndedEvent(combat.PlayerID, monster.ID, event.CombatEndVictory, expGained))
	}

	monster.Kill()
	_ = w.stateRepo.SaveMonster(ctx, monster)

	w.emitEvent(event.NewMonsterDiedEvent(monster.ID, killerID, contributors))
}

// handlePlayerDeath handles player death.
func (w *World) handlePlayerDeath(ctx context.Context, player *entity.Player, monster *entity.Monster) {
	_ = w.stateRepo.DeleteCombatState(ctx, player.ID)

	oldPos := player.Position
	player.Die()
	_ = w.stateRepo.SavePlayer(ctx, player)
	_ = w.stateRepo.UpdatePlayerPosition(ctx, player.ID, oldPos, player.Position)

	w.emitEvent(event.NewCombatEndedEvent(player.ID, monster.ID, event.CombatEndDeath, 0))
	w.emitEvent(event.NewPlayerDiedEvent(player.ID))
}

// ProcessRetreat handles a player retreating from combat.
func (w *World) ProcessRetreat(ctx context.Context, playerID string) error {
	w.mu.Lock()
	defer w.mu.Unlock()

	player, err := w.stateRepo.GetPlayer(ctx, playerID)
	if err != nil || player == nil || !player.InCombat {
		return nil
	}

	monster, _ := w.stateRepo.GetMonster(ctx)
	monsterID := ""
	monsterPos := player.Position
	if monster != nil {
		monsterID = monster.ID
		monsterPos = monster.GetPosition()
	}

	_ = w.stateRepo.DeleteCombatState(ctx, playerID)

	oldPos := player.Position
	player.Retreat()
	_ = w.stateRepo.SavePlayer(ctx, player)
	_ = w.stateRepo.UpdatePlayerPosition(ctx, playerID, oldPos, player.Position)

	w.emitEvent(event.NewCombatEndedEvent(playerID, monsterID, event.CombatEndRetreat, 0))
	w.emitEvent(event.NewPlayerMovedEvent(playerID, monsterPos, player.Position))

	return nil
}

// GetMapState returns the current state of the map.
func (w *World) GetMapState(ctx context.Context) *MapState {
	w.mu.RLock()
	defer w.mu.RUnlock()

	onlinePlayers, _ := w.stateRepo.GetOnlinePlayers(ctx)
	players := make([]PlayerState, 0, len(onlinePlayers))
	for _, p := range onlinePlayers {
		players = append(players, PlayerState{
			ID:       p.ID,
			Name:     p.Name,
			Position: p.Position,
			InCombat: p.InCombat,
		})
	}

	monster, _ := w.stateRepo.GetMonster(ctx)
	var monsterState *MonsterState
	if monster != nil && monster.IsAlive() {
		monsterState = &MonsterState{
			ID:       monster.ID,
			Name:     monster.Name,
			Position: monster.GetPosition(),
			HP:       monster.GetHP(),
			MaxHP:    monster.MaxHP,
		}
	}

	return &MapState{
		Players: players,
		Monster: monsterState,
	}
}

// emitEvent sends an event to the event channel.
func (w *World) emitEvent(evt event.Event) {
	select {
	case w.EventChan <- evt:
	default:
		// Channel full, drop event
	}
}

// CombatResult contains the result of a combat turn.
type CombatResult struct {
	PlayerID      string
	MonsterID     string
	Turn          int
	PlayerDamage  int
	MonsterDamage int
	PlayerHP      int
	PlayerMaxHP   int
	MonsterHP     int
	MonsterMaxHP  int
	PlayerDied    bool
	MonsterDied   bool
	ExpGained     int
}

// MapState represents the current state of the map.
type MapState struct {
	Players []PlayerState
	Monster *MonsterState
}

// PlayerState represents a player's visible state on the map.
type PlayerState struct {
	ID       string
	Name     string
	Position entity.Position
	InCombat bool
}

// MonsterState represents the monster's visible state on the map.
type MonsterState struct {
	ID       string
	Name     string
	Position entity.Position
	HP       int
	MaxHP    int
}
