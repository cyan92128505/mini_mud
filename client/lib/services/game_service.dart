import 'package:grpc/grpc.dart';
import '../generated/game.pbgrpc.dart';
import '../generated/game.pb.dart';

class GameService {
  late ClientChannel _channel;
  late GameServiceClient _client;
  String? _playerId;

  String? get playerId => _playerId;
  bool get isConnected => _playerId != null;

  Future<void> init(String host, int port) async {
    _channel = ClientChannel(
      host,
      port: port,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
    _client = GameServiceClient(_channel);
  }

  Future<void> dispose() async {
    await _channel.shutdown();
  }

  Future<ConnectResponse> connect(String playerName) async {
    final response = await _client.connect(
      ConnectRequest()..playerName = playerName,
    );
    _playerId = response.playerId;
    return response;
  }

  Future<DisconnectResponse> disconnect() async {
    if (_playerId == null) {
      throw Exception('Not connected');
    }
    final response = await _client.disconnect(
      DisconnectRequest()..playerId = _playerId!,
    );
    _playerId = null;
    return response;
  }

  Future<MoveResponse> move(Direction direction) async {
    if (_playerId == null) {
      throw Exception('Not connected');
    }
    return await _client.move(
      MoveRequest()
        ..playerId = _playerId!
        ..direction = direction,
    );
  }

  Future<AttackResponse> attack() async {
    if (_playerId == null) {
      throw Exception('Not connected');
    }
    return await _client.attack(
      AttackRequest()..playerId = _playerId!,
    );
  }

  Future<RetreatResponse> retreat() async {
    if (_playerId == null) {
      throw Exception('Not connected');
    }
    return await _client.retreat(
      RetreatRequest()..playerId = _playerId!,
    );
  }

  Future<GetPlayerStatusResponse> getPlayerStatus() async {
    if (_playerId == null) {
      throw Exception('Not connected');
    }
    return await _client.getPlayerStatus(
      GetPlayerStatusRequest()..playerId = _playerId!,
    );
  }

  Future<GetMapResponse> getMap() async {
    if (_playerId == null) {
      throw Exception('Not connected');
    }
    return await _client.getMap(
      GetMapRequest()..playerId = _playerId!,
    );
  }

  Stream<GameEvent> subscribe() {
    if (_playerId == null) {
      throw Exception('Not connected');
    }
    return _client.subscribe(
      SubscribeRequest()..playerId = _playerId!,
    );
  }
}
