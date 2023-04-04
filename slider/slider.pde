// Define the minimum and maximum values for the slider
int minVal = 1;
int maxVal = 100;
boolean sliderDragging;
// Define the initial value of the slider
int sliderVal = 50;

void setup() {
  // Set the size of the window
  size(400, 200);
}

void draw() {
  background(255);
  // Draw the slider bar
  stroke(0);
  line(50, height/2, width-50, height/2);

  // Draw the slider rectangle
  float rectX = map(sliderVal, minVal, maxVal, 50, width-50);
  rectMode(CENTER);
  noStroke();
  fill(255, 0, 0);
  rect(rectX, height/2, 20, 20);

  // Display the slider value
  fill(0);
  textSize(20);
  textAlign(CENTER);
  text(sliderVal, rectX, height/2-30);
}

void mousePressed() {
  // Check if the mouse is over the slider rectangle
  float rectX = map(sliderVal, minVal, maxVal, 50, width-50);
  float rectY = height/2;
  if (mouseX > rectX-10 && mouseX < rectX+10 && mouseY > rectY-10 && mouseY < rectY+10) {
    // If the mouse is over the slider rectangle, set the dragging flag to true
    sliderDragging = true;
  }
}

void mouseDragged() {
  // If the dragging flag is true, update the slider value based on the mouse position
  if (sliderDragging) {
    float rectX = constrain(mouseX, 50, width-50);
    sliderVal = int(map(rectX, 50, width-50, minVal, maxVal));
  }
}

void mouseReleased() {
  // Set the dragging flag to false
  sliderDragging = false;
}
