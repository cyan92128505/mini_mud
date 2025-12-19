package redis

import "fmt"

// Redis key patterns for world state.
const (
	KeyPrefixPlayer      = "player:"
	KeyPrefixCombat      = "combat:"
	KeyPrefixWorldPos    = "world:pos:"
	KeyWorldOnline       = "world:online"
	KeyMonster           = "monster:main"
	KeyMonsterDamage     = "monster:main:damage"
	KeyEventsStream      = "events:game"
	KeyEventsConsumer    = "events:consumer"
	ChannelWorld         = "ch:world"
	ChannelCombat        = "ch:combat"
	ChannelMovement      = "ch:movement"
	EventsStreamMaxLen   = 10000
	PlayerSessionTTLSecs = 3600 // 1 hour
)

// PlayerKey returns the Redis key for a player.
func PlayerKey(playerID string) string {
	return KeyPrefixPlayer + playerID
}

// CombatKey returns the Redis key for a player's combat state.
func CombatKey(playerID string) string {
	return KeyPrefixCombat + playerID
}

// PositionKey returns the Redis key for a position's player set.
func PositionKey(x, y int) string {
	return fmt.Sprintf("%s%d:%d", KeyPrefixWorldPos, x, y)
}
