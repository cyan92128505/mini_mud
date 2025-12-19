package service

import (
	"context"
	"fmt"

	"github.com/google/uuid"

	"mini-mud/internal/domain/entity"
	"mini-mud/internal/domain/repository"
)

// PlayerService handles player-related operations.
type PlayerService struct {
	repo repository.PlayerRepository
}

// NewPlayerService creates a new player service.
func NewPlayerService(repo repository.PlayerRepository) *PlayerService {
	return &PlayerService{repo: repo}
}

// CreatePlayer creates a new player.
func (s *PlayerService) CreatePlayer(ctx context.Context, name string) (*entity.Player, error) {
	// Check if name is taken
	existing, err := s.repo.FindByName(ctx, name)
	if err == nil && existing != nil {
		return nil, fmt.Errorf("player name already taken: %s", name)
	}

	id := uuid.New().String()
	player := entity.NewPlayer(id, name)

	if err := s.repo.Save(ctx, player); err != nil {
		return nil, fmt.Errorf("failed to create player: %w", err)
	}

	return player, nil
}

// GetPlayer retrieves a player by ID.
func (s *PlayerService) GetPlayer(ctx context.Context, id string) (*entity.Player, error) {
	return s.repo.FindByID(ctx, id)
}

// GetPlayerByName retrieves a player by name.
func (s *PlayerService) GetPlayerByName(ctx context.Context, name string) (*entity.Player, error) {
	return s.repo.FindByName(ctx, name)
}

// SavePlayer persists player state.
func (s *PlayerService) SavePlayer(ctx context.Context, player *entity.Player) error {
	return s.repo.Save(ctx, player)
}

// DeletePlayer removes a player.
func (s *PlayerService) DeletePlayer(ctx context.Context, id string) error {
	return s.repo.Delete(ctx, id)
}

// GetOrCreatePlayer gets an existing player or creates a new one.
func (s *PlayerService) GetOrCreatePlayer(ctx context.Context, name string) (*entity.Player, bool, error) {
	player, err := s.repo.FindByName(ctx, name)
	if err == nil && player != nil {
		return player, false, nil
	}

	player, err = s.CreatePlayer(ctx, name)
	if err != nil {
		return nil, false, err
	}
	return player, true, nil
}
