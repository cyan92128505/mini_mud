import 'package:equatable/equatable.dart';
import '../../generated/game.pb.dart';

enum GameStatus {
  disconnected,
  connecting,
  connected,
  error,
}

class GameState extends Equatable {
  final GameStatus status;
  final String? playerId;
  final PlayerStatus? playerStatus;
  final MapState? mapState;
  final CombatResult? lastCombatResult;
  final String? errorMessage;
  final List<String> eventLog;

  const GameState({
    this.status = GameStatus.disconnected,
    this.playerId,
    this.playerStatus,
    this.mapState,
    this.lastCombatResult,
    this.errorMessage,
    this.eventLog = const [],
  });

  bool get isConnected => status == GameStatus.connected;
  bool get isInCombat => playerStatus?.inCombat ?? false;

  GameState copyWith({
    GameStatus? status,
    String? playerId,
    PlayerStatus? playerStatus,
    MapState? mapState,
    CombatResult? lastCombatResult,
    String? errorMessage,
    List<String>? eventLog,
  }) {
    return GameState(
      status: status ?? this.status,
      playerId: playerId ?? this.playerId,
      playerStatus: playerStatus ?? this.playerStatus,
      mapState: mapState ?? this.mapState,
      lastCombatResult: lastCombatResult ?? this.lastCombatResult,
      errorMessage: errorMessage,
      eventLog: eventLog ?? this.eventLog,
    );
  }

  GameState addEvent(String event) {
    return copyWith(
      eventLog: [...eventLog.take(49), event],
    );
  }

  @override
  List<Object?> get props => [
        status,
        playerId,
        playerStatus,
        mapState,
        lastCombatResult,
        errorMessage,
        eventLog,
      ];
}
