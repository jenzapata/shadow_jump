import 'package:flutter/material.dart';
import 'package:shadow_jump/game/controllers/game_loop.dart';
import 'package:shadow_jump/game/controllers/player_controller.dart';
import 'package:shadow_jump/game/models/player_model.dart';
import 'package:shadow_jump/game/views/player_view.dart';

class GameView extends StatefulWidget {
  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  // aquí irán modelo, controlador y loop
  late PlayerModel player;
  late PlayerController controller;
  late GameLoop loop;

  @override
  void initState() {
    super.initState();
    player = PlayerModel(x: 0, y: 0, width: 50, height: 50);
    controller = PlayerController(player);
    loop = GameLoop(controller);
    loop.start();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.jump,
      child: ValueListenableBuilder<bool>(
        valueListenable: loop.notifier,
        builder: (context, _, __) {
          return Stack(children: [PlayerView(model: player)]);
        },
      ),
    );
  }
}
