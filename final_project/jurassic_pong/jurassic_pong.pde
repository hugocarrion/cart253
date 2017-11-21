//Trex trex;
Dino dino;
//Fireball fireball;

  
  PImage bg;
//int x;
//int y;
PImage greendino;


void setup() {
  size(1096, 616);
  bg = loadImage("asteroid.jpg");
  dino = new Dino();
  
}

void draw() {
  //dino.update();  
  background(bg);
  greendino = loadImage("greendino.png");
  dino.update();
  dino.display();
}

  
  //y++;
  //if (y > height) {
  //  y = 0; 
  
  //dino = new Dino(width/2, height/2);
  //}
  
  //dino.update();
  //fireball.update();
  //trex.update();