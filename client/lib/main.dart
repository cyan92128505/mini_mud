import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/game/game.dart';
import 'services/game_service.dart';
import 'screens/login_screen.dart';
import 'screens/game_screen.dart';

void main() {
  runApp(const MiniMudApp());
}

class MiniMudApp extends StatelessWidget {
  const MiniMudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini-MUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => GameBloc(gameService: GameService()),
        child: const AppNavigator(),
      ),
    );
  }
}

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.isConnected) {
          return const GameScreen();
        }
        return const LoginScreen();
      },
    );
  }
}
