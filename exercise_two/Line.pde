class Line {
  // x, y    = Current position
  // ox, oy  = This is the position a little bit "back in time"
  // sx, sy  = Starting position
  float x, y, ox, oy, sx, sy;

  float angle = 0;
  float step;
  int NDo;
  boolean isOutside = false;

  Line() {
    step = 5;
    NDo = int(random(360));
    sx = width/2  + radius * cos(NDo);
    sy = height/2 + radius * sin(NDo);
    x = sx;
    y = sy;
  }

  void drawLine(color tempColor) {
    // Calculates the angle, based on the noise and use it for the x and y positions
    angle = noise(x / noiseScale, y / noiseScale) * noiseStrength;

    // Writes the last values of x and y into the variables old x and old y.
    ox = x;
    oy = y;

    // Calculates the new positions
    x += cos(angle) * step;
    y += sin(angle) * step;

    // Set the boolean "isOutside" to true, when it hits the border
    if (x < -2) isOutside = true;
    else if (x > width + 2) isOutside = true;
    else if (y < -2) isOutside = true;
    else if (y > height + 2) isOutside = true;

    if (isOutside) {
      x = ox;
      y = oy;
    }

    // Show
    noFill();
    stroke(tempColor, lineAlpha);
    strokeWeight(strokeWidth);
    line(ox, oy, x, y);
    
    // Set the boolean to false again, for the next circle
    isOutside = false;
  }

  void reDrawIt() {
    // Resets the background
    fill(0);
    rect(-5, -5, width + 10, height + 10);

    // Create the new noise
    noiseScale = int(random(400, 700));
    noiseStrength = int(random(25,75));
    noiseDetail(int(random(1, 10)), 0.5);

    // Reset all the parameters, so it creates everytime an unique image
    x = sx;
    y = sy;
    NDo = int(random(360));
    sx = width/2  + radius * cos(NDo);
    sy = height/2 + radius * sin(NDo);
    ox = x;
    oy = y;
  }
}
