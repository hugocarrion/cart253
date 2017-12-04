class Dino {
  PImage image;
  int x;
  int y;
  int vx;
  int vy;
  //int[] arrayOfDinos = new int [5];
  
  Dino() {
    x = width/2;
    y = height/2;
    vx = 10;
    vy = 10;
    image = loadImage("greendino.png");
  }

  void update() {
    x += vx;
    y += vy;

    
    if (x - image.width/2 < 0 || x + image.width/2 > width) {
      vx = -vx;
    }
    if (y - image.height/2 < 0 || y + image.height/2 > height) {
      vy = -vy;
    }

    x = constrain(x, image.width/2, width - image.width/2);
    y = constrain(y, image.height/2, height - image.height/2);
  }

  void display() {
    imageMode(CENTER);
    image(image, x, y);
  }
  
  void draw(){
   //for ( int i = 0; i < 6; i++) {
    // dino[i]. ascend();
    // dino[i]. display();
    // dino[i]. top();
    }
    
  }