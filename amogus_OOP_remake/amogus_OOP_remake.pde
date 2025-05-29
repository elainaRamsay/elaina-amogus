/*
This program is an animation of Among Us characters that hop around the screen
 Click on an amogus to select it. While an amogus is selected, Q and E will change its colour
 Click on empty space to unselect all amogii
 
 Pressing any key from '1' to '=' (the top row of a QWERTY keyboard) will set all the amogii colours to the same in one fell swoop
 Pressing the R key will randomise all the amogii colours
 
 Clicking and dragging on a selected amogus will allow you to reposition it
 */

//Amogus alice;

Amogus[] amogii = new Amogus[4];

void setup() {
  size(1400, 800);
  
  float spacing = 300;
  
  for (int i = 0; i < amogii.length; i++) {
    amogii[i] = new Amogus(100 + spacing * i, height/2, int(random(0, 12)));
  }
}

void draw() {
  background(255);

  for (int i = 0; i < amogii.length; i++) {
    amogii[i].display();
    amogii[i].hopAround();
  }
}

void mouseDragged() {
  for (int i = 0; i < amogii.length; i++) {
    amogii[i].reposition(mouseX, mouseY);
  }
}

void mouseClicked() {
  for (int i = 0; i < amogii.length; i++) {
    amogii[i].clickedOn(mouseX, mouseY);
  }
}

void keyPressed() {

  if (key == 'e' || key == 'E') {
    for (int i = 0; i < amogii.length; i++) {
      if (amogii[i].checkIfSelected() == true) {
        amogii[i].colourIncrease();
      }
    }
  } else if (key == 'q' || key == 'Q') {
    for (int i = 0; i < amogii.length; i++) {
      if (amogii[i].checkIfSelected() == true) {
        amogii[i].colourDecrease();
      }
    }
  } else if (key == 'r' || key == 'R'){
    for (int i = 0; i < amogii.length; i++){
      amogii[i].setColourIndex(int(random(12)));
    }
  }
  

  if (isValidColour(key) == 0) {
    // set all obj colours
    for (int i = 0; i < amogii.length; i++) {
      amogii[i].setColourKey(key);
    }
  } else if (isValidColour(key) == 1) {
    for (int i = 0; i < amogii.length; i++){
      amogii[i].setColourKey(keyToInt(key));
    }
  }
}

int isValidColour(char input) {
  if (input == '1' || input == '2' || input == '3' || input == '4' || input == '5' || input == '6' || input == '7' || input == '8' || input == '9' || input == '0') {
    return 0;
  } else if (input == '-' || input == '_' || input == '=' || input == '+') {
    return 1;
  } else {
    return 2;
  }
}

int keyToInt(char input) {
  if (input == '-' || input == '_') {
    return 10;
  } else if (input == '=' || input == '+') {
    return 11;
  } else {
    return 0;
  }
}
