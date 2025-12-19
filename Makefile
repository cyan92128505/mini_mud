.PHONY: all build test lint proto clean run deps

# Variables
BINARY_NAME=mini-mud
BUILD_DIR=bin
PROTO_DIR=api/proto
PROTO_OUT=api/proto/game/v1

all: deps proto build

# Install dependencies
deps:
	go mod tidy
	go mod download

# Generate protobuf code
proto:
	@mkdir -p $(PROTO_OUT)
	protoc --go_out=. --go_opt=paths=source_relative \
		--go-grpc_out=. --go-grpc_opt=paths=source_relative \
		$(PROTO_DIR)/game.proto

# Build the server
build:
	@mkdir -p $(BUILD_DIR)
	go build -o $(BUILD_DIR)/$(BINARY_NAME) ./cmd/server

# Run the server
run:
	go run ./cmd/server

# Run tests
test:
	go test -race -cover ./...

# Run tests with verbose output
test-v:
	go test -race -cover -v ./...

# Lint the code
lint:
	golangci-lint run

# Format code
fmt:
	go fmt ./...

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)

# Database commands
migrate-up:
	@for f in migrations/*.sql; do echo "Running $$f..."; mysql -u root < "$$f"; done

migrate-create:
	@read -p "Migration name: " name; \
	filename="migrations/$$(date +%Y%m%d%H%M%S)_$$name.sql"; \
	echo "-- Migration: $$name" > "$$filename"; \
	echo "-- Created: $$(date +%Y-%m-%d)" >> "$$filename"; \
	echo "" >> "$$filename"; \
	echo "Created: $$filename"

# Docker commands
docker-build:
	docker build -t mini-mud:latest -f deployments/Dockerfile .

docker-run:
	docker compose -f deployments/docker-compose.yml up -d

docker-stop:
	docker compose -f deployments/docker-compose.yml down

# Help
help:
	@echo "Available commands:"
	@echo "  make deps          - Install dependencies"
	@echo "  make proto         - Generate protobuf code"
	@echo "  make build         - Build the server binary"
	@echo "  make run           - Run the server"
	@echo "  make test          - Run tests"
	@echo "  make lint          - Run linter"
	@echo "  make fmt           - Format code"
	@echo "  make clean         - Clean build artifacts"
	@echo "  make migrate-up    - Run all migrations"
	@echo "  make migrate-create - Create new migration file"
	@echo "  make docker-build  - Build Docker image"
	@echo "  make docker-run    - Start with Docker Compose"
