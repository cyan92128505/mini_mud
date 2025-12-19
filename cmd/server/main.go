package main

import (
	"context"
	"log"
	"os"
	"os/signal"
	"strconv"
	"syscall"
	"time"

	"mini-mud/internal/application/service"
	"mini-mud/internal/infrastructure/game"
	"mini-mud/internal/infrastructure/persistence/mysql"
	redisdb "mini-mud/internal/infrastructure/persistence/redis"
	"mini-mud/internal/infrastructure/persistence/sync"
	grpcserver "mini-mud/internal/interfaces/grpc"
	"mini-mud/internal/interfaces/grpc/handler"
)

func main() {
	log.Println("Starting Mini-MUD server...")

	// Database configuration
	dbConfig := mysql.Config{
		Host:         getEnv("DB_HOST", "localhost"),
		Port:         getEnvInt("DB_PORT", 3306),
		User:         getEnv("DB_USER", "root"),
		Password:     getEnv("DB_PASSWORD", ""),
		Database:     getEnv("DB_NAME", "mini_mud"),
		MaxOpenConns: 10,
		MaxIdleConns: 5,
		MaxLifetime:  time.Hour,
	}

	// Connect to database
	db, err := mysql.NewConnection(dbConfig)
	if err != nil {
		log.Fatalf("Failed to connect to database: %v", err)
	}
	log.Println("Connected to database")

	// Auto migrate
	if err := mysql.AutoMigrate(db); err != nil {
		log.Fatalf("Failed to run migrations: %v", err)
	}
	log.Println("Database migrations complete")

	// Redis configuration
	redisConfig := redisdb.Config{
		Host:         getEnv("REDIS_HOST", "localhost"),
		Port:         getEnvInt("REDIS_PORT", 6379),
		Password:     getEnv("REDIS_PASSWORD", ""),
		DB:           getEnvInt("REDIS_DB", 0),
		PoolSize:     10,
		MinIdleConns: 5,
		DialTimeout:  5 * time.Second,
		ReadTimeout:  3 * time.Second,
		WriteTimeout: 3 * time.Second,
	}

	// Connect to Redis
	redisClient, err := redisdb.NewClient(redisConfig)
	if err != nil {
		log.Fatalf("Failed to connect to Redis: %v", err)
	}
	defer redisdb.Close(redisClient)
	log.Println("Connected to Redis")

	// Initialize repositories
	playerRepo := mysql.NewPlayerRepository(db)
	worldStateRepo := redisdb.NewWorldStateRepository(redisClient)

	// Initialize game world with Redis-backed state
	world := game.NewWorld(worldStateRepo)

	// Initialize services
	playerService := service.NewPlayerService(playerRepo)
	gameService := service.NewGameService(world, playerService)

	// Initialize periodic sync (every 5 minutes)
	syncInterval := time.Duration(getEnvInt("SYNC_INTERVAL_SECONDS", 300)) * time.Second
	playerSync := sync.NewPlayerSync(worldStateRepo, playerRepo, syncInterval)

	// Start game service
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()
	gameService.Start(ctx)
	playerSync.Start(ctx)
	log.Println("Game world started")
	log.Printf("Player sync running every %v", syncInterval)

	// Initialize gRPC handler and server
	gameHandler := handler.NewGameHandler(gameService)
	port := getEnvInt("GRPC_PORT", 50051)
	server := grpcserver.NewServer(gameHandler, port)

	// Start gRPC server in goroutine
	go func() {
		log.Printf("gRPC server listening on port %d", port)
		if err := server.Start(); err != nil {
			log.Fatalf("Failed to start gRPC server: %v", err)
		}
	}()

	// Wait for interrupt signal
	quit := make(chan os.Signal, 1)
	signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
	<-quit

	log.Println("Shutting down server...")

	// Graceful shutdown
	server.Stop()
	playerSync.Stop()
	gameService.Stop()

	log.Println("Server stopped")
}

func getEnv(key, defaultValue string) string {
	if value := os.Getenv(key); value != "" {
		return value
	}
	return defaultValue
}

func getEnvInt(key string, defaultValue int) int {
	if value := os.Getenv(key); value != "" {
		if intVal, err := strconv.Atoi(value); err == nil {
			return intVal
		}
	}
	return defaultValue
}
