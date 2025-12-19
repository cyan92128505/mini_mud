package redis

import (
	"context"
	"fmt"
	"strconv"
	"time"

	"github.com/redis/go-redis/v9"

	"mini-mud/internal/domain/entity"
	"mini-mud/internal/domain/repository"
)

// worldStateRepository implements repository.WorldStateRepository using Redis.
type worldStateRepository struct {
	client *redis.Client
}

// NewWorldStateRepository creates a new Redis-backed world state repository.
func NewWorldStateRepository(client *redis.Client) repository.WorldStateRepository {
	return &worldStateRepository{client: client}
}

// GetPlayer retrieves a player by ID from Redis.
func (r *worldStateRepository) GetPlayer(ctx context.Context, id string) (*entity.Player, error) {
	key := PlayerKey(id)
	data, err := r.client.HGetAll(ctx, key).Result()
	if err != nil {
		return nil, fmt.Errorf("failed to get player %s: %w", id, err)
	}
	if len(data) == 0 {
		return nil, nil
	}
	return hashToPlayer(data)
}

// SavePlayer saves a player to Redis.
func (r *worldStateRepository) SavePlayer(ctx context.Context, player *entity.Player) error {
	key := PlayerKey(player.ID)
	data := playerToHash(player)

	pipe := r.client.Pipeline()
	pipe.HSet(ctx, key, data)
	pipe.Expire(ctx, key, time.Duration(PlayerSessionTTLSecs)*time.Second)
	_, err := pipe.Exec(ctx)
	if err != nil {
		return fmt.Errorf("failed to save player %s: %w", player.ID, err)
	}
	return nil
}

// DeletePlayer removes a player from Redis.
func (r *worldStateRepository) DeletePlayer(ctx context.Context, id string) error {
	key := PlayerKey(id)
	if err := r.client.Del(ctx, key).Err(); err != nil {
		return fmt.Errorf("failed to delete player %s: %w", id, err)
	}
	return nil
}

// GetOnlinePlayers retrieves all online players.
func (r *worldStateRepository) GetOnlinePlayers(ctx context.Context) ([]*entity.Player, error) {
	ids, err := r.GetOnlinePlayerIDs(ctx)
	if err != nil {
		return nil, err
	}

	players := make([]*entity.Player, 0, len(ids))
	for _, id := range ids {
		player, err := r.GetPlayer(ctx, id)
		if err != nil {
			return nil, err
		}
		if player != nil {
			players = append(players, player)
		}
	}
	return players, nil
}

// GetOnlinePlayerIDs retrieves IDs of all online players.
func (r *worldStateRepository) GetOnlinePlayerIDs(ctx context.Context) ([]string, error) {
	ids, err := r.client.SMembers(ctx, KeyWorldOnline).Result()
	if err != nil {
		return nil, fmt.Errorf("failed to get online player ids: %w", err)
	}
	return ids, nil
}

// SetPlayerOnline marks a player as online.
func (r *worldStateRepository) SetPlayerOnline(ctx context.Context, playerID string) error {
	if err := r.client.SAdd(ctx, KeyWorldOnline, playerID).Err(); err != nil {
		return fmt.Errorf("failed to set player %s online: %w", playerID, err)
	}
	return nil
}

// SetPlayerOffline marks a player as offline.
func (r *worldStateRepository) SetPlayerOffline(ctx context.Context, playerID string) error {
	if err := r.client.SRem(ctx, KeyWorldOnline, playerID).Err(); err != nil {
		return fmt.Errorf("failed to set player %s offline: %w", playerID, err)
	}
	return nil
}

// RefreshPlayerTTL refreshes the player's session TTL.
func (r *worldStateRepository) RefreshPlayerTTL(ctx context.Context, playerID string) error {
	key := PlayerKey(playerID)
	if err := r.client.Expire(ctx, key, time.Duration(PlayerSessionTTLSecs)*time.Second).Err(); err != nil {
		return fmt.Errorf("failed to refresh player %s ttl: %w", playerID, err)
	}
	return nil
}

// GetPlayersAtPosition retrieves player IDs at a position.
func (r *worldStateRepository) GetPlayersAtPosition(ctx context.Context, pos entity.Position) ([]string, error) {
	key := PositionKey(pos.X, pos.Y)
	ids, err := r.client.SMembers(ctx, key).Result()
	if err != nil {
		return nil, fmt.Errorf("failed to get players at %s: %w", pos, err)
	}
	return ids, nil
}

