class Menu {
  
  String title;
  Button startButton;
  Button quitButton;
  Button modeButton;
  
  Menu(String title, float menuWidth, float menuHeight) {
    this.title = title;
    startButton = new Button("Start", width/2, height/2 - 50);
    quitButton = new Button("Quit", width/2, height/2 + 50);
    modeButton = new Button("Mode", width/2, height/2 + 150);
  }
  
  void display() {
    background(0);
    textAlign(CENTER, CENTER);
    textSize(100);
    fill(255);
    text(title, width/2, height/4);
    startButton.display();
    quitButton.display();
    modeButton.display();
  }
  
  void handleMouseClick() {
    if (startButton.isClicked()) {
      // Start button clicked, start the game
      // Add your game start logic here
      println("Starting the game...");
    } else if (quitButton.isClicked()) {
      // Quit button clicked, quit the game
      // Add your game quit logic here
      println("Quitting the game...");
      exit();
    } else if (modeButton.isClicked()) {
      // Mode button clicked, go to mode selection screen
      // Add your mode selection logic here
      println("Going to mode selection screen...");
    }
  }
}

class Button {
  
  String label;
  float x, y;
  float w = 100;
  float h = 50;
  
  Button(String label, float x, float y) {
    this.label = label;
    this.x = x;
    this.y = y;
    //print(label + ": " + x + " , " + y);
  }
  
  void display() {
    stroke(0);
    fill(200);
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }
  
  boolean isClicked() {
    return mouseX > x - w/2 && mouseX < x + w/2 &&
           mouseY > y - h/2 && mouseY < y + h/2 &&
           mousePressed;
  }
}

Menu menu;

void setup() {
  // TODO: Switch to using fullscreen for final gameplay purposes
  size(800, 600);
  //fullScreen();
  background(0);
  
  menu = new Menu("Game", width, height);
}

void draw() {
  menu.display();
}
