# Mini-MUD

A minimalist multiplayer dungeon game server built with Go, featuring Redis-backed world state for horizontal scaling.

## Architecture

```
┌─────────────────┐     ┌─────────────────┐
│  Game Server 1  │     │  Game Server N  │
└────────┬────────┘     └────────┬────────┘
         │                       │
         └───────────┬───────────┘
                     │
              ┌──────▼──────┐
              │    Redis    │  ← World state (real-time)
              └──────┬──────┘
                     │
              ┌──────▼──────┐
              │    MySQL    │  ← Player persistence (backup)
              └─────────────┘
```

### Tech Stack

- **Go 1.24+** - Server runtime
- **gRPC + Protobuf** - Client-server communication
- **Redis** - Real-time world state storage
- **MySQL 8.0** - Persistent player data
- **GORM v2** - ORM for MySQL
- **Docker Compose** - Container orchestration

## Project Structure

```
mini-mud/
├── cmd/server/main.go           # Server entrypoint
├── internal/
│   ├── domain/                  # Business logic (no dependencies)
│   │   ├── entity/              # Player, Monster, Position
│   │   ├── repository/          # Repository interfaces
│   │   └── event/               # Domain events
│   ├── application/service/     # Use cases (GameService, PlayerService)
│   ├── infrastructure/
│   │   ├── game/                # World state management
│   │   └── persistence/
│   │       ├── mysql/           # MySQL repositories
│   │       ├── redis/           # Redis world state
│   │       └── sync/            # MySQL backup sync
│   └── interfaces/grpc/         # gRPC handlers
├── api/proto/                   # Protobuf definitions
├── configs/config.yaml          # Configuration
├── deployments/
│   ├── Dockerfile
│   └── docker-compose.yml
└── migrations/                  # Database migrations
```

## Quick Start

### Prerequisites

- Go 1.24+
- Docker & Docker Compose
- Make (optional)

### Run with Docker

```bash
cd deployments
docker-compose up -d
```

This starts:
- MySQL on port 3306
- Redis on port 6379
- Game server on port 50051

### Run Locally

1. Start dependencies:
```bash
cd deployments
docker-compose up -d mysql redis
```

2. Run the server:
```bash
go run ./cmd/server
```

## Configuration

### Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `DB_HOST` | localhost | MySQL host |
| `DB_PORT` | 3306 | MySQL port |
| `DB_USER` | root | MySQL user |
| `DB_PASSWORD` | (empty) | MySQL password |
| `DB_NAME` | mini_mud | Database name |
| `REDIS_HOST` | localhost | Redis host |
| `REDIS_PORT` | 6379 | Redis port |
| `REDIS_PASSWORD` | (empty) | Redis password |
| `REDIS_DB` | 0 | Redis database index |
| `GRPC_PORT` | 50051 | gRPC server port |
| `SYNC_INTERVAL_SECONDS` | 300 | MySQL backup interval |

## Game Mechanics

### World

- 11x11 grid map (0-10 on both axes)
- Town at position (5, 5) - safe zone
- One monster roaming the map

### Player

- Spawns at town with 100 HP
- Stats: HP, Attack, Defense, Level, EXP
- Gains EXP from combat, levels up for stat bonuses
- Dies: loses EXP, respawns at town

### Combat

- Triggered when player enters monster's tile
- Turn-based: player attacks, then monster counter-attacks
- Monster moves after taking 10% HP damage
- Multiple players can fight the same monster
- EXP distributed based on damage contribution

### Monster

- 500 HP, respawns 30 seconds after death
- Spawns at random non-town position
- Rewards 200 base EXP (split by contribution)

## Redis Data Model

```
player:{id}         HASH   - Full player state
combat:{id}         HASH   - Combat instance
world:online        SET    - Online player IDs
world:pos:{x}:{y}   SET    - Players at position
monster:main        HASH   - Monster state
monster:main:damage HASH   - Damage tracking
events:game         STREAM - Event log
```

## gRPC API

### Services

| Method | Description |
|--------|-------------|
| `Connect` | Join game with player name |
| `Disconnect` | Leave game |
| `Move` | Move in direction (UP/DOWN/LEFT/RIGHT) |
| `Attack` | Attack monster (when in combat) |
| `Retreat` | Flee from combat |
| `GetPlayerStatus` | Get current player state |
| `GetMap` | Get world state (players + monster) |
| `Subscribe` | Stream game events |

### Events

- `PlayerJoined`, `PlayerLeft`, `PlayerMoved`, `PlayerDied`, `PlayerLevelUp`
- `CombatStarted`, `CombatTurn`, `CombatEnded`
- `MonsterMoved`, `MonsterDied`, `MonsterSpawned`

## Development

### Build

```bash
go build -o bin/server ./cmd/server
```

### Test

```bash
go test -race -cover ./...
```

### Generate Protobuf

```bash
protoc --go_out=. --go-grpc_out=. api/proto/**/*.proto
```

### Lint

```bash
golangci-lint run
```

## License

MIT