// UpdatePlayerPosition atomically updates a player's position.
func (r *worldStateRepository) UpdatePlayerPosition(ctx context.Context, playerID string, oldPos, newPos entity.Position) error {
	oldKey := PositionKey(oldPos.X, oldPos.Y)
	newKey := PositionKey(newPos.X, newPos.Y)
	playerKey := PlayerKey(playerID)

	pipe := r.client.Pipeline()
	pipe.SRem(ctx, oldKey, playerID)
	pipe.SAdd(ctx, newKey, playerID)
	pipe.HSet(ctx, playerKey, "posX", newPos.X, "posY", newPos.Y, "lastPosX", oldPos.X, "lastPosY", oldPos.Y)
	_, err := pipe.Exec(ctx)
	if err != nil {
		return fmt.Errorf("failed to update player %s position: %w", playerID, err)
	}
	return nil
}

// GetMonster retrieves the monster state.
func (r *worldStateRepository) GetMonster(ctx context.Context) (*entity.Monster, error) {
	data, err := r.client.HGetAll(ctx, KeyMonster).Result()
	if err != nil {
		return nil, fmt.Errorf("failed to get monster: %w", err)
	}
	if len(data) == 0 {
		return nil, nil
	}

	damageMap, err := r.GetMonsterDamage(ctx)
	if err != nil {
		return nil, err
	}

	return hashToMonster(data, damageMap)
}

// SaveMonster saves the monster state.
func (r *worldStateRepository) SaveMonster(ctx context.Context, monster *entity.Monster) error {
	data := monsterToHash(monster)
	if err := r.client.HSet(ctx, KeyMonster, data).Err(); err != nil {
		return fmt.Errorf("failed to save monster: %w", err)
	}
	return nil
}

// GetMonsterDamage retrieves the damage map for the monster.
func (r *worldStateRepository) GetMonsterDamage(ctx context.Context) (map[string]int, error) {
	data, err := r.client.HGetAll(ctx, KeyMonsterDamage).Result()
	if err != nil {
		return nil, fmt.Errorf("failed to get monster damage: %w", err)
	}

	result := make(map[string]int, len(data))
	for playerID, dmgStr := range data {
		dmg, _ := strconv.Atoi(dmgStr)
		result[playerID] = dmg
	}
	return result, nil
}

// AddMonsterDamage adds damage dealt by a player.
func (r *worldStateRepository) AddMonsterDamage(ctx context.Context, playerID string, damage int) error {
	if err := r.client.HIncrBy(ctx, KeyMonsterDamage, playerID, int64(damage)).Err(); err != nil {
		return fmt.Errorf("failed to add monster damage: %w", err)
	}
	return nil
}

// ClearMonsterDamage clears the damage map.
func (r *worldStateRepository) ClearMonsterDamage(ctx context.Context) error {
	if err := r.client.Del(ctx, KeyMonsterDamage).Err(); err != nil {
		return fmt.Errorf("failed to clear monster damage: %w", err)
	}
	return nil
}

// GetCombatState retrieves a player's combat state.
func (r *worldStateRepository) GetCombatState(ctx context.Context, playerID string) (*repository.CombatState, error) {
	key := CombatKey(playerID)
	data, err := r.client.HGetAll(ctx, key).Result()
	if err != nil {
		return nil, fmt.Errorf("failed to get combat state for %s: %w", playerID, err)
	}
	if len(data) == 0 {
		return nil, nil
	}

	turn, _ := strconv.Atoi(data["turn"])
	active := data["active"] == "1"

	return &repository.CombatState{
		PlayerID: playerID,
		Turn:     turn,
		Active:   active,
	}, nil
}

// SaveCombatState saves a player's combat state.
func (r *worldStateRepository) SaveCombatState(ctx context.Context, state *repository.CombatState) error {
	key := CombatKey(state.PlayerID)
	activeVal := "0"
	if state.Active {
		activeVal = "1"
	}

	if err := r.client.HSet(ctx, key, map[string]interface{}{
		"turn":   state.Turn,
		"active": activeVal,
	}).Err(); err != nil {
		return fmt.Errorf("failed to save combat state for %s: %w", state.PlayerID, err)
	}
	return nil
}

// DeleteCombatState removes a player's combat state.
func (r *worldStateRepository) DeleteCombatState(ctx context.Context, playerID string) error {
	key := CombatKey(playerID)
	if err := r.client.Del(ctx, key).Err(); err != nil {
		return fmt.Errorf("failed to delete combat state for %s: %w", playerID, err)
	}
	return nil
}

// GetAllActiveCombats retrieves all active combat states.
func (r *worldStateRepository) GetAllActiveCombats(ctx context.Context) ([]*repository.CombatState, error) {
	onlineIDs, err := r.GetOnlinePlayerIDs(ctx)
	if err != nil {
		return nil, err
	}

	var combats []*repository.CombatState
	for _, playerID := range onlineIDs {
		state, err := r.GetCombatState(ctx, playerID)
		if err != nil {
			return nil, err
		}
		if state != nil && state.Active {
			combats = append(combats, state)
		}
	}
	return combats, nil
}

