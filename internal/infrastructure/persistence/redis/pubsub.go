package redis

import (
	"context"
	"encoding/json"
	"fmt"

	"github.com/redis/go-redis/v9"

	"mini-mud/internal/domain/event"
)

// PubSubMessage represents a message received via Pub/Sub.
type PubSubMessage struct {
	Channel string
	Payload json.RawMessage
}

// PubSub handles Redis Pub/Sub for real-time event broadcasting.
type PubSub struct {
	client *redis.Client
}

// NewPubSub creates a new Pub/Sub handler.
func NewPubSub(client *redis.Client) *PubSub {
	return &PubSub{client: client}
}

// PublishWorldEvent publishes an event to the world channel.
func (p *PubSub) PublishWorldEvent(ctx context.Context, evt event.Event) error {
	return p.publishToChannel(ctx, ChannelWorld, evt)
}

// PublishCombatEvent publishes an event to the combat channel.
func (p *PubSub) PublishCombatEvent(ctx context.Context, evt event.Event) error {
	return p.publishToChannel(ctx, ChannelCombat, evt)
}

// PublishMovementEvent publishes an event to the movement channel.
func (p *PubSub) PublishMovementEvent(ctx context.Context, evt event.Event) error {
	return p.publishToChannel(ctx, ChannelMovement, evt)
}

// publishToChannel publishes an event to a specific channel.
func (p *PubSub) publishToChannel(ctx context.Context, channel string, evt event.Event) error {
	payload, err := json.Marshal(map[string]interface{}{
		"type":      evt.Type(),
		"timestamp": evt.Timestamp().UnixMilli(),
		"data":      evt,
	})
	if err != nil {
		return fmt.Errorf("failed to marshal event: %w", err)
	}

	if err := p.client.Publish(ctx, channel, payload).Err(); err != nil {
		return fmt.Errorf("failed to publish to %s: %w", channel, err)
	}

	return nil
}

// Subscribe creates a subscription to the specified channels.
func (p *PubSub) Subscribe(ctx context.Context, channels ...string) *redis.PubSub {
	return p.client.Subscribe(ctx, channels...)
}

// SubscribeAll subscribes to all game channels.
func (p *PubSub) SubscribeAll(ctx context.Context) *redis.PubSub {
	return p.client.Subscribe(ctx, ChannelWorld, ChannelCombat, ChannelMovement)
}

// PubSubBridge bridges Redis Pub/Sub to the in-memory event channel.
type PubSubBridge struct {
	pubsub    *PubSub
	eventChan chan<- event.Event
}

// NewPubSubBridge creates a bridge between Redis Pub/Sub and the event channel.
func NewPubSubBridge(pubsub *PubSub, eventChan chan<- event.Event) *PubSubBridge {
	return &PubSubBridge{
		pubsub:    pubsub,
		eventChan: eventChan,
	}
}

// Start starts listening to Pub/Sub and forwarding to event channel.
func (b *PubSubBridge) Start(ctx context.Context) error {
	sub := b.pubsub.SubscribeAll(ctx)
	defer sub.Close()

	ch := sub.Channel()

	for {
		select {
		case <-ctx.Done():
			return ctx.Err()
		case msg := <-ch:
			if msg == nil {
				continue
			}
			// Forward to event channel (non-blocking)
			// The actual event parsing would depend on the specific event type
			// For now we just log that we received something
			_ = msg
		}
	}
}
