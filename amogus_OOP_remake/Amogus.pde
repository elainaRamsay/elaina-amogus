class Amogus {

  float x;
  float y;
  float dx;
  float dy;
  
  float bodyWidth, bodyHeight;
  float bagWidth, bagHeight;
  float torsoHeight;
  float headWidth, headHeight;
  color colour;
  
  color[] bodyColours = {#E30206, #1D3CE9, #1B913E, #FF63D4, #FF8D1C, #FFFF67,
                        #4A565E, #E9F7FF, #783DD2, #80582D, #44FFF7, #5BFE4B}; 
  
  Amogus(int initX, int initY, int initWidth){
    x = initX;
    y = initY;
    colour = bodyColours[0];
    bodyWidth = initWidth;
    bodyHeight = initWidth;
    torsoHeight = bodyHeight * 0.7;
    
    headWidth = bodyWidth;
    headHeight = headWidth * 0.65;
    
    
    while (dx < 1 && dx > -1){ // ensure the speed is greater than 1 in either direction
      dx = random(-3,3);
      println("x speed: ", dx);
    }
    while (dy < 1 && dy > -1){
      dy =  random(-3,3);
      println("y speed: ", dy);
    }
  }
  
  void display(){
    fill(colour);
    noStroke();
    rectMode(CENTER);
    arc(x,y-torsoHeight/2,headWidth,headHeight,PI,TWO_PI);
    rect(x,y,bodyHeight,bodyWidth);
    
    
  }
  
  void move(){
    x += dx;
    y += dy;
  }
}
