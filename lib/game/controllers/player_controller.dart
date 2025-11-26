import 'package:shadow_jump/game/models/player_model.dart';

class PlayerController {
  final PlayerModel model;

  PlayerController(this.model);

  void jump() {
    if (!model.isJumping) {
      model.velocityY = -300;
      model.isJumping = true;
    }
  }

  void applyGravity(double dt) {
    model.velocityY += model.gravity * dt;
    model.y += model.velocityY * dt;
  }

  void update(double dt) {
    applyGravity(dt);
  }
}
