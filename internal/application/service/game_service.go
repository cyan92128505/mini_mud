package service

import (
	"context"
	"fmt"

	"mini-mud/internal/domain/entity"
	"mini-mud/internal/domain/event"
	"mini-mud/internal/infrastructure/game"
)

// GameService manages the overall game state.
type GameService struct {
	world         *game.World
	playerService *PlayerService
}

// NewGameService creates a new game service.
func NewGameService(world *game.World, playerService *PlayerService) *GameService {
	return &GameService{
		world:         world,
		playerService: playerService,
	}
}

// Start starts the game service.
func (s *GameService) Start(ctx context.Context) {
	s.world.Start(ctx)
}

// Stop stops the game service.
func (s *GameService) Stop() {
	s.world.Stop()
}

// Connect connects a player to the game.
func (s *GameService) Connect(ctx context.Context, playerName string) (*entity.Player, error) {
	player, created, err := s.playerService.GetOrCreatePlayer(ctx, playerName)
	if err != nil {
		return nil, fmt.Errorf("failed to get or create player: %w", err)
	}

	if !created {
		// Restore player to town with full HP on reconnect
		player.Position = entity.TownPosition
		player.LastPos = entity.TownPosition
		player.HP = player.MaxHP
		player.InCombat = false
	}

	if err := s.world.PlayerJoin(ctx, player); err != nil {
		return nil, fmt.Errorf("failed to join world: %w", err)
	}
	return player, nil
}

// Disconnect disconnects a player from the game.
func (s *GameService) Disconnect(ctx context.Context, playerID string) error {
	player, ok := s.world.GetPlayer(ctx, playerID)
	if !ok {
		return nil
	}

	// Save player state before disconnecting
	if err := s.playerService.SavePlayer(ctx, player); err != nil {
		return fmt.Errorf("failed to save player: %w", err)
	}

	if err := s.world.PlayerLeave(ctx, playerID); err != nil {
		return fmt.Errorf("failed to leave world: %w", err)
	}
	return nil
}

// Move moves a player in a direction.
func (s *GameService) Move(ctx context.Context, playerID string, direction Direction) error {
	player, ok := s.world.GetPlayer(ctx, playerID)
	if !ok {
		return fmt.Errorf("player not found: %s", playerID)
	}

	if player.InCombat {
		return fmt.Errorf("cannot move while in combat")
	}

	newPos := calculateNewPosition(player.Position, direction)
	if !newPos.IsValid() {
		return fmt.Errorf("cannot move in that direction")
	}

	return s.world.MovePlayer(ctx, playerID, newPos)
}

// Attack performs an attack action.
func (s *GameService) Attack(ctx context.Context, playerID string) (*game.CombatResult, error) {
	player, ok := s.world.GetPlayer(ctx, playerID)
	if !ok {
		return nil, fmt.Errorf("player not found: %s", playerID)
	}

	if !player.InCombat {
		return nil, fmt.Errorf("not in combat")
	}

	result, err := s.world.ProcessAttack(ctx, playerID)
	if err != nil {
		return nil, err
	}

	// Save player state after combat action
	if result != nil && (result.PlayerDied || result.MonsterDied) {
		if p, ok := s.world.GetPlayer(ctx, playerID); ok {
			if err := s.playerService.SavePlayer(ctx, p); err != nil {
				// Log error but don't fail the action
			}
		}
	}

	return result, nil
}

// Retreat retreats from combat.
func (s *GameService) Retreat(ctx context.Context, playerID string) error {
	player, ok := s.world.GetPlayer(ctx, playerID)
	if !ok {
		return fmt.Errorf("player not found: %s", playerID)
	}

	if !player.InCombat {
		return fmt.Errorf("not in combat")
	}

	return s.world.ProcessRetreat(ctx, playerID)
}

// GetPlayerStatus returns the current player status.
func (s *GameService) GetPlayerStatus(ctx context.Context, playerID string) (*PlayerStatus, error) {
	player, ok := s.world.GetPlayer(ctx, playerID)
	if !ok {
		return nil, fmt.Errorf("player not found: %s", playerID)
	}

	status := &PlayerStatus{
		ID:       player.ID,
		Name:     player.Name,
		HP:       player.HP,
		MaxHP:    player.MaxHP,
		Attack:   player.Attack,
		Defense:  player.Defense,
		EXP:      player.EXP,
		Level:    player.Level,
		Position: player.Position,
		InCombat: player.InCombat,
	}

	if player.InCombat {
		monster := s.world.GetMonster(ctx)
		if monster != nil && monster.IsAlive() {
			status.CombatTarget = &CombatTargetStatus{
				ID:    monster.ID,
				Name:  monster.Name,
				HP:    monster.GetHP(),
				MaxHP: monster.MaxHP,
			}
		}
	}

	return status, nil
}

// GetMapState returns the current map state.
func (s *GameService) GetMapState(ctx context.Context) *game.MapState {
	return s.world.GetMapState(ctx)
}

// GetEventChannel returns the event channel.
func (s *GameService) GetEventChannel() <-chan event.Event {
	return s.world.EventChan
}

// Direction represents movement direction.
type Direction int

const (
	DirectionUp Direction = iota
	DirectionDown
	DirectionLeft
	DirectionRight
)

// calculateNewPosition calculates the new position based on direction.
func calculateNewPosition(pos entity.Position, dir Direction) entity.Position {
	switch dir {
	case DirectionUp:
		return entity.Position{X: pos.X, Y: pos.Y - 1}
	case DirectionDown:
		return entity.Position{X: pos.X, Y: pos.Y + 1}
	case DirectionLeft:
		return entity.Position{X: pos.X - 1, Y: pos.Y}
	case DirectionRight:
		return entity.Position{X: pos.X + 1, Y: pos.Y}
	default:
		return pos
	}
}

// PlayerStatus represents a player's current status.
type PlayerStatus struct {
	ID           string
	Name         string
	HP           int
	MaxHP        int
	Attack       int
	Defense      int
	EXP          int
	Level        int
	Position     entity.Position
	InCombat     bool
	CombatTarget *CombatTargetStatus
}

// CombatTargetStatus represents the combat target status.
type CombatTargetStatus struct {
	ID    string
	Name  string
	HP    int
	MaxHP int
}
