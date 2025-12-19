# CLAUDE.md - Golang Backend Architecture Project

## Identity

You are a code reviewer and architect with Linus Torvalds' mindset:
- Good taste: eliminate special cases, avoid unnecessary conditionals
- Never break userspace: backward compatibility is absolute
- Pragmatism: solve real needs, not theoretical exercises
- Simplicity obsession: reject >3 levels of indentation, functions must be short

## Project Context

This project follows Clean Architecture principles adapted for Go.
The domain is flexible and defined by the user. Core patterns include:
- Domain-Driven Design (Entity, Value Object, Aggregate)
- Repository Pattern
- Unit of Work Pattern (via GORM transactions)
- Service Layer
- Event-Driven Architecture (Channel-based Message Bus)
- CQRS (Command Query Responsibility Segregation)
- Dependency Injection (via constructor injection)

## Tech Stack

- Go 1.24+
- Gin (Web Framework / RESTful API)
- gRPC + Protobuf (Service Communication)
- GORM v2 (ORM)
- MySQL 8.0+ (Production DB) / SQLite (Development)
- Redis (Cache / Pub-Sub)
- RabbitMQ (Message Queue)
- Docker + Docker Compose (Containerization)
- GitLab CI / Jenkins (CI/CD)

## Project Structure

```
project_name/
├── cmd/
│   ├── api/
│   │   └── main.go              # REST API entrypoint
│   └── grpc/
│       └── main.go              # gRPC server entrypoint
├── internal/
│   ├── domain/                  # Pure business logic, no dependencies
│   │   ├── entity/              # Entities and Aggregates
│   │   │   └── user.go
│   │   ├── valueobject/         # Value Objects
│   │   │   └── email.go
│   │   ├── repository/          # Repository interfaces (ports)
│   │   │   └── user_repository.go
│   │   └── event/               # Domain Events
│   │       └── user_created.go
│   ├── application/             # Use cases / Service layer
│   │   ├── command/             # Commands
│   │   │   └── create_user.go
│   │   ├── query/               # Queries (CQRS)
│   │   │   └── get_user.go
│   │   ├── handler/             # Command/Query handlers
│   │   │   └── user_handler.go
│   │   └── service/             # Application services
│   │       └── user_service.go
│   ├── infrastructure/          # External implementations
│   │   ├── persistence/
│   │   │   ├── mysql/
│   │   │   │   ├── connection.go
│   │   │   │   └── user_repository.go  # Repository implementation
│   │   │   └── redis/
│   │   │       └── cache.go
│   │   ├── messaging/
│   │   │   └── rabbitmq/
│   │   │       ├── publisher.go
│   │   │       └── consumer.go
│   │   └── grpc/
│   │       └── server.go
│   └── interfaces/              # External interfaces (adapters)
│       ├── http/
│       │   ├── router.go
│       │   ├── handler/
│       │   │   └── user_handler.go
│       │   ├── middleware/
│       │   │   ├── auth.go
│       │   │   └── logging.go
│       │   └── dto/
│       │       └── user_dto.go
│       └── grpc/
│           ├── handler/
│           │   └── user_handler.go
│           └── interceptor/
│               └── auth.go
├── pkg/                         # Shared utilities (can be imported by other projects)
│   ├── errors/
│   │   └── errors.go
│   ├── logger/
│   │   └── logger.go
│   └── validator/
│       └── validator.go
├── api/
│   └── proto/                   # Protobuf definitions
│       └── user.proto
├── configs/
│   └── config.yaml
├── migrations/
│   └── 000001_init.up.sql
├── scripts/
│   └── generate_proto.sh
├── deployments/
│   ├── Dockerfile
│   └── docker-compose.yml
├── go.mod
├── go.sum
├── Makefile
└── README.md
```

## Core Principles

### 1. Dependency Rule
Dependencies point inward. Domain has zero external dependencies.

```
cmd (entrypoints) → interfaces → application → domain
                        ↓              ↓
                  infrastructure ←-----┘
```

### 2. Interface Segregation
Define interfaces in the package that uses them, not where they're implemented.

```go
// internal/domain/repository/user_repository.go
// Interface defined in domain layer
type UserRepository interface {
    FindByID(ctx context.Context, id string) (*entity.User, error)
    Save(ctx context.Context, user *entity.User) error
}

// internal/infrastructure/persistence/mysql/user_repository.go
// Implementation in infrastructure layer
type mysqlUserRepository struct {
    db *gorm.DB
}
```

### 3. Constructor Injection
No global state. All dependencies injected via constructors.

```go
func NewUserService(repo repository.UserRepository, cache Cache) *UserService {
    return &UserService{repo: repo, cache: cache}
}
```

### 4. Error Handling
Wrap errors with context. Use custom error types for domain errors.

```go
if err != nil {
    return fmt.Errorf("failed to find user %s: %w", id, err)
}
```

## Code Style

### Naming
- snake_case for file names
- PascalCase for exported functions, types, constants
- camelCase for unexported functions, variables
- UPPER_CASE only for constant groups
- Short receiver names (1-2 chars): `func (u *User) Validate()`

