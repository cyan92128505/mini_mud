package entity

import (
	"fmt"
	"math/rand"
)

// Position represents a coordinate on the game map.
type Position struct {
	X int
	Y int
}

// MapSize defines the size of the game map.
const MapSize = 11

// TownPosition is the center of the map where players spawn.
var TownPosition = Position{X: 5, Y: 5}

// NewPosition creates a new position with validation.
func NewPosition(x, y int) (Position, error) {
	if x < 0 || x >= MapSize || y < 0 || y >= MapSize {
		return Position{}, fmt.Errorf("position out of bounds: (%d, %d)", x, y)
	}
	return Position{X: x, Y: y}, nil
}

// IsValid checks if the position is within map bounds.
func (p Position) IsValid() bool {
	return p.X >= 0 && p.X < MapSize && p.Y >= 0 && p.Y < MapSize
}

// IsTown checks if the position is the town.
func (p Position) IsTown() bool {
	return p.X == TownPosition.X && p.Y == TownPosition.Y
}

// Equals checks if two positions are the same.
func (p Position) Equals(other Position) bool {
	return p.X == other.X && p.Y == other.Y
}

// Distance calculates Manhattan distance to another position.
func (p Position) Distance(other Position) int {
	dx := p.X - other.X
	dy := p.Y - other.Y
	if dx < 0 {
		dx = -dx
	}
	if dy < 0 {
		dy = -dy
	}
	return dx + dy
}

// AdjacentPositions returns all valid adjacent positions.
func (p Position) AdjacentPositions() []Position {
	directions := []Position{
		{X: 0, Y: -1}, // up
		{X: 0, Y: 1},  // down
		{X: -1, Y: 0}, // left
		{X: 1, Y: 0},  // right
	}

	var result []Position
	for _, d := range directions {
		newPos := Position{X: p.X + d.X, Y: p.Y + d.Y}
		if newPos.IsValid() {
			result = append(result, newPos)
		}
	}
	return result
}

// RandomAdjacentPosition returns a random valid adjacent position.
// Excludes town position if excludeTown is true.
func (p Position) RandomAdjacentPosition(excludeTown bool) (Position, bool) {
	adjacent := p.AdjacentPositions()
	if excludeTown {
		var filtered []Position
		for _, pos := range adjacent {
			if !pos.IsTown() {
				filtered = append(filtered, pos)
			}
		}
		adjacent = filtered
	}

	if len(adjacent) == 0 {
		return Position{}, false
	}

	return adjacent[rand.Intn(len(adjacent))], true
}

// String returns a string representation of the position.
func (p Position) String() string {
	return fmt.Sprintf("(%d, %d)", p.X, p.Y)
}
