package repository

import (
	"context"
	"mini-mud/internal/domain/entity"
)

// PlayerRepository defines the interface for player persistence.
type PlayerRepository interface {
	// FindByID retrieves a player by ID.
	FindByID(ctx context.Context, id string) (*entity.Player, error)

	// FindByName retrieves a player by name.
	FindByName(ctx context.Context, name string) (*entity.Player, error)

	// FindAll retrieves all players.
	FindAll(ctx context.Context) ([]*entity.Player, error)

	// Save creates or updates a player.
	Save(ctx context.Context, player *entity.Player) error

	// Delete removes a player.
	Delete(ctx context.Context, id string) error
}
