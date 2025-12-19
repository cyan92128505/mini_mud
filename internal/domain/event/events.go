package event

import (
	"mini-mud/internal/domain/entity"
	"time"
)

// EventType represents the type of game event.
type EventType string

const (
	EventPlayerJoined   EventType = "player_joined"
	EventPlayerLeft     EventType = "player_left"
	EventPlayerMoved    EventType = "player_moved"
	EventPlayerDied     EventType = "player_died"
	EventPlayerLevelUp  EventType = "player_level_up"
	EventCombatStarted  EventType = "combat_started"
	EventCombatTurn     EventType = "combat_turn"
	EventCombatEnded    EventType = "combat_ended"
	EventMonsterMoved   EventType = "monster_moved"
	EventMonsterDied    EventType = "monster_died"
	EventMonsterSpawned EventType = "monster_spawned"
)

// CombatEndReason represents why combat ended.
type CombatEndReason string

const (
	CombatEndRetreat  CombatEndReason = "retreat"
	CombatEndDeath    CombatEndReason = "death"
	CombatEndVictory  CombatEndReason = "victory"
)

// Event is the base interface for all game events.
type Event interface {
	Type() EventType
	Timestamp() time.Time
}

// BaseEvent contains common event fields.
type BaseEvent struct {
	EventType EventType
	Time      time.Time
}

func (e BaseEvent) Type() EventType   { return e.EventType }
func (e BaseEvent) Timestamp() time.Time { return e.Time }

// PlayerJoinedEvent is emitted when a player joins the game.
type PlayerJoinedEvent struct {
	BaseEvent
	PlayerID   string
	PlayerName string
	Position   entity.Position
}

// PlayerLeftEvent is emitted when a player leaves the game.
type PlayerLeftEvent struct {
	BaseEvent
	PlayerID string
}

// PlayerMovedEvent is emitted when a player moves.
type PlayerMovedEvent struct {
	BaseEvent
	PlayerID string
	From     entity.Position
	To       entity.Position
}

// PlayerDiedEvent is emitted when a player dies.
type PlayerDiedEvent struct {
	BaseEvent
	PlayerID string
}

// PlayerLevelUpEvent is emitted when a player levels up.
type PlayerLevelUpEvent struct {
	BaseEvent
	PlayerID string
	NewLevel int
}

// CombatStartedEvent is emitted when combat begins.
type CombatStartedEvent struct {
	BaseEvent
	PlayerID  string
	MonsterID string
}

// CombatTurnEvent is emitted after each combat turn.
type CombatTurnEvent struct {
	BaseEvent
	PlayerID       string
	MonsterID      string
	PlayerDamage   int
	MonsterDamage  int
	PlayerHP       int
	PlayerMaxHP    int
	MonsterHP      int
	MonsterMaxHP   int
	Turn           int
}

// CombatEndedEvent is emitted when combat ends.
type CombatEndedEvent struct {
	BaseEvent
	PlayerID  string
	MonsterID string
	Reason    CombatEndReason
	ExpGained int
}

// MonsterMovedEvent is emitted when a monster moves.
type MonsterMovedEvent struct {
	BaseEvent
	MonsterID string
	From      entity.Position
	To        entity.Position
}

// MonsterDiedEvent is emitted when a monster dies.
type MonsterDiedEvent struct {
	BaseEvent
	MonsterID    string
	KillerID     string
	Contributors []string
}

// MonsterSpawnedEvent is emitted when a monster spawns.
type MonsterSpawnedEvent struct {
	BaseEvent
	MonsterID string
	Position  entity.Position
}

// NewPlayerJoinedEvent creates a new PlayerJoinedEvent.
func NewPlayerJoinedEvent(playerID, playerName string, pos entity.Position) *PlayerJoinedEvent {
	return &PlayerJoinedEvent{
		BaseEvent:  BaseEvent{EventType: EventPlayerJoined, Time: time.Now()},
		PlayerID:   playerID,
		PlayerName: playerName,
		Position:   pos,
	}
}