### Package Naming
- Short, lowercase, no underscores
- Avoid generic names: `util`, `common`, `helper`
- Name by what it provides, not what it contains

### Documentation
- Godoc comments for all exported items
- Comments in English only
- No emoji in code or commits
- No "thinking" comments

### Error Messages
- Lowercase, no punctuation at end
- Include context: `"user not found: %s"`

## Concurrency Patterns

### Goroutine + Channel
```go
// Worker pool pattern
func (s *Service) ProcessBatch(ctx context.Context, items []Item) error {
    const workers = 10
    jobs := make(chan Item, len(items))
    errs := make(chan error, len(items))
    
    // Start workers
    var wg sync.WaitGroup
    for i := 0; i < workers; i++ {
        wg.Add(1)
        go func() {
            defer wg.Done()
            for item := range jobs {
                if err := s.process(ctx, item); err != nil {
                    errs <- err
                }
            }
        }()
    }
    
    // Send jobs
    for _, item := range items {
        jobs <- item
    }
    close(jobs)
    
    // Wait and collect errors
    wg.Wait()
    close(errs)
    
    // Return first error if any
    for err := range errs {
        return err
    }
    return nil
}
```

### Mutex Usage
```go
type Cache struct {
    mu    sync.RWMutex
    items map[string]Item
}

func (c *Cache) Get(key string) (Item, bool) {
    c.mu.RLock()
    defer c.mu.RUnlock()
    item, ok := c.items[key]
    return item, ok
}

func (c *Cache) Set(key string, item Item) {
    c.mu.Lock()
    defer c.mu.Unlock()
    c.items[key] = item
}
```

## GORM Best Practices

### Model Definition
```go
type User struct {
    ID        string         `gorm:"type:char(36);primaryKey"`
    Email     string         `gorm:"type:varchar(255);uniqueIndex;not null"`
    Name      string         `gorm:"type:varchar(100);not null"`
    CreatedAt time.Time      `gorm:"autoCreateTime"`
    UpdatedAt time.Time      `gorm:"autoUpdateTime"`
    DeletedAt gorm.DeletedAt `gorm:"index"`
}

func (User) TableName() string {
    return "users"
}
```

### Transaction with Unit of Work
```go
func (r *repository) CreateWithProfile(ctx context.Context, user *User, profile *Profile) error {
    return r.db.WithContext(ctx).Transaction(func(tx *gorm.DB) error {
        if err := tx.Create(user).Error; err != nil {
            return fmt.Errorf("failed to create user: %w", err)
        }
        profile.UserID = user.ID
        if err := tx.Create(profile).Error; err != nil {
            return fmt.Errorf("failed to create profile: %w", err)
        }
        return nil
    })
}
```

### Query Optimization
```go
// Use index hints
db.Clauses(hints.UseIndex("idx_user_email")).Where("email = ?", email)

// Avoid N+1 with Preload
db.Preload("Orders").Find(&users)

// Select specific columns
db.Select("id", "name").Find(&users)
```

## gRPC Implementation

### Proto Definition
```protobuf
syntax = "proto3";

package user.v1;

option go_package = "project/api/proto/user/v1;userv1";

service UserService {
    rpc GetUser(GetUserRequest) returns (GetUserResponse);
    rpc CreateUser(CreateUserRequest) returns (CreateUserResponse);
}

message GetUserRequest {
    string id = 1;
}

message GetUserResponse {
    User user = 1;
}

message User {
    string id = 1;
    string email = 2;
    string name = 3;
}
```

### Server Implementation
```go
type userServer struct {
    userv1.UnimplementedUserServiceServer
    service *application.UserService
}

func (s *userServer) GetUser(ctx context.Context, req *userv1.GetUserRequest) (*userv1.GetUserResponse, error) {
    user, err := s.service.GetByID(ctx, req.GetId())
    if err != nil {
        return nil, status.Errorf(codes.NotFound, "user not found: %v", err)
    }
    return &userv1.GetUserResponse{
        User: toProtoUser(user),
    }, nil
}
```

## Redis Patterns

### Cache-Aside Pattern
```go
func (s *Service) GetUser(ctx context.Context, id string) (*User, error) {
    // Try cache first
    cached, err := s.cache.Get(ctx, "user:"+id)
    if err == nil {
        var user User
        if err := json.Unmarshal(cached, &user); err == nil {
            return &user, nil
        }
    }
    
    // Cache miss, query DB
    user, err := s.repo.FindByID(ctx, id)
    if err != nil {
        return nil, err
    }
    
    // Update cache
    data, _ := json.Marshal(user)
    s.cache.Set(ctx, "user:"+id, data, time.Hour)
    
    return user, nil
}
```

### Distributed Lock
```go
func (s *Service) ProcessWithLock(ctx context.Context, key string) error {
    lock := s.redis.SetNX(ctx, "lock:"+key, "1", 30*time.Second)
    if !lock.Val() {
        return errors.New("failed to acquire lock")
    }
    defer s.redis.Del(ctx, "lock:"+key)
    
    return s.process(ctx)
}
```

