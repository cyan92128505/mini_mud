package entity

import (
	"fmt"
	"time"
)

// Player represents a player in the game.
type Player struct {
	ID        string
	Name      string
	HP        int
	MaxHP     int
	Attack    int
	Defense   int
	EXP       int
	Level     int
	Position  Position
	LastPos   Position
	InCombat  bool
	CreatedAt time.Time
	UpdatedAt time.Time
}

// Base stats for a new player.
const (
	BaseHP      = 100
	BaseAttack  = 10
	BaseDefense = 5
	ExpPerLevel = 100
	MaxLevel    = 50
)

// NewPlayer creates a new player with default stats at town.
func NewPlayer(id, name string) *Player {
	now := time.Now()
	return &Player{
		ID:        id,
		Name:      name,
		HP:        BaseHP,
		MaxHP:     BaseHP,
		Attack:    BaseAttack,
		Defense:   BaseDefense,
		EXP:       0,
		Level:     1,
		Position:  TownPosition,
		LastPos:   TownPosition,
		InCombat:  false,
		CreatedAt: now,
		UpdatedAt: now,
	}
}

// MoveTo moves the player to a new position.
func (p *Player) MoveTo(pos Position) error {
	if !pos.IsValid() {
		return fmt.Errorf("invalid position: %s", pos)
	}
	if p.InCombat {
		return fmt.Errorf("cannot move while in combat")
	}
	p.LastPos = p.Position
	p.Position = pos
	p.UpdatedAt = time.Now()
	return nil
}

// EnterCombat marks the player as in combat.
func (p *Player) EnterCombat() {
	p.InCombat = true
	p.UpdatedAt = time.Now()
}

// LeaveCombat marks the player as out of combat.
func (p *Player) LeaveCombat() {
	p.InCombat = false
	p.UpdatedAt = time.Now()
}

// Retreat moves the player back to their last position and exits combat.
func (p *Player) Retreat() {
	p.Position = p.LastPos
	p.InCombat = false
	p.UpdatedAt = time.Now()
}

// TakeDamage reduces the player's HP and returns the actual damage taken.
func (p *Player) TakeDamage(damage int) int {
	if damage < 0 {
		damage = 0
	}
	actualDamage := damage
	if actualDamage > p.HP {
		actualDamage = p.HP
	}
	p.HP -= actualDamage
	p.UpdatedAt = time.Now()
	return actualDamage
}

// Heal restores HP up to MaxHP and returns the amount healed.
func (p *Player) Heal(amount int) int {
	if amount < 0 {
		amount = 0
	}
	actualHeal := amount
	if p.HP+actualHeal > p.MaxHP {
		actualHeal = p.MaxHP - p.HP
	}
	p.HP += actualHeal
	p.UpdatedAt = time.Now()
	return actualHeal
}

// IsDead returns true if the player's HP is zero or less.
func (p *Player) IsDead() bool {
	return p.HP <= 0
}

// Die handles player death: reset EXP, respawn at town, exit combat.
func (p *Player) Die() {
	p.EXP = 0
	p.HP = p.MaxHP
	p.Position = TownPosition
	p.LastPos = TownPosition
	p.InCombat = false
	p.UpdatedAt = time.Now()
}

// AddEXP adds experience points and handles leveling up.
// Returns true if the player leveled up.
func (p *Player) AddEXP(exp int) bool {
	if exp <= 0 || p.Level >= MaxLevel {
		return false
	}
	p.EXP += exp
	p.UpdatedAt = time.Now()

	leveledUp := false
	for p.EXP >= p.ExpToNextLevel() && p.Level < MaxLevel {
		p.EXP -= p.ExpToNextLevel()
		p.levelUp()
		leveledUp = true
	}
	return leveledUp
}

// ExpToNextLevel returns the EXP needed for the next level.
func (p *Player) ExpToNextLevel() int {
	return ExpPerLevel * p.Level
}

// levelUp increases the player's level and stats.
func (p *Player) levelUp() {
	p.Level++
	p.MaxHP += 10
	p.HP = p.MaxHP
	p.Attack += 2
	p.Defense += 1
}

// CalculateDamage calculates damage dealt to a target with given defense.
func (p *Player) CalculateDamage(targetDefense int) int {
	damage := p.Attack - targetDefense
	if damage < 1 {
		damage = 1
	}
	return damage
}
