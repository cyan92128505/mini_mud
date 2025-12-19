import 'package:equatable/equatable.dart';
import '../../generated/game.pb.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object?> get props => [];
}

// Connection events
class GameConnect extends GameEvent {
  final String playerName;
  final String host;
  final int port;

  const GameConnect({
    required this.playerName,
    required this.host,
    required this.port,
  });

  @override
  List<Object?> get props => [playerName, host, port];
}

class GameDisconnect extends GameEvent {
  const GameDisconnect();
}

// Movement events
class GameMove extends GameEvent {
  final Direction direction;

  const GameMove(this.direction);

  @override
  List<Object?> get props => [direction];
}

// Combat events
class GameAttack extends GameEvent {
  const GameAttack();
}

class GameRetreat extends GameEvent {
  const GameRetreat();
}

// Refresh events
class GameRefreshStatus extends GameEvent {
  const GameRefreshStatus();
}

class GameRefreshMap extends GameEvent {
  const GameRefreshMap();
}

// Server event received
class GameServerEvent extends GameEvent {
  final GameEvent serverEvent;

  const GameServerEvent(this.serverEvent);

  @override
  List<Object?> get props => [serverEvent];
}
