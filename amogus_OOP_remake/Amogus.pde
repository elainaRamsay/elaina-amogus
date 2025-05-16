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

  int colourPos;
  color bodyColour;
  color[] colours = {#E30206, #1D3CE9, #1B913E, #FF63D4, #FF8D1C, #FFFF67,
    #4A565E, #E9F7FF, #783DD2, #80582D, #44FFF7, #5BFE4B};
  color visorColour = #62CCFF;

  Amogus(float initX, float initY, int initColour) {
    centreX = initX;
    centreY = initY;
    colourPos = initColour;

    bodyWidth = 200;
    bagWidth = 50;
    bodyHeight = 240;
    torsoHeight = 140;
    headWidth = 200;
    headHeight = 130;
    legWidth = 90;
    ;
    legLength = bodyHeight/2;

    dx = random(-3, 3);
    dy = random(-3, 3);

    while (dx < 1 && dx > -1) {
      dx = random(-3, 3);
    }
    while (dy < 1 && dy > -1) {
      dy = random(-3, 3);
    }
  }

  void display(){
    noStroke();
    arc(centreX, centreY-torsoHeight/2, headWidth, headHeight, PI, TWO_PI); // top of head
    
    arc(centreX-55, centreY+130, 90, 25, 0, PI); // feet
    arc(centreX+55, centreY+130, 90, 25, 0, PI);
    
    arc(centreX, centreY+(torsoHeight/2)-10, 20, 5, 0, PI); // crotch
    
    colourSelect();
    stroke(bodyColour);
    fill(bodyColour);
    
    rect(centreX-(bodyWidth/2)-bagWidth, centreY-torsoHeight/2, bagWidth, 130); // bag
    
    rect(centreX-bodyWidth/2,centreY-torsoHeight/2,bodyWidth,torsoHeight-10); // torso
    rect(centreX-bodyWidth/2,centreY+10,legWidth,legLength); // legs
    rect(centreX+bodyWidth/2,centreY+10,-legWidth,legLength);
    
    fill(visorColour);
    ellipse(centreX+30, centreY-60, 100, 70); // visor
    
    fill(bodyColour);
  }

  void reposition(float requestedX, float requestedY){
    if (requestedX < 150){
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
  
  void bounceAround(){
    centreX += dx;
    centreY += dy;
    
    if (centreX <= 150 || centreX >= width-100){
      dx = -dx;
    }
    if (centreY <= 120 || centreY >= height-120){
      dy = -dy;
    }
  }

  private void colourSelect() {
    if (colourPos == 0) {
      bodyColour = colours[0];
    } else if (colourPos == 1) {
      bodyColour = colours[1];
    } else if (colourPos == 2) {
      bodyColour = colours[2];
    } else if (colourPos == 3) {
      bodyColour = colours[3];
    } else if (colourPos == 4) {
      bodyColour = colours[4];
    } else if (colourPos == 5) {
      bodyColour = colours[5];
    } else if (colourPos == 6) {
      bodyColour = colours[6];
    } else if (colourPos == 7) {
      bodyColour = colours[7];
    } else if (colourPos == 8) {
      bodyColour = colours[8];
    } else if (colourPos == 9) {
      bodyColour = colours[9];
    } else if (colourPos == 10) {
      bodyColour = colours[10];
    } else if (colourPos == 11) {
      bodyColour = colours[11];
    }
  }

  void colourIncrease() {
    if (colourPos == 11) {
      colourPos = 0;
    } else {
      colourPos++;
    }
  }

  void colourDecrease() {
    if (colourPos == 0) {
      colourPos = 11;
    } else {
      colourPos--;
    }
  }
}
