//create fallout class
class Fallout{
float [] x; //array for starting fireball position
float y;
int fireballs = 5;
PImage [] photo;

Fallout(){

  x= new float[fireballs];
  
  y = 0;

  photo=new PImage[fireballs];
  for(int i=0;i<photo.length;i++){
  x[i] = random(width);
  photo[i]=loadImage("fallout.png");

}
}

void displayFireball(){
 

   
  for(int i=0;i<photo.length;i++){
  y = y + 2; // image goes down this many pixels per frame
  image(photo[i],x[i],y);
  }
}


}