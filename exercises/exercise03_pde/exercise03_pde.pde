// Set the backbground colour  
color backgroundColor = color(200,150,150);
int changeVX = 0;
int randomVX;
int randomVY;

Bouncer bouncer;
Bouncer bouncer2;
//set up ball characteristics with 7 parameters for the output
void setup() {
  size(740,580);
  background(backgroundColor);
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}



void mouseClicked() {
  
  //red ball randomly changes direction when clicked 
  if (changeVX   >= 0) {
    randomVX = int(random(1, 5));
    randomVY = int(random(1, 5));
    //changeVX = color(randomVX,0,0,50);
  }
}

//calls the methods that determines how the balls behave
void draw() {
  
  
  bouncer.update();
  bouncer2.update();
  bouncer.draw();
  bouncer2.draw();
  
  bouncer.ifMouseClicked(randomVX, randomVY);
  
  
  
}