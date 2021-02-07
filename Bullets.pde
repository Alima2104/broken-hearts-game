class Bullets {

  float gravity = 0;
  float gravitySpeed = 0.00981;

  float userX = p1.getPlayerPosX();
  float userY = p1.getPlayerPosY();
  float canonSize = 50;
  float power = 0;

  float bulletSpeedX = 0;
  float bulletSpeedY = 0;
  float bulletX = 0;
  float bulletY = 0;
  float bulletRadius=20;
  Boolean renderBullet = false;

  float chargeAngle = PI/10.0f;
  Boolean charging = false;

  float getBulletX() {
    return bulletX;
  }

  float getBulletY() {
    return bulletY;
  }

  float getBulletRadius() {
    return bulletRadius;
  }

  float getBulletSpeedX() {
    return bulletSpeedX;
  }

  float getBulletSpeedY() {
    return bulletSpeedY;
  }

  void setBulletSpeedX(float speedX) {
    BulletSpeedX=speedX;
  } 

  void setBulletSpeedY(float speedY) {
    BulletSpeedY=speedY;
  }

  void Bullet() {
    //calcul the distance x & y between the user & the mouse
    float dx = mouseX - p1.getPlayerPosX();
    float dy = mouseY - p1.getPlayerPosY();

    //calcul the angle from the user to the mouse
    float angle = atan2(dy, dx);

    //draw the canon
    stroke(0);
    strokeWeight(10);
    line(p1.getPlayerPosX(), p1.getPlayerPosY(), p1.getPlayerPosX() + cos(angle) * canonSize, p1.getPlayerPosY() + sin(angle) * canonSize);

    if (mousePressed) {
      charging = true;

      //increase power
      power++;

      //draw power charge
      strokeWeight(2);
      stroke(153, 153, 255);
      line(p1.getPlayerPosX(), p1.getPlayerPosY(), p1.getPlayerPosX() + cos(angle - chargeAngle) * power, p1.getPlayerPosY() + sin(angle-chargeAngle)*power);
      line(p1.getPlayerPosX(), p1.getPlayerPosY(), p1.getPlayerPosX() + cos(angle + chargeAngle) * power, p1.getPlayerPosY() + sin(angle+chargeAngle)*power);
    } else {

      if (charging) {

        //find the correct speed from angle & power
        bulletSpeedX = cos(angle) * power;
        bulletSpeedY = sin(angle) * power;

        //set the start position of the bullet at the position of the user
        bulletX = p1.getPlayerPosX();
        bulletY = p1.getPlayerPosY();

        //tell the program to render the bullet
        renderBullet = true;

        charging = false;
        power = 0;
      }
    }

    if (renderBullet) {
      //apply gravity
      gravity += gravitySpeed;
      bulletSpeedY += gravity; 
      //apply speed
      bulletX += bulletSpeedX;
      bulletY += bulletSpeedY;

      //render the bullet
      noStroke();
      fill(0);
      ellipse(bulletX, bulletY, bulletRadius, bulletRadius);
      imageMode(CENTER);
      image(arr, bulletX, bulletY, bulletRadius*1.5, bulletRadius*1.5);

      //check if we still need to render the bullet 
      if (bulletY > 600) renderBullet = false;
    }
  } 

}
