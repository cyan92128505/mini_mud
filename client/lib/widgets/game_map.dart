import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game/game.dart';

class GameMap extends StatelessWidget {
  static const int mapSize = 11;
  static const int townX = 5;
  static const int townY = 5;

  const GameMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        final mapState = state.mapState;
        final playerStatus = state.playerStatus;

        return LayoutBuilder(
          builder: (context, constraints) {
            final cellSize = (constraints.maxWidth.clamp(0, constraints.maxHeight)) / mapSize;

            return Center(
              child: SizedBox(
                width: cellSize * mapSize,
                height: cellSize * mapSize,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: mapSize,
                  ),
                  itemCount: mapSize * mapSize,
                  itemBuilder: (context, index) {
                    final x = index % mapSize;
                    final y = index ~/ mapSize;

                    return _buildCell(
                      x: x,
                      y: y,
                      mapState: mapState,
                      currentPlayerId: playerStatus?.id,
                      playerX: playerStatus?.position.x ?? -1,
                      playerY: playerStatus?.position.y ?? -1,
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCell({
    required int x,
    required int y,
    required dynamic mapState,
    required String? currentPlayerId,
    required int playerX,
    required int playerY,
  }) {
    final isTown = x == townX && y == townY;
    final isCurrentPlayer = x == playerX && y == playerY;

    // Check for monster
    bool hasMonster = false;
    if (mapState != null && mapState.hasMonster()) {
      final monster = mapState.monster;
      hasMonster = monster.position.x == x && monster.position.y == y;
    }

    // Check for other players
    bool hasOtherPlayer = false;
    if (mapState != null) {
      for (final player in mapState.players) {
        if (player.id != currentPlayerId &&
            player.position.x == x &&
            player.position.y == y) {
          hasOtherPlayer = true;
          break;
        }
      }
    }

    Color bgColor = Colors.grey[200]!;
    if (isTown) {
      bgColor = Colors.green[100]!;
    }

    Widget? content;
    if (isCurrentPlayer) {
      content = const Icon(Icons.person, color: Colors.blue, size: 20);
    } else if (hasMonster) {
      content = const Icon(Icons.bug_report, color: Colors.red, size: 20);
    } else if (hasOtherPlayer) {
      content = const Icon(Icons.person_outline, color: Colors.orange, size: 20);
    } else if (isTown) {
      content = const Icon(Icons.home, color: Colors.green, size: 16);
    }

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: Colors.grey[400]!, width: 0.5),
      ),
      child: Center(child: content),
    );
  }
}
