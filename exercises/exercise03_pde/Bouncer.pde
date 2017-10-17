class Bouncer {
  
 int x;
 int y;
 int vx;
 int vy;
 int size;
 int random;
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }
 
 void update() {
   /*original 2 += 2
   edit   2 += 2 * 2
   */
   x += vx;
   y += vy;
   
   handleBounce();
   handleMouse();
 }
 
 void handleBounce() {
   
   if (x - size/2 < 0 || x + size/2 > width) {
    // 2 = -2  
    //multiplies the speed everytime it bounces on the x axis
    vx = -vx*2; 
   }
   
   if (y - size/2 < 0 || y + size/2 > height) {
     
     //2 = -2 
     //multiplies the speed everytime it bounces on the y axis
     vy = -vy*2;
   }
   // min=25 max=715
  // x = constrain(x,size/2,width-size/2);
   x = constrain(x,size/2,width-size/2);
   // min = 25 max= 265
   y = constrain(y,size/2,height-size/2);
 }
 
void ifMouseClicked(int tempVX, int tempVY){
 
  vx = -tempVX;
  vy = -tempVY;
  
}
 
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   else {
     fillColor = defaultColor;
   }
 }
 
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
}