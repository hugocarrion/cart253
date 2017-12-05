//Trex trex;
Dino dino;
Fallout fallout;

int fireballs = 3;

  //calls images to class
  PImage bg;
//int x;
//int y;
PImage greendino;
PImage falloutpic;

//
void setup() {
  size(1096, 616);
  bg = loadImage("asteroid.jpg");
  dino = new Dino();
  fallout = new Fallout();
  
}

void draw() {
  //dino.update();  
  background(bg);
  greendino = loadImage("greendino.png");
  dino.update();
  dino.display();
  
  //
  fallout.displayFireball();
  fallout.updateFireball();
  
  
}

  
  //y++;
  //if (y > height) {
  //  y = 0; 
  
  //dino = new Dino(width/2, height/2);
  //}
  
  //dino.update();
  //fireball.update();
  //trex.update();