Player p1;
Bullets b;
ArrayList<Object> objects = new ArrayList<Object>();
float BulletSpeedX, BulletSpeedY;
int score=0;
PFont sourceLight;
PImage img, arr;


void setup() {

  img = loadImage("heart.png");
  arr = loadImage("arrow1.png");
  size(1280, 720);
  rectMode(CENTER);
  p1 = new Player();
  b= new Bullets();

  for (int i=0; i<10; i++) {
    objects.add(new Object());
  }

}

void draw() {
  background(0);

  textSize(50);
  fill(255);
  text("score:", 10, 30); 
  text(score, 10, 80);

  for (int i=0; i<objects.size(); i++) {
    objects.get(i).RunProgram();
  }

  p1.RunPlayer();

  // collisions detection
  for (int i=0; i<objects.size(); i++) {

    Object o = objects.get(i);
    if (dist(b.getBulletX(), b.getBulletY(), o.getObjectPosX(), o.getObjectPosY()) <= b.getBulletRadius() + o.getObjectRadius()) {
      objects.remove(i);
      score++;
    }
  }
  if (score==10) {
    textSize(100);
    fill(255, 204, 229);
    text("Game Completed!", width/8, height/2);
  } 
 
  b.Bullet();
}
