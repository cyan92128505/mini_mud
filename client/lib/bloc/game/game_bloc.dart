import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/game_service.dart';
import '../../generated/game.pb.dart' as pb;
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameService _gameService;
  StreamSubscription<pb.GameEvent>? _eventSubscription;

  GameBloc({required GameService gameService})
      : _gameService = gameService,
        super(const GameState()) {
    on<GameConnect>(_onConnect);
    on<GameDisconnect>(_onDisconnect);
    on<GameMove>(_onMove);
    on<GameAttack>(_onAttack);
    on<GameRetreat>(_onRetreat);
    on<GameRefreshStatus>(_onRefreshStatus);
    on<GameRefreshMap>(_onRefreshMap);
    on<GameServerEvent>(_onServerEvent);
  }

  Future<void> _onConnect(GameConnect event, Emitter<GameState> emit) async {
    emit(state.copyWith(status: GameStatus.connecting));

    try {
      await _gameService.init(event.host, event.port);
      final response = await _gameService.connect(event.playerName);

      emit(state.copyWith(
        status: GameStatus.connected,
        playerId: response.playerId,
        playerStatus: response.status,
      ));

      // Start listening to server events
      _subscribeToEvents();

      // Get initial map state
      add(const GameRefreshMap());
    } catch (e) {
      emit(state.copyWith(
        status: GameStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _onDisconnect(
      GameDisconnect event, Emitter<GameState> emit) async {
    try {
      await _eventSubscription?.cancel();
      await _gameService.disconnect();
      await _gameService.dispose();
    } catch (_) {}

    emit(const GameState());
  }

  Future<void> _onMove(GameMove event, Emitter<GameState> emit) async {
    if (!state.isConnected) return;

    try {
      final response = await _gameService.move(event.direction);

      if (response.success) {
        add(const GameRefreshStatus());
        add(const GameRefreshMap());

        if (response.combatStarted) {
          emit(state.addEvent('Combat started!'));
        }
      } else if (response.error.isNotEmpty) {
        emit(state.addEvent('Move failed: ${response.error}'));
      }
    } catch (e) {
      emit(state.addEvent('Move error: $e'));
    }
  }

  Future<void> _onAttack(GameAttack event, Emitter<GameState> emit) async {
    if (!state.isConnected || !state.isInCombat) return;

    try {
      final response = await _gameService.attack();

      if (response.success && response.hasResult()) {
        final result = response.result;
        emit(state.copyWith(lastCombatResult: result));

        if (result.monsterDied) {
          emit(state.addEvent(
              'Monster defeated! Gained ${result.expGained} EXP'));
        } else if (result.playerDied) {
          emit(state.addEvent('You died! Respawning at town...'));
        }

        add(const GameRefreshStatus());
        add(const GameRefreshMap());
      } else if (response.error.isNotEmpty) {
        emit(state.addEvent('Attack failed: ${response.error}'));
      }
    } catch (e) {
      emit(state.addEvent('Attack error: $e'));
    }
  }

  Future<void> _onRetreat(GameRetreat event, Emitter<GameState> emit) async {
    if (!state.isConnected || !state.isInCombat) return;

    try {
      final response = await _gameService.retreat();

      if (response.success) {
        emit(state.addEvent('Retreated from combat'));
        add(const GameRefreshStatus());
        add(const GameRefreshMap());
      } else if (response.error.isNotEmpty) {
        emit(state.addEvent('Retreat failed: ${response.error}'));
      }
    } catch (e) {
      emit(state.addEvent('Retreat error: $e'));
    }
  }

  Future<void> _onRefreshStatus(
      GameRefreshStatus event, Emitter<GameState> emit) async {
    if (!state.isConnected) return;

    try {
      final response = await _gameService.getPlayerStatus();
      emit(state.copyWith(playerStatus: response.status));
    } catch (e) {
      emit(state.addEvent('Failed to refresh status: $e'));
    }
  }

  Future<void> _onRefreshMap(
      GameRefreshMap event, Emitter<GameState> emit) async {
    if (!state.isConnected) return;

    try {
      final response = await _gameService.getMap();
      emit(state.copyWith(mapState: response.map));
    } catch (e) {
      emit(state.addEvent('Failed to refresh map: $e'));
    }
  }

  void _subscribeToEvents() {
    _eventSubscription = _gameService.subscribe().listen(
      (event) => add(GameServerEvent(event as GameEvent)),
      onError: (e) => add(const GameDisconnect()),
    );
  }

  Future<void> _onServerEvent(
      GameServerEvent event, Emitter<GameState> emit) async {
    // Handle server-pushed events
    // Refresh status and map on relevant events
    add(const GameRefreshStatus());
    add(const GameRefreshMap());
  }

  @override
  Future<void> close() {
    _eventSubscription?.cancel();
    return super.close();
  }
}
