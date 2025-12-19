package redis

import (
	"context"
	"encoding/json"
	"fmt"

	"github.com/redis/go-redis/v9"

	"mini-mud/internal/domain/event"
)

// EventPublisher publishes domain events to Redis Streams.
type EventPublisher struct {
	client *redis.Client
}

// NewEventPublisher creates a new event publisher.
func NewEventPublisher(client *redis.Client) *EventPublisher {
	return &EventPublisher{client: client}
}

// Publish publishes an event to the Redis Stream.
func (p *EventPublisher) Publish(ctx context.Context, evt event.Event) error {
	data, err := eventToMap(evt)
	if err != nil {
		return fmt.Errorf("failed to convert event: %w", err)
	}

	_, err = p.client.XAdd(ctx, &redis.XAddArgs{
		Stream: KeyEventsStream,
		MaxLen: EventsStreamMaxLen,
		Approx: true,
		Values: data,
	}).Result()
	if err != nil {
		return fmt.Errorf("failed to publish event: %w", err)
	}

	return nil
}

// PublishBatch publishes multiple events to the Redis Stream.
func (p *EventPublisher) PublishBatch(ctx context.Context, events []event.Event) error {
	pipe := p.client.Pipeline()

	for _, evt := range events {
		data, err := eventToMap(evt)
		if err != nil {
			return fmt.Errorf("failed to convert event: %w", err)
		}

		pipe.XAdd(ctx, &redis.XAddArgs{
			Stream: KeyEventsStream,
			MaxLen: EventsStreamMaxLen,
			Approx: true,
			Values: data,
		})
	}

	_, err := pipe.Exec(ctx)
	if err != nil {
		return fmt.Errorf("failed to publish events batch: %w", err)
	}

	return nil
}

// eventToMap converts a domain event to a map for Redis Stream.
func eventToMap(evt event.Event) (map[string]interface{}, error) {
	payload, err := json.Marshal(evt)
	if err != nil {
		return nil, err
	}

	return map[string]interface{}{
		"type":      string(evt.Type()),
		"timestamp": evt.Timestamp().UnixMilli(),
		"payload":   string(payload),
	}, nil
}
