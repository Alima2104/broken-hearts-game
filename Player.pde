class Player {
  float posX, posY;
  float playerWidth, playerHeight;
  float speedX;
  color playerColor;


  Player() {
    playerWidth=200;
    playerHeight=100;
    posX=playerWidth;
    posY=height-playerHeight;
    playerColor =color(153, 153, 255);
  }

  void RunPlayer() {
    DrawPlayer();
    MovePlayer();
  }

  void DrawPlayer() {

    noFill();
    stroke(playerColor);
    // fill(playerColor);
    // noStroke();
    rect(posX, posY, playerWidth, playerHeight);
  }

  void MovePlayer() {
    posX = mouseX;
  }

  float getPlayerPosX() {
    return posX;
  }

  float getPlayerPosY() {
    return posY;
  }
}
