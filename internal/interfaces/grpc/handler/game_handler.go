package handler

import (
	"context"
	"log"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"

	gamev1 "mini-mud/api/proto/game/v1"
	"mini-mud/internal/application/service"
	"mini-mud/internal/domain/entity"
	"mini-mud/internal/domain/event"
	"mini-mud/internal/infrastructure/game"
)

// GameHandler implements the gRPC GameService.
type GameHandler struct {
	gamev1.UnimplementedGameServiceServer
	gameService *service.GameService
}

// NewGameHandler creates a new game handler.
func NewGameHandler(gameService *service.GameService) *GameHandler {
	return &GameHandler{
		gameService: gameService,
	}
}

// Connect connects a player to the game.
func (h *GameHandler) Connect(ctx context.Context, req *gamev1.ConnectRequest) (*gamev1.ConnectResponse, error) {
	if req.PlayerName == "" {
		return nil, status.Error(codes.InvalidArgument, "player name is required")
	}

	player, err := h.gameService.Connect(ctx, req.PlayerName)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to connect: %v", err)
	}

	playerStatus, err := h.gameService.GetPlayerStatus(ctx, player.ID)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to get player status: %v", err)
	}

	return &gamev1.ConnectResponse{
		PlayerId: player.ID,
		Status:   toProtoPlayerStatus(playerStatus),
	}, nil
}

// Disconnect disconnects a player from the game.
func (h *GameHandler) Disconnect(ctx context.Context, req *gamev1.DisconnectRequest) (*gamev1.DisconnectResponse, error) {
	if req.PlayerId == "" {
		return nil, status.Error(codes.InvalidArgument, "player id is required")
	}

	if err := h.gameService.Disconnect(ctx, req.PlayerId); err != nil {
		return nil, status.Errorf(codes.Internal, "failed to disconnect: %v", err)
	}

	return &gamev1.DisconnectResponse{Success: true}, nil
}

// Move moves a player in a direction.
func (h *GameHandler) Move(ctx context.Context, req *gamev1.MoveRequest) (*gamev1.MoveResponse, error) {
	if req.PlayerId == "" {
		return nil, status.Error(codes.InvalidArgument, "player id is required")
	}

	dir := toServiceDirection(req.Direction)
	if err := h.gameService.Move(ctx, req.PlayerId, dir); err != nil {
		return &gamev1.MoveResponse{
			Success: false,
			Error:   err.Error(),
		}, nil
	}

	playerStatus, err := h.gameService.GetPlayerStatus(ctx, req.PlayerId)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to get player status: %v", err)
	}

	return &gamev1.MoveResponse{
		Success:       true,
		NewPosition:   toProtoPosition(playerStatus.Position),
		CombatStarted: playerStatus.InCombat,
	}, nil
}

// Attack performs an attack action.
func (h *GameHandler) Attack(ctx context.Context, req *gamev1.AttackRequest) (*gamev1.AttackResponse, error) {
	if req.PlayerId == "" {
		return nil, status.Error(codes.InvalidArgument, "player id is required")
	}

	result, err := h.gameService.Attack(ctx, req.PlayerId)
	if err != nil {
		return &gamev1.AttackResponse{
			Success: false,
			Error:   err.Error(),
		}, nil
	}

	if result == nil {
		return &gamev1.AttackResponse{
			Success: false,
			Error:   "no combat result",
		}, nil
	}

	return &gamev1.AttackResponse{
		Success: true,
		Result:  toProtoCombatResult(result),
	}, nil
}

// Retreat retreats from combat.
func (h *GameHandler) Retreat(ctx context.Context, req *gamev1.RetreatRequest) (*gamev1.RetreatResponse, error) {
	if req.PlayerId == "" {
		return nil, status.Error(codes.InvalidArgument, "player id is required")
	}

	if err := h.gameService.Retreat(ctx, req.PlayerId); err != nil {
		return &gamev1.RetreatResponse{
			Success: false,
			Error:   err.Error(),
		}, nil
	}

	playerStatus, err := h.gameService.GetPlayerStatus(ctx, req.PlayerId)
	if err != nil {
		return nil, status.Errorf(codes.Internal, "failed to get player status: %v", err)
	}

	return &gamev1.RetreatResponse{
		Success:     true,
		NewPosition: toProtoPosition(playerStatus.Position),
	}, nil
}

// GetPlayerStatus returns the current player status.
func (h *GameHandler) GetPlayerStatus(ctx context.Context, req *gamev1.GetPlayerStatusRequest) (*gamev1.GetPlayerStatusResponse, error) {
	if req.PlayerId == "" {
		return nil, status.Error(codes.InvalidArgument, "player id is required")
	}

	playerStatus, err := h.gameService.GetPlayerStatus(ctx, req.PlayerId)
	if err != nil {
		return nil, status.Errorf(codes.NotFound, "player not found: %v", err)
	}

	return &gamev1.GetPlayerStatusResponse{
		Status: toProtoPlayerStatus(playerStatus),
	}, nil
}

