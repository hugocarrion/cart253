color backgroundColor = color(0, 255, 150); //changed color 
//fundamental background variables concerning static size and color
int numStatic = 1000;
//changed static size
int staticSizeMin = 2;
int staticSizeMax = 5;
color staticColor = color(200, 0, 100);
//global variables used to set paddle speed and main characteristics
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 100;
int paddleHeight = 30;
//changed paddle color
color paddleColor = color(0, 0, 255);
//global variables used to set paddle speed and main characteristics
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
//changed ball color
color ballColor = color(0,0, 255);

int numberOfHits =1;
// initializing screen size and methods for paddle and ball
void setup() {
  size(720, 480);
  
  setupPaddle();
  setupBall();
}

void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}

void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}

void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}
//for loop that displays static size and fill the screen with static using the random method
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}
// keeps paddle from exiting the screen
void updatePaddle() {
  duplicatePaddle();
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
  
  
}
//controlls ball movement 
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;

  increaseBallSpeed();
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
  
}


//ball speed increases eveytime it hits paddle
void increaseBallSpeed(){
  if (ballOverlapsPaddle()){
      ballVX += ballVX;
      }
}

void duplicatePaddle(){
for (int i = 0; i < numberOfHits; i++){
   if(ballOverlapsPaddle()){
   paddleX = paddleX / 2;
   paddleY = paddleY / 2;
   
   }
}


}
//initialize paddle position and characteristics 
void drawPaddle() {
  rectMode(CENTER);
    noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}
//initialize ball position and characteristics 
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}
//this method controls what happens once the ball hits paddle using if statement
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
  }
  
}
//if statement controlling what happens when ball overlaps paddle 
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
    
      return true;
    }
  }
  return false;
}
//method that controlls what happens when the paddle misses the ball
void handleBallOffBottom() {
  if (ballOffBottom()) {
    ballX = width/2;
    ballY = height/2;
    }
}
//method that returns ball to center of the screen
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}
//method controlling ball action when ball hits the wall
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
  
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}
//paddle controlls using keyboard arrows when pressed
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}
//paddle controll using keyboard paddles when released
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}