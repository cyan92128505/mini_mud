package entity

import (
	"sync"
	"time"
)

// Monster represents a monster in the game.
type Monster struct {
	ID              string
	Name            string
	HP              int
	MaxHP           int
	Attack          int
	Defense         int
	Position        Position
	ExpReward       int
	DamageDealt     map[string]int // playerID -> cumulative damage dealt by player
	Alive           bool
	LastMoveHP      int // HP when monster last moved (for 10% threshold)
	RespawnAt       time.Time
	mu              sync.RWMutex
}

// Monster stats.
const (
	MonsterMaxHP     = 500
	MonsterAttack    = 15
	MonsterDefense   = 8
	MonsterExpReward = 200
	RespawnDelay     = 30 * time.Second
	MoveThreshold    = 0.1 // 10% HP loss triggers move
)

// NewMonster creates a new monster at a random position (not town).
func NewMonster(id, name string) *Monster {
	pos := randomNonTownPosition()
	return &Monster{
		ID:          id,
		Name:        name,
		HP:          MonsterMaxHP,
		MaxHP:       MonsterMaxHP,
		Attack:      MonsterAttack,
		Defense:     MonsterDefense,
		Position:    pos,
		ExpReward:   MonsterExpReward,
		DamageDealt: make(map[string]int),
		Alive:       true,
		LastMoveHP:  MonsterMaxHP,
	}
}

// randomNonTownPosition generates a random position that is not the town.
func randomNonTownPosition() Position {
	for {
		pos, _ := NewPosition(randomInt(MapSize), randomInt(MapSize))
		if !pos.IsTown() {
			return pos
		}
	}
}

// randomInt returns a random int in [0, max).
func randomInt(max int) int {
	// Simple implementation; in production, use proper random source
	return int(time.Now().UnixNano() % int64(max))
}

// TakeDamage applies damage from a player and returns the actual damage dealt.
// Also checks if the monster should move.
func (m *Monster) TakeDamage(playerID string, damage int) (actualDamage int, shouldMove bool, died bool) {
	m.mu.Lock()
	defer m.mu.Unlock()

	if !m.Alive || damage < 0 {
		return 0, false, false
	}

	actualDamage = damage
	if actualDamage > m.HP {
		actualDamage = m.HP
	}

	m.HP -= actualDamage
	m.DamageDealt[playerID] += actualDamage

	// Check if monster should move (lost 10% of MaxHP since last move)
	threshold := int(float64(m.MaxHP) * MoveThreshold)
	if m.LastMoveHP-m.HP >= threshold && m.HP > 0 {
		shouldMove = true
		m.LastMoveHP = m.HP
	}

	if m.HP <= 0 {
		died = true
		m.Alive = false
	}

	return actualDamage, shouldMove, died
}

// Move moves the monster to a random adjacent position.
func (m *Monster) Move() bool {
	m.mu.Lock()
	defer m.mu.Unlock()

	newPos, ok := m.Position.RandomAdjacentPosition(true) // exclude town
	if !ok {
		return false
	}
	m.Position = newPos
	return true
}

// GetPosition returns the current position (thread-safe).
func (m *Monster) GetPosition() Position {
	m.mu.RLock()
	defer m.mu.RUnlock()
	return m.Position
}

// GetHP returns the current HP (thread-safe).
func (m *Monster) GetHP() int {
	m.mu.RLock()
	defer m.mu.RUnlock()
	return m.HP
}

// IsAlive returns whether the monster is alive (thread-safe).
func (m *Monster) IsAlive() bool {
	m.mu.RLock()
	defer m.mu.RUnlock()
	return m.Alive
}

// Kill marks the monster as dead and sets respawn time.
func (m *Monster) Kill() {
	m.mu.Lock()
	defer m.mu.Unlock()
	m.Alive = false
	m.RespawnAt = time.Now().Add(RespawnDelay)
}

// Respawn resets the monster to full HP at a new position.
func (m *Monster) Respawn() {
	m.mu.Lock()
	defer m.mu.Unlock()
	m.HP = m.MaxHP
	m.LastMoveHP = m.MaxHP
	m.Position = randomNonTownPosition()
	m.DamageDealt = make(map[string]int)
	m.Alive = true
	m.RespawnAt = time.Time{}
}

// ShouldRespawn checks if it's time to respawn.
func (m *Monster) ShouldRespawn() bool {
	m.mu.RLock()
	defer m.mu.RUnlock()
	return !m.Alive && !m.RespawnAt.IsZero() && time.Now().After(m.RespawnAt)
}

// GetDamageContribution returns the damage dealt by a specific player.
func (m *Monster) GetDamageContribution(playerID string) int {
	m.mu.RLock()
	defer m.mu.RUnlock()
	return m.DamageDealt[playerID]
}

// GetTotalDamage returns the total damage dealt by all players.
func (m *Monster) GetTotalDamage() int {
	m.mu.RLock()
	defer m.mu.RUnlock()
	total := 0
	for _, d := range m.DamageDealt {
		total += d
	}
	return total
}

// CalculateExpReward calculates the EXP reward for a player based on damage contribution.
func (m *Monster) CalculateExpReward(playerID string) int {
	m.mu.RLock()
	defer m.mu.RUnlock()

	totalDamage := 0
	for _, d := range m.DamageDealt {
		totalDamage += d
	}
	if totalDamage == 0 {
		return 0
	}

	playerDamage := m.DamageDealt[playerID]
	return (playerDamage * m.ExpReward) / totalDamage
}

// GetAllDamageContributors returns all player IDs who dealt damage.
func (m *Monster) GetAllDamageContributors() []string {
	m.mu.RLock()
	defer m.mu.RUnlock()

	players := make([]string, 0, len(m.DamageDealt))
	for playerID := range m.DamageDealt {
		players = append(players, playerID)
	}
	return players
}

// CalculateDamage calculates damage dealt to a target with given defense.
func (m *Monster) CalculateDamage(targetDefense int) int {
	damage := m.Attack - targetDefense
	if damage < 1 {
		damage = 1
	}
	return damage
}
