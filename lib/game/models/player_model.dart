class PlayerModel {
  //Player
  double x;
  double y;
  double width;
  double height;

  //paremetres
  double velocityY = 0;
  double gravity = 0.6;
  double jumpforce = -12;

  bool isJumping = false;

  PlayerModel({
    required this.x,
    required this.y,
    this.width = 50,
    this.height = 50,
  });

  //update position

  void update() {
    velocityY += gravity;
    y += velocityY;
  }

  void jump() {
    if (!isJumping) {
      velocityY = jumpforce;
      isJumping = true;
    }
  }

  // comprueba que el fin del salto
  void land(double groundY) {
    y = groundY - height;
    velocityY = 0;
    isJumping = true;
  }
}
