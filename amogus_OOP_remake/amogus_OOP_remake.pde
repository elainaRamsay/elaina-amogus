Amogus alice;

void setup(){
  size(800,800);
 
  alice = new Amogus(width/2, height/2, 0);  
}

void draw(){
  background(255);
  alice.display();
  alice.bounceAround();
  
}

void mouseDragged(){
  alice.reposition(mouseX, mouseY);
}

void keyPressed(){
  if (key == 'e' || key == 'E'){
    alice.colourIncrease();
  } else if (key == 'q' || key == 'Q'){
    alice.colourDecrease();
  }
}
