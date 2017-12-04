class Fallout{
float x; 
float y;
PImage photo;

Fallout(){

  x= width;
  y = height;
}

void displayFireball(){

   y = y+2; // image goes up this many pixels per frame
  image(photo,x,y);


}


}