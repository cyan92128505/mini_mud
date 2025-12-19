package repository

import (
	"context"
	"time"

	"mini-mud/internal/domain/entity"
)

// CombatState represents a player's combat state.
type CombatState struct {
	PlayerID string
	Turn     int
	Active   bool
}

// WorldStateRepository defines the interface for world state persistence.
type WorldStateRepository interface {
	// Player state
	GetPlayer(ctx context.Context, id string) (*entity.Player, error)
	SavePlayer(ctx context.Context, player *entity.Player) error
	DeletePlayer(ctx context.Context, id string) error
	GetOnlinePlayers(ctx context.Context) ([]*entity.Player, error)
	GetOnlinePlayerIDs(ctx context.Context) ([]string, error)
	SetPlayerOnline(ctx context.Context, playerID string) error
	SetPlayerOffline(ctx context.Context, playerID string) error
	RefreshPlayerTTL(ctx context.Context, playerID string) error

	// Position index
	GetPlayersAtPosition(ctx context.Context, pos entity.Position) ([]string, error)
	UpdatePlayerPosition(ctx context.Context, playerID string, oldPos, newPos entity.Position) error

	// Monster state
	GetMonster(ctx context.Context) (*entity.Monster, error)
	SaveMonster(ctx context.Context, monster *entity.Monster) error
	GetMonsterDamage(ctx context.Context) (map[string]int, error)
	AddMonsterDamage(ctx context.Context, playerID string, damage int) error
	ClearMonsterDamage(ctx context.Context) error

	// Combat state
	GetCombatState(ctx context.Context, playerID string) (*CombatState, error)
	SaveCombatState(ctx context.Context, state *CombatState) error
	DeleteCombatState(ctx context.Context, playerID string) error
	GetAllActiveCombats(ctx context.Context) ([]*CombatState, error)
	IncrementCombatTurn(ctx context.Context, playerID string) error
}

// MonsterState represents the monster state for Redis storage.
type MonsterState struct {
	ID         string
	Name       string
	HP         int
	MaxHP      int
	Attack     int
	Defense    int
	PosX       int
	PosY       int
	ExpReward  int
	Alive      bool
	LastMoveHP int
	RespawnAt  time.Time
}