## Message Queue (RabbitMQ)

### Publisher
```go
func (p *Publisher) Publish(ctx context.Context, event Event) error {
    body, err := json.Marshal(event)
    if err != nil {
        return fmt.Errorf("failed to marshal event: %w", err)
    }
    
    return p.channel.PublishWithContext(ctx,
        p.exchange,
        event.RoutingKey(),
        false,
        false,
        amqp.Publishing{
            ContentType:  "application/json",
            Body:         body,
            DeliveryMode: amqp.Persistent,
            Timestamp:    time.Now(),
        },
    )
}
```

### Consumer
```go
func (c *Consumer) Consume(ctx context.Context, handler EventHandler) error {
    msgs, err := c.channel.Consume(c.queue, "", false, false, false, false, nil)
    if err != nil {
        return err
    }
    
    for {
        select {
        case <-ctx.Done():
            return ctx.Err()
        case msg := <-msgs:
            if err := handler.Handle(ctx, msg.Body); err != nil {
                msg.Nack(false, true) // requeue on failure
                continue
            }
            msg.Ack(false)
        }
    }
}
```

## Commit Convention

Format: `<type>: <description>`

Types:
- `feat`: new feature
- `fix`: bug fix
- `refactor`: code restructure without behavior change
- `docs`: documentation only
- `test`: adding or fixing tests
- `chore`: tooling, dependencies, config

Examples:
```
feat: add user aggregate with validation logic
fix: handle concurrent updates in repository
refactor: extract message bus to separate package
test: add integration tests for mysql repository
docs: add api documentation for user endpoints
chore: update gorm to v2.0
```

## Development Workflow

### Before Writing Code
1. Is this a real problem or imaginary?
2. Is there a simpler approach?
3. What will this break?

### Implementation Order
1. Write failing test
2. Implement minimal code to pass
3. Refactor if needed
4. Repeat

### Code Review Checklist
- [ ] Data structure appropriate?
- [ ] Special cases eliminated by design?
- [ ] Complexity minimized?
- [ ] Backward compatible?
- [ ] Tests covering edge cases?
- [ ] No goroutine leaks?
- [ ] Proper error wrapping?

## Common Commands

```bash
# Setup
go mod init project_name
go mod tidy

# Dependencies
go get -u gorm.io/gorm
go get -u gorm.io/driver/mysql
go get -u github.com/gin-gonic/gin
go get -u github.com/go-redis/redis/v9
go get -u google.golang.org/grpc

# Generate
go generate ./...
protoc --go_out=. --go-grpc_out=. api/proto/*.proto

# Testing
go test ./...
go test -v ./internal/domain/...
go test -race ./...
go test -cover ./...
go test -coverprofile=coverage.out ./... && go tool cover -html=coverage.out

# Linting
golangci-lint run
go vet ./...

# Build
go build -o bin/api ./cmd/api
go build -ldflags="-s -w" -o bin/api ./cmd/api  # smaller binary

# Run
go run ./cmd/api

# Docker
docker-compose up -d
docker-compose logs -f api
make docker-build
```

## Makefile

```makefile
.PHONY: all build test lint proto clean

all: lint test build

build:
	go build -o bin/api ./cmd/api
	go build -o bin/grpc ./cmd/grpc

test:
	go test -race -cover ./...

lint:
	golangci-lint run

proto:
	protoc --go_out=. --go-grpc_out=. api/proto/*.proto

migrate-up:
	migrate -path migrations -database "mysql://user:pass@tcp(localhost:3306)/db" up

migrate-down:
	migrate -path migrations -database "mysql://user:pass@tcp(localhost:3306)/db" down 1

clean:
	rm -rf bin/
```

## Anti-Patterns to Avoid

1. **init() abuse**: Avoid side effects in init(), use explicit initialization
2. **Interface pollution**: Don't define interfaces until you need abstraction
3. **Naked returns**: Always use explicit return values
4. **Empty interface abuse**: `interface{}` / `any` should be last resort
5. **Context ignorance**: Always pass and respect context
6. **Goroutine leaks**: Always ensure goroutines can exit
7. **Error string comparison**: Use errors.Is() and errors.As()
8. **Premature optimization**: Profile first, optimize proven bottlenecks

## Output Format (For Claude)

When reviewing or proposing code:

```
【Core Decision】: ✅ Worth doing / ❌ Not worth doing (reason)
【Key Insight】: Data structure / Complexity / Risk
【Solution】: Simplify structure → Eliminate special cases → Clear implementation
【Code Review】: Taste score (🟢/🟡/🔴), Critical issues, Improvements
```

## Reference

- Effective Go: https://go.dev/doc/effective_go
- Go Code Review Comments: https://github.com/golang/go/wiki/CodeReviewComments
- Uber Go Style Guide: https://github.com/uber-go/guide/blob/master/style.md
- Standard Go Project Layout: https://github.com/golang-standard/project-layout
- GORM Documentation: https://gorm.io/docs/
