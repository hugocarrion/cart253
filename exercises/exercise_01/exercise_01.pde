final int CIRCLE_SPEED = 4; //changed circle speed
final color NO_CLICK_FILL_COLOR = color(100, 100, 250); //changed circle color
final color CLICK_FILL_COLOR = color(250, 100, 100); //changed click color
final color BACKGROUND_COLOR = color(250, 150, 300); //changed background color  
final color STROKE_COLOR = color(150, 250, 150); // changed stroke color
final int CIRCLE_SIZE = 50; //changed circle size

int circleX;
int circleY;
int circleVX;
int circleVY;

void setup() {
  size(720, 480); //changed screen size
  circleX = width/8;
  circleY = height/16;
  circleVX = CIRCLE_SPEED;
  circleVY = CIRCLE_SPEED;
  stroke(STROKE_COLOR);
  fill(NO_CLICK_FILL_COLOR);
  background(BACKGROUND_COLOR);
}

void draw() { //when ball and mouse interject, ball changes color
  if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
  } else {
    fill(NO_CLICK_FILL_COLOR);
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  circleX += circleVX;
  circleY += circleVY;
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;

    if (mouseX > width/2) { // added
      background(150);
    } else {
      background (BACKGROUND_COLOR);
    }
  }
}

void mousePressed() {
  background(BACKGROUND_COLOR);
}
