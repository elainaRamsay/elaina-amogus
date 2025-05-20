Amogus alice;

void setup(){
  size(1400,800);
 
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
  
  if (isValidColour(key) == 0){
    // set all obj colours
    alice.setColour(key);
  }
  else if (isValidColour(key) == 1){
    alice.setColour(keyToInt(key));
  }
  
}

int isValidColour(char input){
  if (input == '1' || input == '2' || input == '3' || input == '4' || input == '5' || input == '6' || input == '7' || input == '8' || input == '9' || input == '0'){
    return 0;
  } 
  else if (input == '-' || input == '_' || input == '=' || input == '+'){
    return 1;
  } 
  else {
    return 2;
  }
}

int keyToInt(char input){
  if (input == '-' || input == '_'){
    return 10;
  }
  else if (input == '=' || input == '+'){
    return 11;
  }
  else {
    return 0;
  }
}
