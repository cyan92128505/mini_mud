import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/game/game.dart';

class CombatPanel extends StatelessWidget {
  const CombatPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        final target = state.playerStatus?.combatTarget;
        final lastResult = state.lastCombatResult;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.red[50],
            border: Border.all(color: Colors.red[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Combat header
              Row(
                children: [
                  const Icon(Icons.sports_martial_arts, color: Colors.red),
                  const SizedBox(width: 8),
                  Text(
                    'Combat: ${target?.name ?? "Monster"}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Monster HP
              if (target != null) ...[
                Text(
                  'Monster HP: ${target.hp} / ${target.maxHp}',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 4),
                LinearProgressIndicator(
                  value: target.maxHp > 0
                      ? (target.hp / target.maxHp).clamp(0.0, 1.0)
                      : 0.0,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                  minHeight: 12,
                ),
              ],
              const SizedBox(height: 12),

              // Last combat result
              if (lastResult != null) ...[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Turn ${lastResult.turn}',
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('You dealt ${lastResult.playerDamage} damage'),
                      Text('Monster dealt ${lastResult.monsterDamage} damage'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context.read<GameBloc>().add(const GameAttack());
                      },
                      icon: const Icon(Icons.flash_on),
                      label: const Text('Attack'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        context.read<GameBloc>().add(const GameRetreat());
                      },
                      icon: const Icon(Icons.exit_to_app),
                      label: const Text('Retreat'),
                    ),
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
