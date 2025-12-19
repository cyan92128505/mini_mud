package redis

import (
	"context"
	"encoding/json"
	"fmt"
	"strconv"
	"time"

	"github.com/redis/go-redis/v9"

	"mini-mud/internal/domain/event"
)

// StreamMessage represents a message from the Redis Stream.
type StreamMessage struct {
	ID        string
	Type      event.EventType
	Timestamp time.Time
	Payload   json.RawMessage
}

// EventConsumer consumes events from Redis Streams.
type EventConsumer struct {
	client        *redis.Client
	consumerGroup string
	consumerName  string
}

// NewEventConsumer creates a new event consumer.
func NewEventConsumer(client *redis.Client, consumerGroup, consumerName string) *EventConsumer {
	return &EventConsumer{
		client:        client,
		consumerGroup: consumerGroup,
		consumerName:  consumerName,
	}
}

// CreateConsumerGroup creates the consumer group if it doesn't exist.
func (c *EventConsumer) CreateConsumerGroup(ctx context.Context) error {
	err := c.client.XGroupCreateMkStream(ctx, KeyEventsStream, c.consumerGroup, "0").Err()
	if err != nil && err.Error() != "BUSYGROUP Consumer Group name already exists" {
		return fmt.Errorf("failed to create consumer group: %w", err)
	}
	return nil
}

// Consume reads messages from the stream.
// It blocks until messages are available or context is cancelled.
func (c *EventConsumer) Consume(ctx context.Context, count int64, blockMs int64) ([]StreamMessage, error) {
	streams, err := c.client.XReadGroup(ctx, &redis.XReadGroupArgs{
		Group:    c.consumerGroup,
		Consumer: c.consumerName,
		Streams:  []string{KeyEventsStream, ">"},
		Count:    count,
		Block:    time.Duration(blockMs) * time.Millisecond,
	}).Result()
	if err != nil {
		if err == redis.Nil {
			return nil, nil
		}
		return nil, fmt.Errorf("failed to read from stream: %w", err)
	}

	var messages []StreamMessage
	for _, stream := range streams {
		for _, msg := range stream.Messages {
			sm, err := parseStreamMessage(msg)
			if err != nil {
				continue
			}
			messages = append(messages, sm)
		}
	}

	return messages, nil
}

// ConsumePending reads pending messages that were delivered but not acknowledged.
func (c *EventConsumer) ConsumePending(ctx context.Context, count int64) ([]StreamMessage, error) {
	streams, err := c.client.XReadGroup(ctx, &redis.XReadGroupArgs{
		Group:    c.consumerGroup,
		Consumer: c.consumerName,
		Streams:  []string{KeyEventsStream, "0"},
		Count:    count,
	}).Result()
	if err != nil {
		if err == redis.Nil {
			return nil, nil
		}
		return nil, fmt.Errorf("failed to read pending from stream: %w", err)
	}

	var messages []StreamMessage
	for _, stream := range streams {
		for _, msg := range stream.Messages {
			sm, err := parseStreamMessage(msg)
			if err != nil {
				continue
			}
			messages = append(messages, sm)
		}
	}

	return messages, nil
}

// Acknowledge acknowledges a message as processed.
func (c *EventConsumer) Acknowledge(ctx context.Context, messageID string) error {
	if err := c.client.XAck(ctx, KeyEventsStream, c.consumerGroup, messageID).Err(); err != nil {
		return fmt.Errorf("failed to acknowledge message %s: %w", messageID, err)
	}
	return nil
}

// AcknowledgeBatch acknowledges multiple messages.
func (c *EventConsumer) AcknowledgeBatch(ctx context.Context, messageIDs []string) error {
	if len(messageIDs) == 0 {
		return nil
	}
	if err := c.client.XAck(ctx, KeyEventsStream, c.consumerGroup, messageIDs...).Err(); err != nil {
		return fmt.Errorf("failed to acknowledge messages: %w", err)
	}
	return nil
}

// GetStreamInfo returns information about the stream.
func (c *EventConsumer) GetStreamInfo(ctx context.Context) (*redis.XInfoStream, error) {
	info, err := c.client.XInfoStream(ctx, KeyEventsStream).Result()
	if err != nil {
		return nil, fmt.Errorf("failed to get stream info: %w", err)
	}
	return info, nil
}

// parseStreamMessage parses a Redis stream message into StreamMessage.
func parseStreamMessage(msg redis.XMessage) (StreamMessage, error) {
	sm := StreamMessage{ID: msg.ID}

	if typeStr, ok := msg.Values["type"].(string); ok {
		sm.Type = event.EventType(typeStr)
	}

	if tsStr, ok := msg.Values["timestamp"].(string); ok {
		ts, _ := strconv.ParseInt(tsStr, 10, 64)
		sm.Timestamp = time.UnixMilli(ts)
	}

	if payload, ok := msg.Values["payload"].(string); ok {
		sm.Payload = json.RawMessage(payload)
	}

	return sm, nil
}
