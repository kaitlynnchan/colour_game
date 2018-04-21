import fisica.*;

//fisica
FWorld world;

final int INTRO = 1;
final int PLAYING = 2;
final int GAMEOVER = 3;
int mode = INTRO;

int x, y;

//colors
color black = color(0, 0, 0);
color white = color(255, 255, 255);
color orange = color(255, 127, 39);
color pale = color(239, 228, 176);
color red = color(237, 28, 36);
color lavender = color(200, 191, 231);
color blue = color(63, 72, 204);
color yellow = color(255, 242, 0);
color green = color(34, 177, 76);
color purple = color(163, 73, 164);

int gridSize = 20;
PImage colorBall;
PImage map;

ArrayList<FBox> terrain;
ArrayList<FBox> enemies;
ArrayList<FPoly> enemies2;
ArrayList<FCircle> enemies3;

boolean w, a, s, d, upkey, leftkey, rightkey, downkey, spacekey;

float dx;
FCircle player;

boolean jumping = false;

int cPlayer = (int)random(0, 3);//(int)random(0,6)
int cObstacle = (int)random(0, 3);
int cObstacle2 = (int)random(0, 3);
int cObstacle3 = (int)random(0, 3);
int cObstacle4 = (int)random(0, 3);
int cObstacle5 = (int)random(0, 3);
//int w = (int)random(0,6);

void setup() {
  size(400, 600, FX2D);
  //rectMode(CORNER);
  terrain = new ArrayList<FBox>();
  enemies = new ArrayList<FBox>();
  enemies2 = new ArrayList<FPoly>();
  enemies3 = new ArrayList<FCircle>();
  map = loadImage("map.png");
  colorBall = loadImage("circle_gradient.png");
  colorBall.resize(gridSize, gridSize);

  loadWorld();
}

void draw() {
  background(black);
  println(cPlayer, cObstacle2);
  //println(player.getX(), player.getY());//player.getX(), player.getY()

  updateTerrain();
  updatePlayer();
  updateEnemies();
  if (mode == INTRO) {
    drawIntro();
  } else if (mode == PLAYING) {
    pushMatrix();
    translate(-player.getX() + width/2, -player.getY() + height/2);
    world.step();
    world.draw();
    popMatrix();
    
    drawPlaying();
  } else if (mode == GAMEOVER) {
    pushMatrix();
    translate(-player.getX() + width/2, -player.getY() + height/2);
    world.step();
    world.draw();
    popMatrix();
    
    drawGameover();
  }
}

void mouseReleased(){
 if(mode == INTRO){
   if(dist(mouseX, mouseY, width/2, height/2) < 50) mode = PLAYING;
 }
 if(mode == GAMEOVER){
   if(mouseX >= width/2 - 55 && mouseX <= 383 && mouseY >= height/2 + 25 && mouseY <= 160) mode = INTRO;
 }
}

void keyPressed() {
  if (key == ' ') spacekey = true;
}


void keyReleased() {
  if (key == ' ') spacekey = false;
}