// GetMap returns the current map state.
func (h *GameHandler) GetMap(ctx context.Context, req *gamev1.GetMapRequest) (*gamev1.GetMapResponse, error) {
	mapState := h.gameService.GetMapState(ctx)
	return &gamev1.GetMapResponse{
		Map: toProtoMapState(mapState),
	}, nil
}

// Subscribe subscribes to game events.
func (h *GameHandler) Subscribe(req *gamev1.SubscribeRequest, stream gamev1.GameService_SubscribeServer) error {
	if req.PlayerId == "" {
		return status.Error(codes.InvalidArgument, "player id is required")
	}

	eventChan := h.gameService.GetEventChannel()

	for {
		select {
		case <-stream.Context().Done():
			return nil
		case evt, ok := <-eventChan:
			if !ok {
				return nil
			}

			protoEvent := toProtoEvent(evt)
			if protoEvent == nil {
				continue
			}

			if err := stream.Send(protoEvent); err != nil {
				log.Printf("failed to send event: %v", err)
				return err
			}
		}
	}
}

// Conversion functions

func toServiceDirection(dir gamev1.Direction) service.Direction {
	switch dir {
	case gamev1.Direction_DIRECTION_UP:
		return service.DirectionUp
	case gamev1.Direction_DIRECTION_DOWN:
		return service.DirectionDown
	case gamev1.Direction_DIRECTION_LEFT:
		return service.DirectionLeft
	case gamev1.Direction_DIRECTION_RIGHT:
		return service.DirectionRight
	default:
		return service.DirectionUp
	}
}

func toProtoPosition(pos entity.Position) *gamev1.Position {
	return &gamev1.Position{
		X: int32(pos.X),
		Y: int32(pos.Y),
	}
}

func toProtoPlayerStatus(s *service.PlayerStatus) *gamev1.PlayerStatus {
	ps := &gamev1.PlayerStatus{
		Id:       s.ID,
		Name:     s.Name,
		Hp:       int32(s.HP),
		MaxHp:    int32(s.MaxHP),
		Attack:   int32(s.Attack),
		Defense:  int32(s.Defense),
		Exp:      int32(s.EXP),
		Level:    int32(s.Level),
		Position: toProtoPosition(s.Position),
		InCombat: s.InCombat,
	}

	if s.CombatTarget != nil {
		ps.CombatTarget = &gamev1.CombatTarget{
			Id:    s.CombatTarget.ID,
			Name:  s.CombatTarget.Name,
			Hp:    int32(s.CombatTarget.HP),
			MaxHp: int32(s.CombatTarget.MaxHP),
		}
	}

	return ps
}

func toProtoCombatResult(r *game.CombatResult) *gamev1.CombatResult {
	return &gamev1.CombatResult{
		Turn:          int32(r.Turn),
		PlayerDamage:  int32(r.PlayerDamage),
		MonsterDamage: int32(r.MonsterDamage),
		PlayerHp:      int32(r.PlayerHP),
		PlayerMaxHp:   int32(r.PlayerMaxHP),
		MonsterHp:     int32(r.MonsterHP),
		MonsterMaxHp:  int32(r.MonsterMaxHP),
		PlayerDied:    r.PlayerDied,
		MonsterDied:   r.MonsterDied,
		ExpGained:     int32(r.ExpGained),
	}
}

func toProtoMapState(m *game.MapState) *gamev1.MapState {
	ms := &gamev1.MapState{
		Players: make([]*gamev1.PlayerInfo, len(m.Players)),
	}

	for i, p := range m.Players {
		ms.Players[i] = &gamev1.PlayerInfo{
			Id:       p.ID,
			Name:     p.Name,
			Position: toProtoPosition(p.Position),
			InCombat: p.InCombat,
		}
	}

	if m.Monster != nil {
		ms.Monster = &gamev1.MonsterInfo{
			Id:       m.Monster.ID,
			Name:     m.Monster.Name,
			Position: toProtoPosition(m.Monster.Position),
			Hp:       int32(m.Monster.HP),
			MaxHp:    int32(m.Monster.MaxHP),
		}
	}

	return ms
}

