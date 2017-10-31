//color c;

void setup() {
  size(200,200);
  c = color(random(255), random(255), random(255));
  surface.setResizable(true); // Put this in setup
}
void draw() {
  println(width,height);
  background(c);
}
void mouseClicked() {
  surface.setSize(1000,20); // Change size with this
  if (size>(200,200)){
   float c = color(random(255),random(255),random(255));
}
}