// IncrementCombatTurn increments the combat turn counter.
func (r *worldStateRepository) IncrementCombatTurn(ctx context.Context, playerID string) error {
	key := CombatKey(playerID)
	if err := r.client.HIncrBy(ctx, key, "turn", 1).Err(); err != nil {
		return fmt.Errorf("failed to increment combat turn for %s: %w", playerID, err)
	}
	return nil
}

// playerToHash converts a Player entity to a Redis hash map.
func playerToHash(p *entity.Player) map[string]interface{} {
	inCombat := "0"
	if p.InCombat {
		inCombat = "1"
	}
	return map[string]interface{}{
		"id":        p.ID,
		"name":      p.Name,
		"hp":        p.HP,
		"maxHp":     p.MaxHP,
		"attack":    p.Attack,
		"defense":   p.Defense,
		"exp":       p.EXP,
		"level":     p.Level,
		"posX":      p.Position.X,
		"posY":      p.Position.Y,
		"lastPosX":  p.LastPos.X,
		"lastPosY":  p.LastPos.Y,
		"inCombat":  inCombat,
		"updatedAt": p.UpdatedAt.UnixMilli(),
	}
}

// hashToPlayer converts a Redis hash map to a Player entity.
func hashToPlayer(data map[string]string) (*entity.Player, error) {
	hp, _ := strconv.Atoi(data["hp"])
	maxHp, _ := strconv.Atoi(data["maxHp"])
	attack, _ := strconv.Atoi(data["attack"])
	defense, _ := strconv.Atoi(data["defense"])
	exp, _ := strconv.Atoi(data["exp"])
	level, _ := strconv.Atoi(data["level"])
	posX, _ := strconv.Atoi(data["posX"])
	posY, _ := strconv.Atoi(data["posY"])
	lastPosX, _ := strconv.Atoi(data["lastPosX"])
	lastPosY, _ := strconv.Atoi(data["lastPosY"])
	updatedAtMs, _ := strconv.ParseInt(data["updatedAt"], 10, 64)

	pos, _ := entity.NewPosition(posX, posY)
	lastPos, _ := entity.NewPosition(lastPosX, lastPosY)

	return &entity.Player{
		ID:        data["id"],
		Name:      data["name"],
		HP:        hp,
		MaxHP:     maxHp,
		Attack:    attack,
		Defense:   defense,
		EXP:       exp,
		Level:     level,
		Position:  pos,
		LastPos:   lastPos,
		InCombat:  data["inCombat"] == "1",
		UpdatedAt: time.UnixMilli(updatedAtMs),
	}, nil
}

// monsterToHash converts a Monster entity to a Redis hash map.
func monsterToHash(m *entity.Monster) map[string]interface{} {
	alive := "0"
	if m.Alive {
		alive = "1"
	}
	respawnAt := int64(0)
	if !m.RespawnAt.IsZero() {
		respawnAt = m.RespawnAt.UnixMilli()
	}

	pos := m.GetPosition()
	hp := m.GetHP()

	return map[string]interface{}{
		"id":         m.ID,
		"name":       m.Name,
		"hp":         hp,
		"maxHp":      m.MaxHP,
		"attack":     m.Attack,
		"defense":    m.Defense,
		"posX":       pos.X,
		"posY":       pos.Y,
		"expReward":  m.ExpReward,
		"alive":      alive,
		"lastMoveHp": m.LastMoveHP,
		"respawnAt":  respawnAt,
	}
}

// hashToMonster converts a Redis hash map to a Monster entity.
func hashToMonster(data map[string]string, damageMap map[string]int) (*entity.Monster, error) {
	hp, _ := strconv.Atoi(data["hp"])
	maxHp, _ := strconv.Atoi(data["maxHp"])
	attack, _ := strconv.Atoi(data["attack"])
	defense, _ := strconv.Atoi(data["defense"])
	posX, _ := strconv.Atoi(data["posX"])
	posY, _ := strconv.Atoi(data["posY"])
	expReward, _ := strconv.Atoi(data["expReward"])
	lastMoveHp, _ := strconv.Atoi(data["lastMoveHp"])
	respawnAtMs, _ := strconv.ParseInt(data["respawnAt"], 10, 64)

	pos, _ := entity.NewPosition(posX, posY)

	var respawnAt time.Time
	if respawnAtMs > 0 {
		respawnAt = time.UnixMilli(respawnAtMs)
	}

	return &entity.Monster{
		ID:          data["id"],
		Name:        data["name"],
		HP:          hp,
		MaxHP:       maxHp,
		Attack:      attack,
		Defense:     defense,
		Position:    pos,
		ExpReward:   expReward,
		DamageDealt: damageMap,
		Alive:       data["alive"] == "1",
		LastMoveHP:  lastMoveHp,
		RespawnAt:   respawnAt,
	}, nil
}
