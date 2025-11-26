import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shadow_jump/game/controllers/player_controller.dart';

class GameLoop {
  final PlayerController controller;

  ValueNotifier<bool> notifier = ValueNotifier(false);
  late Ticker ticker;
  Duration lastTime = Duration.zero;

  GameLoop(this.controller);

  void start() {
    ticker = Ticker(_onTick);
    ticker.start();
  }

  void _onTick(Duration elapsed) {
    //dt del ultimo frame
    final double dt = (elapsed - lastTime).inMilliseconds / 1000;
    // tiempo para el siguente
    lastTime = elapsed;
    controller.update(dt);
    //notificar para dibujar
    notifier.value = !notifier.value;
  }
}
