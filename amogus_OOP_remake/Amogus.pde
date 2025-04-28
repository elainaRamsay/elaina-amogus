class Amogus {

  int x = 0;
  int y = 0;
  int bodyWidth;
  int bodyHeight;
  color bodyColour;
  
  Amogus(){
    x = width/2;
    y = height/2;
    bodyWidth = 200;
    bodyHeight = 200;
    bodyColour = (#FF0000);
    
  }
  
  void display(){
    fill(bodyColour);
    rectMode(CENTER);
    rect(x,y,bodyHeight,bodyWidth);
  }
}
