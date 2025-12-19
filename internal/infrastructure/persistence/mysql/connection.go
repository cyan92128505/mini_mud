package mysql

import (
	"fmt"
	"time"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

// Config holds database connection configuration.
type Config struct {
	Host         string
	Port         int
	User         string
	Password     string
	Database     string
	MaxOpenConns int
	MaxIdleConns int
	MaxLifetime  time.Duration
}

// DefaultConfig returns a default configuration for local development.
func DefaultConfig() Config {
	return Config{
		Host:         "localhost",
		Port:         3306,
		User:         "root",
		Password:     "",
		Database:     "mini_mud",
		MaxOpenConns: 10,
		MaxIdleConns: 5,
		MaxLifetime:  time.Hour,
	}
}

// NewConnection creates a new database connection.
func NewConnection(cfg Config) (*gorm.DB, error) {
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8mb4&parseTime=True&loc=Local",
		cfg.User,
		cfg.Password,
		cfg.Host,
		cfg.Port,
		cfg.Database,
	)

	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		Logger: logger.Default.LogMode(logger.Info),
	})
	if err != nil {
		return nil, fmt.Errorf("failed to connect to database: %w", err)
	}

	sqlDB, err := db.DB()
	if err != nil {
		return nil, fmt.Errorf("failed to get underlying sql.DB: %w", err)
	}

	sqlDB.SetMaxOpenConns(cfg.MaxOpenConns)
	sqlDB.SetMaxIdleConns(cfg.MaxIdleConns)
	sqlDB.SetConnMaxLifetime(cfg.MaxLifetime)

	return db, nil
}

// PlayerModel is the GORM model for players.
type PlayerModel struct {
	ID        string    `gorm:"type:char(36);primaryKey"`
	Name      string    `gorm:"type:varchar(100);uniqueIndex;not null"`
	HP        int       `gorm:"not null"`
	MaxHP     int       `gorm:"not null"`
	Attack    int       `gorm:"not null"`
	Defense   int       `gorm:"not null"`
	EXP       int       `gorm:"not null;default:0"`
	Level     int       `gorm:"not null;default:1"`
	PosX      int       `gorm:"not null;default:5"`
	PosY      int       `gorm:"not null;default:5"`
	CreatedAt time.Time `gorm:"autoCreateTime"`
	UpdatedAt time.Time `gorm:"autoUpdateTime"`
}

// TableName returns the table name for PlayerModel.
func (PlayerModel) TableName() string {
	return "players"
}

// AutoMigrate runs auto migration for all models.
func AutoMigrate(db *gorm.DB) error {
	return db.AutoMigrate(&PlayerModel{})
}
