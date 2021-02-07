class Object {
  float posX, posY;
  float objectRadius;
  float speedX, speedY;
  float object_theta;
  int directionX;
  int directionY;
  color objectColor;
  float maxObjectOffset = 0.001;

  //constructor
  Object() {
    posX=random(0, 1280);
    posY=random(0, 360);
    objectRadius=80;
    objectColor =color(250, random(100, 200), random(150, 255));
    object_theta = random(TWO_PI);
    speedX = 10;
    speedY = 10;

    // println(directionX);
  }

  void RunProgram() {
    DrawObject();

    MoveObjects();

    StayInsideCanvas();
  }

  void DrawObject() {
    fill(objectColor);
    noStroke();
    circle(posX, posY, objectRadius*2);
    imageMode(CENTER);
    image(img, posX, posY, objectRadius*1.5, objectRadius*1.5);
  }

  void StayInsideCanvas()
  {
    if (posX >= width-objectRadius) {
      speedX *= -1;

    } else if (posX <= 0+objectRadius) {
      speedX *= -1;
    }
    if (posY >= height/2-objectRadius) {
      speedY *= -1;
    } else if (posY <= 0+objectRadius) {
      speedY *= -1;
    }
  }

  void MoveObjects() {
    float object_offset = random(-maxObjectOffset, maxObjectOffset);
    object_theta += object_offset;
    posX += cos(object_theta)*speedX;
    posY += sin(object_theta)*speedY;
  }
  float getObjectPosX() {
    return posX;
  }

  float getObjectPosY() {
    return posY;
  }

  float getObjectRadius() {
    return objectRadius;
  }
}
