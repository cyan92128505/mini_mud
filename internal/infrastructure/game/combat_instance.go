package game

import (
	"sync"
)

// CombatInstance represents a player's combat state.
type CombatInstance struct {
	PlayerID string
	Turn     int
	IsActive bool
}

// CombatManager manages all active combat instances.
type CombatManager struct {
	instances map[string]*CombatInstance
	mu        sync.RWMutex
}

// NewCombatManager creates a new combat manager.
func NewCombatManager() *CombatManager {
	return &CombatManager{
		instances: make(map[string]*CombatInstance),
	}
}

// StartCombat starts a new combat instance for a player.
func (m *CombatManager) StartCombat(playerID string) *CombatInstance {
	m.mu.Lock()
	defer m.mu.Unlock()

	instance := &CombatInstance{
		PlayerID: playerID,
		Turn:     1,
		IsActive: true,
	}
	m.instances[playerID] = instance
	return instance
}

// GetCombat returns the combat instance for a player.
func (m *CombatManager) GetCombat(playerID string) (*CombatInstance, bool) {
	m.mu.RLock()
	defer m.mu.RUnlock()

	instance, ok := m.instances[playerID]
	return instance, ok
}

// EndCombat ends the combat instance for a player.
func (m *CombatManager) EndCombat(playerID string) {
	m.mu.Lock()
	defer m.mu.Unlock()

	delete(m.instances, playerID)
}

// EndAllCombats ends all active combat instances.
func (m *CombatManager) EndAllCombats() []string {
	m.mu.Lock()
	defer m.mu.Unlock()

	playerIDs := make([]string, 0, len(m.instances))
	for playerID := range m.instances {
		playerIDs = append(playerIDs, playerID)
	}
	m.instances = make(map[string]*CombatInstance)
	return playerIDs
}

// NextTurn advances the turn counter for a combat instance.
func (m *CombatManager) NextTurn(playerID string) int {
	m.mu.Lock()
	defer m.mu.Unlock()

	if instance, ok := m.instances[playerID]; ok {
		instance.Turn++
		return instance.Turn
	}
	return 0
}

// GetActiveCombatCount returns the number of active combats.
func (m *CombatManager) GetActiveCombatCount() int {
	m.mu.RLock()
	defer m.mu.RUnlock()
	return len(m.instances)
}

// GetAllActivePlayers returns all player IDs currently in combat.
func (m *CombatManager) GetAllActivePlayers() []string {
	m.mu.RLock()
	defer m.mu.RUnlock()

	players := make([]string, 0, len(m.instances))
	for playerID := range m.instances {
		players = append(players, playerID)
	}
	return players
}
