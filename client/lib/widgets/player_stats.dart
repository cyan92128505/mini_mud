import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game/game.dart';

class PlayerStats extends StatelessWidget {
  const PlayerStats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        final status = state.playerStatus;
        if (status == null) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.grey[100],
          child: Row(
            children: [
              // HP Bar
              Expanded(
                child: _buildStatBar(
                  label: 'HP',
                  current: status.hp,
                  max: status.maxHp,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 16),

              // EXP Bar
              Expanded(
                child: _buildStatBar(
                  label: 'EXP',
                  current: status.exp,
                  max: status.level * 100, // ExpPerLevel
                  color: Colors.purple,
                ),
              ),
              const SizedBox(width: 16),

              // Stats
              _buildStat('LV', status.level.toString()),
              const SizedBox(width: 8),
              _buildStat('ATK', status.attack.toString()),
              const SizedBox(width: 8),
              _buildStat('DEF', status.defense.toString()),
              const SizedBox(width: 8),
              _buildStat('POS', '(${status.position.x}, ${status.position.y})'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStatBar({
    required String label,
    required int current,
    required int max,
    required Color color,
  }) {
    final progress = max > 0 ? (current / max).clamp(0.0, 1.0) : 0.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$label: $current / $max',
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 8,
        ),
      ],
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 10, color: Colors.grey[600]),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
