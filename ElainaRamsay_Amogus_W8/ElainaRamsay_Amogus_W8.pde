// guess i'm drawing among us 
/* Q and E cycle through the body colours
   Amogus can be repositioned by clicking and dragging
   
   250x
*/

float bodyCentreX = 200;
float bodyCentreY = 170;

int bodyWidth = 200; //200 wide body + 50 wide backpack
int bagWidth = 50;
int bodyHeight = 240;
int torsoHeight = 140;
int headWidth = 200;
int headHeight = 130;
int legWidth = 90;
int legLength = bodyHeight/2;

float moveSpeedX = 0;
float moveSpeedY = 0;

int bodyColourPos = 0; 
color currentBodyColour = 0;

void setup(){
  size(800,800); // 800,800 window
  moveSpeedX = random(-3,3); 
  moveSpeedY = random(-3,3); //initial movespeed
  
  while (moveSpeedX < 1 && moveSpeedX > -1){
    moveSpeedX = random(-3,3);
    println("X speed: " + moveSpeedX);
  }
  
  while (moveSpeedY < 1 && moveSpeedY > -1){ // both loops ensure a minimum speed of >1 in either direction
    moveSpeedY = random(-3,3);
    println("Y speed: " + moveSpeedY);
  }
}

void draw(){
  background(255);
  noStroke();
  arc(bodyCentreX,bodyCentreY-torsoHeight/2,headWidth,headHeight,PI,TWO_PI); // draw head top
  
  //line(bodyCentreX-100,bodyCentreY-70,bodyCentreX-100,bodyCentreY+130);
  //line(bodyCentreX+100,bodyCentreX-100,bodyCentreX+100,bodyCentreY+130); // draw body sides
  
  //line(bodyCentreX-10,bodyCentreY+130,bodyCentreX-10,bodyCentreY+60);
  //line(bodyCentreX+10,bodyCentreY+130,bodyCentreX+10,bodyCentreY+60); // draw legs
  
  arc(bodyCentreX-55,bodyCentreY+130,90,25,0,PI);
  arc(bodyCentreX+55,bodyCentreY+130,90,25,0,PI); // draw feet
  
  arc(bodyCentreX,bodyCentreY+(torsoHeight/2)-10,20,5,0,PI); // draw crotch (legs middle)
 
  color[] bodyColours = {#E30206, #1D3CE9, #1B913E, #FF63D4, #FF8D1C, #FFFF67,
  #4A565E, #E9F7FF, #783DD2, #80582D, #44FFF7, #5BFE4B}; 
  color visorColour = #62CCFF;
  
  if (bodyColourPos == 0){
    currentBodyColour = bodyColours[0];
  }  
  else if (bodyColourPos == 1){
    currentBodyColour = bodyColours[1];
  }  
  else if (bodyColourPos == 2){
    currentBodyColour = bodyColours[2];
  }
  else if (bodyColourPos == 3){
    currentBodyColour = bodyColours[3];
  }
  else if (bodyColourPos == 4){
    currentBodyColour = bodyColours[4];
  }
  else if (bodyColourPos == 5){
    currentBodyColour = bodyColours[5];
  }
  else if (bodyColourPos == 6){
    currentBodyColour = bodyColours[6];
  }
  else if (bodyColourPos == 7){
    currentBodyColour = bodyColours[7];
  }
  else if (bodyColourPos == 8){
    currentBodyColour = bodyColours[8];
  }
  else if (bodyColourPos == 9){
    currentBodyColour = bodyColours[9];
  }
  else if (bodyColourPos == 10){
    currentBodyColour = bodyColours[10];
  }
  else if (bodyColourPos == 11){
    currentBodyColour = bodyColours[11];
  }
  
  stroke(currentBodyColour);
  
  fill(currentBodyColour);
  rect(bodyCentreX - bodyWidth/2 - bagWidth,bodyCentreY-torsoHeight/2,bagWidth,130); //back back/air thingo
  
  //rect(bodyCentreX-bodyWidth/2,bodyCentreY-torsoHeight,90,200); 
  //rect(bodyCentreX+10,bodyCentreY-70,90,200);
  //rect(bodyCentreX-10,bodyCentreY-50,20,110); ///background colours
  
  rect(bodyCentreX-bodyWidth/2,bodyCentreY-torsoHeight/2,bodyWidth,torsoHeight-10);
  rect(bodyCentreX-bodyWidth/2,bodyCentreY+10,legWidth,legLength);
  rect(bodyCentreX+bodyWidth/2,bodyCentreY+10,-legWidth,legLength);
  
  fill(visorColour);
  ellipse(bodyCentreX+30,bodyCentreY-60,100,70); //visor
  
  fill(currentBodyColour); //fills in the arcs for some reason so we take those
  
  stroke(0);
  // rect(bodyCentreX-150,bodyCentreY-120,250,240); //reference hitbox
  // rect(bodyCentreX-150,bodyCentreY-120,bodyCentreX+50,bodyCentreY+70);
  //rect(bodyCentreX-150,bodyCentreY-120,bodyWidth+bagWidth,bodyHeight);
  
  //bodyCentreX = bodyCentreX + moveSpeedX;
  //bodyCentreY = bodyCentreY + moveSpeedY; // movement

  if (bodyCentreX <= 150 || bodyCentreX >= width-100){
    moveSpeedX = -moveSpeedX;
    println("hit side");
  }
  if (bodyCentreY <= 120 || bodyCentreY >= height-120){
    moveSpeedY = -moveSpeedY;
    println("hit vertwall");
  }

  //Make it so if it hits the corner it does something funny

}

void mouseDragged(){
  int requestedPosX;
  int requestedPosY;
  
  requestedPosX = mouseX;
  requestedPosY = mouseY;
  
  if (requestedPosX < 150){
    bodyCentreX = 150; //ensures that the amogus does not get trapped at the wall by forcing it to be within the set bounds when dragged
  }
  else if (requestedPosX > width-100){
    bodyCentreX = width-100;
  }
  else if (requestedPosY < 120){
    bodyCentreY = 120;
  }
  else if (requestedPosY > height-120){
    bodyCentreY = height-120;
  }
  else {
    bodyCentreX = mouseX;
    bodyCentreY = mouseY;
  }
}

void keyPressed(){
  // have a value for colour position
  // Pressing E increases, Q decreases
  // Cycles through colours with Q and E
  
  if (key == 'e' || key == 'E'){
    if (bodyColourPos == 11){
      bodyColourPos = 0;
    }
    else {
      bodyColourPos +=1;
    }
    
    println("colour: " + bodyColourPos);
  }
  
  if (key == 'q' || key == 'Q'){
    if (bodyColourPos == 0){
      bodyColourPos = 11;
    }
    else {
      bodyColourPos -=1;
    }
    println("colour: " + bodyColourPos);
  }
}
