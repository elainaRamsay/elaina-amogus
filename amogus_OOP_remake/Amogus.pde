class Amogus {
  float centreX;
  float centreY;

  int bodyWidth;
  int bagWidth;
  int bodyHeight;
  int torsoHeight;
  int headWidth;
  int headHeight;
  int legWidth;
  int legLength;

  float dx;
  float dy;
  float ay;

  int colourPos;
  color bodyColour;
  color[] colours = {#E30206, #1D3CE9, #1B913E, #FF63D4, #FF8D1C, #FFFF67,
    #4A565E, #E9F7FF, #783DD2, #80582D, #44FFF7, #5BFE4B};
  color visorColour = #62CCFF;
  
  boolean isSelected;
  
  Amogus(float initX, float initY, int initColour) {
    centreX = initX;
    centreY = initY;
    
    colourPos = initColour;
    isSelected = false;

    bodyWidth = 200;
    bagWidth = 50;
    bodyHeight = 240;
    torsoHeight = 140;
    headWidth = 200;
    headHeight = 130;
    legWidth = 90;
    legLength = bodyHeight/2;

    dx = random(-3, 3);
    dy = random(-3, 3);
    ay = 0.15;

    while (dx < 1 && dx > -1) { // ensure initial dx and dy are above 1 (not too slow)
      dx = random(-3, 3);
    }
    while (dy < 1 && dy > -1) {
      dy = random(-3, 3);
    }
  }

  void display(){
    noStroke();
    
    colourSelect();
    fill(bodyColour);
    
    arc(centreX, centreY-torsoHeight/2, headWidth, headHeight, PI, TWO_PI); // top of head
    
    arc(centreX-55, centreY+130, 90, 25, 0, PI); // feet
    arc(centreX+55, centreY+130, 90, 25, 0, PI);
    
    arc(centreX, centreY+(torsoHeight/2)-10, 20, 5, 0, PI); // crotch
    
    stroke(bodyColour);
    
    rect(centreX-(bodyWidth/2)-bagWidth, centreY-torsoHeight/2, bagWidth, 130); // bag
    
    rect(centreX-bodyWidth/2,centreY-torsoHeight/2,bodyWidth,torsoHeight-10); // torso
    rect(centreX-bodyWidth/2,centreY+10,legWidth,legLength); // legs
    rect(centreX+bodyWidth/2,centreY+10,-legWidth,legLength);
    
    fill(visorColour);
    ellipse(centreX+30, centreY-60, 100, 70); // visor
    
    if (isSelected){
      select();
    }
  }

  void reposition(float requestedX, float requestedY){
    if (isSelected){
      if (requestedX < 150){  // ensure that none of the amogus is clipping outside the window boundary
        centreX = 150;
      } else if (requestedX > width-100){
        centreX = width-100;
      } else if (requestedY < 120){
        centreY = 120;
      } else if (requestedY > height-120){
        centreY = height-120;
      } else {
        centreX = requestedX;
        centreY = requestedY;
      }
    }
  }
  
  void bounceAround(){
    centreX += dx;
    centreY += dy;
    
    if (centreX <= 150 || centreX >= width-100){ // bounce back when touching a wall
      dx = -dx;
    }
    if (centreY <= 120 || centreY >= height-120){
      dy = -dy;
    }
  }

  void hopAround(){

    centreX += dx; // move sideways
    dy += ay;
    centreY += dy;
    
    if (centreY + bodyHeight/2 > height && dy > 0){ // if feet go below bottom of window and dy is positive
      if (dy > 10){
        dy = 10;
      }
      
      dy = -dy - ay; // reverse dy, subtract acceleration
    }
    if (centreY < bodyHeight/2 && dy < 0){ // if centreY is less than half the body height, and dy is negative (if head touches the ceiling and dy is negative)
      if (dy < -10) {
        dy = -10;
      }
      
      dy = -dy - ay;
    }
    
    if (centreX <= 150 || centreX >= width-100){ // bounce back when touching a wall
      dx = -dx;
    }
    
  }

  private void colourSelect() { 
    bodyColour = colours[colourPos];
  }
  
  void setColour(int i){
    if (i == 10 || i == 11){
      colourPos = i;
    } else {
      colourPos = i - 48;
    }
  }
  
  void colourIncrease() {
    if (colourPos == colours.length-1) {
      colourPos = 0;
    } else {
      colourPos++;
    }
  }

  void colourDecrease() {
    if (colourPos == 0) {
      colourPos = colours.length-1;
    } else {
      colourPos--;
    }
  }
  
  void clickedOn(float testX, float testY){
    if (dist(testX, testY, centreX, centreY) <= bodyHeight/2){
      isSelected = true;
    }
    else {
      isSelected = false;
    }
  }
  
  boolean checkIfSelected(){
    if (isSelected){
      return true;
    }
    else {
      return false;
    }
  }
  
  private void select(){
    fill(0);
    circle(centreX, centreY, 30);
  }
}