// NewPlayerLeftEvent creates a new PlayerLeftEvent.
func NewPlayerLeftEvent(playerID string) *PlayerLeftEvent {
	return &PlayerLeftEvent{
		BaseEvent: BaseEvent{EventType: EventPlayerLeft, Time: time.Now()},
		PlayerID:  playerID,
	}
}

// NewPlayerMovedEvent creates a new PlayerMovedEvent.
func NewPlayerMovedEvent(playerID string, from, to entity.Position) *PlayerMovedEvent {
	return &PlayerMovedEvent{
		BaseEvent: BaseEvent{EventType: EventPlayerMoved, Time: time.Now()},
		PlayerID:  playerID,
		From:      from,
		To:        to,
	}
}

// NewPlayerDiedEvent creates a new PlayerDiedEvent.
func NewPlayerDiedEvent(playerID string) *PlayerDiedEvent {
	return &PlayerDiedEvent{
		BaseEvent: BaseEvent{EventType: EventPlayerDied, Time: time.Now()},
		PlayerID:  playerID,
	}
}

// NewPlayerLevelUpEvent creates a new PlayerLevelUpEvent.
func NewPlayerLevelUpEvent(playerID string, newLevel int) *PlayerLevelUpEvent {
	return &PlayerLevelUpEvent{
		BaseEvent: BaseEvent{EventType: EventPlayerLevelUp, Time: time.Now()},
		PlayerID:  playerID,
		NewLevel:  newLevel,
	}
}

// NewCombatStartedEvent creates a new CombatStartedEvent.
func NewCombatStartedEvent(playerID, monsterID string) *CombatStartedEvent {
	return &CombatStartedEvent{
		BaseEvent: BaseEvent{EventType: EventCombatStarted, Time: time.Now()},
		PlayerID:  playerID,
		MonsterID: monsterID,
	}
}

// NewCombatTurnEvent creates a new CombatTurnEvent.
func NewCombatTurnEvent(playerID, monsterID string, playerDmg, monsterDmg, playerHP, playerMaxHP, monsterHP, monsterMaxHP, turn int) *CombatTurnEvent {
	return &CombatTurnEvent{
		BaseEvent:      BaseEvent{EventType: EventCombatTurn, Time: time.Now()},
		PlayerID:       playerID,
		MonsterID:      monsterID,
		PlayerDamage:   playerDmg,
		MonsterDamage:  monsterDmg,
		PlayerHP:       playerHP,
		PlayerMaxHP:    playerMaxHP,
		MonsterHP:      monsterHP,
		MonsterMaxHP:   monsterMaxHP,
		Turn:           turn,
	}
}

// NewCombatEndedEvent creates a new CombatEndedEvent.
func NewCombatEndedEvent(playerID, monsterID string, reason CombatEndReason, expGained int) *CombatEndedEvent {
	return &CombatEndedEvent{
		BaseEvent: BaseEvent{EventType: EventCombatEnded, Time: time.Now()},
		PlayerID:  playerID,
		MonsterID: monsterID,
		Reason:    reason,
		ExpGained: expGained,
	}
}

// NewMonsterMovedEvent creates a new MonsterMovedEvent.
func NewMonsterMovedEvent(monsterID string, from, to entity.Position) *MonsterMovedEvent {
	return &MonsterMovedEvent{
		BaseEvent: BaseEvent{EventType: EventMonsterMoved, Time: time.Now()},
		MonsterID: monsterID,
		From:      from,
		To:        to,
	}
}

// NewMonsterDiedEvent creates a new MonsterDiedEvent.
func NewMonsterDiedEvent(monsterID, killerID string, contributors []string) *MonsterDiedEvent {
	return &MonsterDiedEvent{
		BaseEvent:    BaseEvent{EventType: EventMonsterDied, Time: time.Now()},
		MonsterID:    monsterID,
		KillerID:     killerID,
		Contributors: contributors,
	}
}

// NewMonsterSpawnedEvent creates a new MonsterSpawnedEvent.
func NewMonsterSpawnedEvent(monsterID string, pos entity.Position) *MonsterSpawnedEvent {
	return &MonsterSpawnedEvent{
		BaseEvent: BaseEvent{EventType: EventMonsterSpawned, Time: time.Now()},
		MonsterID: monsterID,
		Position:  pos,
	}
}