func toProtoEvent(evt event.Event) *gamev1.GameEvent {
	ge := &gamev1.GameEvent{
		Timestamp: evt.Timestamp().UnixMilli(),
	}

	switch e := evt.(type) {
	case *event.PlayerJoinedEvent:
		ge.Type = gamev1.EventType_EVENT_TYPE_PLAYER_JOINED
		ge.Payload = &gamev1.GameEvent_PlayerJoined{
			PlayerJoined: &gamev1.PlayerJoinedEvent{
				PlayerId:   e.PlayerID,
				PlayerName: e.PlayerName,
				Position:   toProtoPosition(e.Position),
			},
		}
	case *event.PlayerLeftEvent:
		ge.Type = gamev1.EventType_EVENT_TYPE_PLAYER_LEFT
		ge.Payload = &gamev1.GameEvent_PlayerLeft{
			PlayerLeft: &gamev1.PlayerLeftEvent{
				PlayerId: e.PlayerID,
			},
		}
	case *event.PlayerMovedEvent:
		ge.Type = gamev1.EventType_EVENT_TYPE_PLAYER_MOVED
		ge.Payload = &gamev1.GameEvent_PlayerMoved{
			PlayerMoved: &gamev1.PlayerMovedEvent{
				PlayerId: e.PlayerID,
				From:     toProtoPosition(e.From),
				To:       toProtoPosition(e.To),
			},
		}
	case *event.PlayerDiedEvent:
		ge.Type = gamev1.EventType_EVENT_TYPE_PLAYER_DIED
		ge.Payload = &gamev1.GameEvent_PlayerDied{
			PlayerDied: &gamev1.PlayerDiedEvent{
				PlayerId: e.PlayerID,
			},
		}
	case *event.PlayerLevelUpEvent:
		ge.Type = gamev1.EventType_EVENT_TYPE_PLAYER_LEVEL_UP
		ge.Payload = &gamev1.GameEvent_PlayerLevelUp{
			PlayerLevelUp: &gamev1.PlayerLevelUpEvent{
				PlayerId: e.PlayerID,
				NewLevel: int32(e.NewLevel),
			},
		}
	case *event.CombatStartedEvent:
		ge.Type = gamev1.EventType_EVENT_TYPE_COMBAT_STARTED
		ge.Payload = &gamev1.GameEvent_CombatStarted{
			CombatStarted: &gamev1.CombatStartedEvent{
				PlayerId:  e.PlayerID,
				MonsterId: e.MonsterID,
			},
		}
	case *event.CombatTurnEvent:
		ge.Type = gamev1.EventType_EVENT_TYPE_COMBAT_TURN
		ge.Payload = &gamev1.GameEvent_CombatTurn{
			CombatTurn: &gamev1.CombatTurnEvent{
				PlayerId:      e.PlayerID,
				MonsterId:     e.MonsterID,
				PlayerDamage:  int32(e.PlayerDamage),
				MonsterDamage: int32(e.MonsterDamage),
				PlayerHp:      int32(e.PlayerHP),
				PlayerMaxHp:   int32(e.PlayerMaxHP),
				MonsterHp:     int32(e.MonsterHP),
				MonsterMaxHp:  int32(e.MonsterMaxHP),
				Turn:          int32(e.Turn),
			},
		}
	case *event.CombatEndedEvent:
		ge.Type = gamev1.EventType_EVENT_TYPE_COMBAT_ENDED
		ge.Payload = &gamev1.GameEvent_CombatEnded{
			CombatEnded: &gamev1.CombatEndedEvent{
				PlayerId:  e.PlayerID,
				MonsterId: e.MonsterID,
				Reason:    toProtoCombatEndReason(e.Reason),
				ExpGained: int32(e.ExpGained),
			},
		}
	case *event.MonsterMovedEvent:
		ge.Type = gamev1.EventType_EVENT_TYPE_MONSTER_MOVED
		ge.Payload = &gamev1.GameEvent_MonsterMoved{
			MonsterMoved: &gamev1.MonsterMovedEvent{
				MonsterId: e.MonsterID,
				From:      toProtoPosition(e.From),
				To:        toProtoPosition(e.To),
			},
		}
	case *event.MonsterDiedEvent:
		ge.Type = gamev1.EventType_EVENT_TYPE_MONSTER_DIED
		ge.Payload = &gamev1.GameEvent_MonsterDied{
			MonsterDied: &gamev1.MonsterDiedEvent{
				MonsterId:    e.MonsterID,
				KillerId:     e.KillerID,
				Contributors: e.Contributors,
			},
		}
	case *event.MonsterSpawnedEvent:
		ge.Type = gamev1.EventType_EVENT_TYPE_MONSTER_SPAWNED
		ge.Payload = &gamev1.GameEvent_MonsterSpawned{
			MonsterSpawned: &gamev1.MonsterSpawnedEvent{
				MonsterId: e.MonsterID,
				Position:  toProtoPosition(e.Position),
			},
		}
	default:
		return nil
	}

	return ge
}

func toProtoCombatEndReason(r event.CombatEndReason) gamev1.CombatEndReason {
	switch r {
	case event.CombatEndRetreat:
		return gamev1.CombatEndReason_COMBAT_END_REASON_RETREAT
	case event.CombatEndDeath:
		return gamev1.CombatEndReason_COMBAT_END_REASON_DEATH
	case event.CombatEndVictory:
		return gamev1.CombatEndReason_COMBAT_END_REASON_VICTORY
	default:
		return gamev1.CombatEndReason_COMBAT_END_REASON_UNSPECIFIED
	}
}
