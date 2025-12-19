import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game/game.dart';
import '../generated/game.pb.dart';
import '../widgets/game_map.dart';
import '../widgets/player_stats.dart';
import '../widgets/combat_panel.dart';
import '../widgets/event_log.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            final name = state.playerStatus?.name ?? 'Player';
            return Text('Mini-MUD - $name');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<GameBloc>().add(const GameRefreshStatus());
              context.read<GameBloc>().add(const GameRefreshMap());
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<GameBloc>().add(const GameDisconnect());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Player stats
          const PlayerStats(),
          const Divider(height: 1),

          // Main content
          Expanded(
            child: Row(
              children: [
                // Map
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const Expanded(child: GameMap()),
                      // Movement controls
                      _buildMovementControls(context),
                    ],
                  ),
                ),

                const VerticalDivider(width: 1),

                // Side panel
                Expanded(
                  child: Column(
                    children: [
                      // Combat panel (when in combat)
                      BlocBuilder<GameBloc, GameState>(
                        builder: (context, state) {
                          if (state.isInCombat) {
                            return const CombatPanel();
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      // Event log
                      const Expanded(child: EventLog()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovementControls(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        final canMove = state.isConnected && !state.isInCombat;

        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Up
              IconButton(
                icon: const Icon(Icons.arrow_upward, size: 32),
                onPressed: canMove
                    ? () => context
                        .read<GameBloc>()
                        .add(const GameMove(Direction.DIRECTION_UP))
                    : null,
              ),
              // Left, Down, Right
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 32),
                    onPressed: canMove
                        ? () => context
                            .read<GameBloc>()
                            .add(const GameMove(Direction.DIRECTION_LEFT))
                        : null,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_downward, size: 32),
                    onPressed: canMove
                        ? () => context
                            .read<GameBloc>()
                            .add(const GameMove(Direction.DIRECTION_DOWN))
                        : null,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward, size: 32),
                    onPressed: canMove
                        ? () => context
                            .read<GameBloc>()
                            .add(const GameMove(Direction.DIRECTION_RIGHT))
                        : null,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
