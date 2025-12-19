package sync

import (
	"context"
	"log"
	"time"

	"mini-mud/internal/domain/repository"
)

// PlayerSync handles periodic synchronization of player state from Redis to MySQL.
type PlayerSync struct {
	worldStateRepo repository.WorldStateRepository
	playerRepo     repository.PlayerRepository
	interval       time.Duration
	stopChan       chan struct{}
}

// NewPlayerSync creates a new player sync service.
func NewPlayerSync(
	worldStateRepo repository.WorldStateRepository,
	playerRepo repository.PlayerRepository,
	interval time.Duration,
) *PlayerSync {
	return &PlayerSync{
		worldStateRepo: worldStateRepo,
		playerRepo:     playerRepo,
		interval:       interval,
		stopChan:       make(chan struct{}),
	}
}

// Start starts the periodic sync loop.
func (s *PlayerSync) Start(ctx context.Context) {
	go s.syncLoop(ctx)
}

// Stop stops the sync loop.
func (s *PlayerSync) Stop() {
	close(s.stopChan)
}

// syncLoop periodically syncs online players to MySQL.
func (s *PlayerSync) syncLoop(ctx context.Context) {
	ticker := time.NewTicker(s.interval)
	defer ticker.Stop()

	for {
		select {
		case <-ctx.Done():
			return
		case <-s.stopChan:
			return
		case <-ticker.C:
			s.syncPlayers(ctx)
		}
	}
}

// syncPlayers syncs all online players from Redis to MySQL.
func (s *PlayerSync) syncPlayers(ctx context.Context) {
	players, err := s.worldStateRepo.GetOnlinePlayers(ctx)
	if err != nil {
		log.Printf("player sync: failed to get online players: %v", err)
		return
	}

	if len(players) == 0 {
		return
	}

	syncedCount := 0
	for _, player := range players {
		if err := s.playerRepo.Save(ctx, player); err != nil {
			log.Printf("player sync: failed to save player %s: %v", player.ID, err)
			continue
		}
		syncedCount++
	}

	log.Printf("player sync: synced %d/%d players to MySQL", syncedCount, len(players))
}

// SyncNow performs an immediate sync of all online players.
func (s *PlayerSync) SyncNow(ctx context.Context) error {
	s.syncPlayers(ctx)
	return nil
}
