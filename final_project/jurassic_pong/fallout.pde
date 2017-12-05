//create fallout class
class Fallout{
float x; 
float y;
float vy;
int fireballs = 1;
PImage photo;

Fallout(){

  x= random(width); 
  
  y = 0;
  
  vy = random(10,15); //controls fireball speed

  photo=loadImage("fallout.png");
  
  

}

void displayFireball(){
  
  y += vy;
  image(photo,x,y);
}


void updateFireball(){
  //if fireball reaches bottom, resets x and y
  if(y > height+15){
    y = -15;
    x = random(width);
    
  
}
}
}