float r = 0;
float b = 0;
float g = 0;

void setup() {
  size(200, 200);
  surface.setResizable(true);
}

void draw() {
  background(r, g, b);

  r = map(width, 100, displayWidth, 0, 255);
  g = map(height, 100, displayHeight, 0, 255);
  b = map(width*height, 10000, displayWidth*displayHeight, 0, 255);


  if (width < displayWidth/2) {
    String s = "expand to the right.";
    fill(250);
    text(s, 10, 10, 70, 80);  // Text wraps within text box
  }

  //this block worked before now it doesn't, didn't change anything
  if (width == displayWidth) { 
    String t = "expand down to see a nice shade of red.";
    fill(250, 250);
    text(t, 1200, 10, 1200, 80);// Text wraps within text box
  }


   if (height == displayHeight/2) {
      String w = "xdxdxd";
      fill(50);
      text(w, 100, 10, 70, 80);
    }
   


      //} else {
      //  r = 0;
   // }

    //if (mouseX > width/2) {
    //  r = r + 1;
    //} else {
    //  r = r - 1;
    //}

    //if (mouseY > height/2) {
    //  b = b + 1;
    //} else {
    //  b = b - 1;
    //}

    //if (mousePressed) {
    //  g = g + 1;
    //} else {
    //  g = g - 1;
    //}

    r = constrain(r, 0, 255);
    g = constrain(g, 0, 255);
    b = constrain(b, 0, 255);
  }

  void mouseClicked() {
    surface.setSize(1000, 20);
  }