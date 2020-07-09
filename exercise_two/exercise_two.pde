Line[] newLine = new Line[500];

// The starting factors for the noise (will be randomised after every click)
float noiseScale = 500;
float noiseStrength = 25;

// How the noise is displayed
float overlayAlpha = 0;
float lineAlpha = 255;
float strokeWidth = .3;

// Parameters for the circle
float radius = 250;
float rTemp = radius;

// Animation-Variables
float limit = 200;
float timer = 0;

boolean mousePressed;


void setup() {
  size(1000, 1000);
  smooth();
  background(0);

  for (int i = 0; i < newLine.length; i++) {
    newLine[i] = new Line();
  }
}

void draw() {
  // background related
  fill(0, overlayAlpha);
  rect(-5, -5, width + 10, height + 10);
  circle(width/2, height/2, radius * 2);

  // Animate Line
  for (int i = 0; i < newLine.length; i++) newLine[i].drawLine(255);
}

void mousePressed() {
  mousePressed = true;
  if ( mousePressed == true) {
    for (int i = 0; i < newLine.length; i++) {
      newLine[i].reDrawIt();
    }
    mousePressed = false;
  }
}
