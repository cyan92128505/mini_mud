package mysql

import (
	"context"
	"fmt"

	"mini-mud/internal/domain/entity"
	"mini-mud/internal/domain/repository"

	"gorm.io/gorm"
)

type playerRepository struct {
	db *gorm.DB
}

// NewPlayerRepository creates a new MySQL player repository.
func NewPlayerRepository(db *gorm.DB) repository.PlayerRepository {
	return &playerRepository{db: db}
}

func (r *playerRepository) FindByID(ctx context.Context, id string) (*entity.Player, error) {
	var model PlayerModel
	if err := r.db.WithContext(ctx).Where("id = ?", id).First(&model).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return nil, fmt.Errorf("player not found: %s", id)
		}
		return nil, fmt.Errorf("failed to find player: %w", err)
	}
	return modelToEntity(&model), nil
}

func (r *playerRepository) FindByName(ctx context.Context, name string) (*entity.Player, error) {
	var model PlayerModel
	if err := r.db.WithContext(ctx).Where("name = ?", name).First(&model).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return nil, fmt.Errorf("player not found: %s", name)
		}
		return nil, fmt.Errorf("failed to find player: %w", err)
	}
	return modelToEntity(&model), nil
}

func (r *playerRepository) FindAll(ctx context.Context) ([]*entity.Player, error) {
	var models []PlayerModel
	if err := r.db.WithContext(ctx).Find(&models).Error; err != nil {
		return nil, fmt.Errorf("failed to find players: %w", err)
	}

	players := make([]*entity.Player, len(models))
	for i, model := range models {
		players[i] = modelToEntity(&model)
	}
	return players, nil
}

func (r *playerRepository) Save(ctx context.Context, player *entity.Player) error {
	model := entityToModel(player)
	if err := r.db.WithContext(ctx).Save(model).Error; err != nil {
		return fmt.Errorf("failed to save player: %w", err)
	}
	return nil
}

func (r *playerRepository) Delete(ctx context.Context, id string) error {
	if err := r.db.WithContext(ctx).Where("id = ?", id).Delete(&PlayerModel{}).Error; err != nil {
		return fmt.Errorf("failed to delete player: %w", err)
	}
	return nil
}

func modelToEntity(m *PlayerModel) *entity.Player {
	pos, _ := entity.NewPosition(m.PosX, m.PosY)
	return &entity.Player{
		ID:        m.ID,
		Name:      m.Name,
		HP:        m.HP,
		MaxHP:     m.MaxHP,
		Attack:    m.Attack,
		Defense:   m.Defense,
		EXP:       m.EXP,
		Level:     m.Level,
		Position:  pos,
		LastPos:   pos,
		InCombat:  false,
		CreatedAt: m.CreatedAt,
		UpdatedAt: m.UpdatedAt,
	}
}

func entityToModel(e *entity.Player) *PlayerModel {
	return &PlayerModel{
		ID:        e.ID,
		Name:      e.Name,
		HP:        e.HP,
		MaxHP:     e.MaxHP,
		Attack:    e.Attack,
		Defense:   e.Defense,
		EXP:       e.EXP,
		Level:     e.Level,
		PosX:      e.Position.X,
		PosY:      e.Position.Y,
		CreatedAt: e.CreatedAt,
		UpdatedAt: e.UpdatedAt,
	}
}
