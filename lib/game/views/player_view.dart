import 'package:flutter/material.dart';
import 'package:shadow_jump/game/models/player_model.dart';

class PlayerView extends StatelessWidget {
  //player
  final PlayerModel model;

  const PlayerView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: model.x,
      top: model.y,
      child: Container(
        width: model.width,
        height: model.height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
