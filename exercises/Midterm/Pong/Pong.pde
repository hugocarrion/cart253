// Pong
//
// A simple version of Pong using object-oriented programming.
// Allows to people to bounce a ball back and forth between
// two paddles that they control.
//
// No scoring. (Yet!)
// No score display. (Yet!)
// Pretty ugly. (Now!)
// Only two paddles. (So far!)

// Global variables for the paddles and the ball
Paddle leftPaddle;
Paddle rightPaddle;
Ball ball;

//initialize values to control game score and decide when game is over
int gameLimit = 5;

// The distance from the edge of the window a paddle should be
int PADDLE_INSET = 8;

// The background colour during play (black)
color backgroundColor = color(150,150,200);


// setup()
//
// Sets the size and creates the paddles and ball

void setup() {
  // Set the size
  size(640, 480);
  //set the text size
  textSize(30);
  

  // Create the paddles on either side of the screen. 
  // Use PADDLE_INSET to to position them on x, position them both at centre on y
  // Also pass through the two keys used to control 'up' and 'down' respectively
  // NOTE: On a mac you can run into trouble if you use keys that create that popup of
  // different accented characters in text editors (so avoid those if you're changing this)
  leftPaddle = new Paddle(PADDLE_INSET, height/2, '1', 'q');
  rightPaddle = new Paddle(width - PADDLE_INSET, height/2, '0', 'p');

  // Create the ball at the centre of the screen
  ball = new Ball(width/2, height/2);
  
  
 
}

// draw()
//
// Handles all the magic of making the paddles and ball move, checking
// if the ball has hit a paddle, and displaying everything.

void draw() {
  // Fill the background each frame so we have animation
  background(backgroundColor);

  // Update the paddles and ball by calling their update methods
  leftPaddle.update();
  rightPaddle.update();
  ball.update();

  // Check if the ball has collided with either paddle
  ball.collide(leftPaddle);
  ball.collide(rightPaddle);

  // Check if the ball has gone off the screen
  if (ball.isOffScreen()) {
    // If it has, reset the ball
    
    ball.reset();
  }

  // Display the paddles and the ball
  leftPaddle.display();
  rightPaddle.display();
  ball.display();
  
  //calls method to display score
  showScores();
  
  gameOver();
  
  
}
//will call methods tha keep track of the score from ball class and display it as text
void showScores(){
  fill(255);
  text(ball.scoreR,100,50);
  text(ball.scoreL, width-100,50);

}

//calls method that sets the ball speed to zero when game limit is reached and shows message
void gameOver(){
  
  if(ball.scoreL == gameLimit){
  
    ball.changeVy(0);
    ball.changeVx(0);
    text("Right paddle wins!", width/2,height/3 - 40);
    text("Click to start again",width/2,height/3 +40);
    restartGame();
  }
  
  
  if(ball.scoreR == gameLimit){
  
    ball.changeVy(0);
    ball.changeVx(0);
    text("Left paddle wins!", width/2,height/3 -40);
    text("Click to start again",width/2,height/3 +40);
    restartGame();
  }
}
//method that restarts game when mouse clicked (does not work rn)
void restartGame(){

  if(mousePressed){
  
    ball.resetScore();
    ball.changeVy(5);
    ball.changeVx(5);
  }

}

// keyPressed()
//
// The paddles need to know if they should move based on a keypress
// so when the keypress is detected in the main program we need to
// tell the paddles

void keyPressed() {
  // Just call both paddles' own keyPressed methods
  leftPaddle.keyPressed();
  rightPaddle.keyPressed();
}

// keyReleased()
//
// As for keyPressed, except for released!

void keyReleased() {
  // Call both paddles' keyReleased methods
  leftPaddle.keyReleased();
  rightPaddle.keyReleased();
}