class Menu {
  
  String title;
  Button startButton;
  Button quitButton;
  Button modeButton;
  PFont font;
  PImage bloodImg;
  
  Menu(String title) {
    this.title = title;
    startButton = new Button("Start", width/2, height/2);
    quitButton = new Button("Quit", width/2, height/2 + 60);
    modeButton = new Button("Mode", width/2, height/2 + 120);
    
    this.font = createFont("youmurdererbb.otf", 128);
    textFont(this.font);
    
    bloodImg = loadImage("data/Images/blood_dripping.gif");
  }
  
  void display() {
    background(0);
    
    // TODO: get blood dripping gif to be animated
    imageMode(CORNER);
    image(bloodImg, 0, 0, width, height);
    
    textAlign(CENTER, CENTER);
    textSize(100);
    fill(180, 25, 25);
    text(title, width/2, height/4);
    text("(No CAP)", width/2, 1.5*height/4);
    startButton.display();
    quitButton.display();
    modeButton.display();
  }
  
  void handleMouseClick() {
    if (startButton.isClicked()) {
      // Start button clicked, start the game
      // TODO: Add game start logic here
      println("Starting the game...");
    } else if (quitButton.isClicked()) {
      // Quit button clicked, quit the game
      // TODO: Add game quit logic here
      println("Quitting the game...");
      exit();
    } else if (modeButton.isClicked()) {
      // Mode button clicked, go to mode selection screen
      // TODO: Add mode selection screen
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
  }
  
  void display() {
    stroke(0);
    fill(200);
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(0);
    textSize(40);
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
  frameRate(30);
  
  menu = new Menu("Escape the Dungeon");
}

void draw() {
  menu.display();
}
