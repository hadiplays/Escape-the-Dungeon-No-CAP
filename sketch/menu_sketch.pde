import gifAnimation.*;

class Menu {
  
  String title; // Menu title
  Button startButton;
  Button quitButton;
  Button modeButton;
  PFont font;
  //PImage bloodImg;
  Gif bloodAnimation; // Using gifAnimation library
  PApplet parent = Sketch.this; // Reference to the main PApplet instance
  
  boolean mode = false;
  
  Menu(String title) {
    this.title = title; // Save title name to variable
    startButton = new Button("Start", width/2, height/2, 100, 50);
    quitButton = new Button("Quit", width/2, height/2 + 60, 100, 50);
    modeButton = new Button("Mode", width/2, height/2 + 120, 100, 50);
    
    this.font = createFont("youmurdererbb.otf", 128);
    textFont(this.font);
    
    //bloodImg = loadImage("data/Images/blood_dripping.gif");
    
    bloodAnimation = new Gif(this.parent, "data/Images/blood_dripping.gif"); // Initialize .gif file
    bloodAnimation.play(); // Play .gif file
  }
  
  void display() {
    background(0);
    
    // TODO: get blood dripping gif to be animated..........DONE
    imageMode(CORNER);
    image(bloodAnimation, 0, 0, width, height);
    
    textAlign(CENTER, CENTER);
    textSize(100);
    fill(180, 25, 25);
    text(title, width/2, height/4);
    text("(No CAP)", width/2, 1.5*height/4);
    startButton.display(40);
    quitButton.display(40);
    modeButton.display(40);
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
      mode = true;
      // Mode button clicked, go to mode selection screen
      // TODO: Add mode selection screen
      println("Going to mode selection screen...");
    }
  }
  
  boolean getMode() {
    return mode;
  }
}

class Button {
  
  String label; // Button text
  float x, y; // Button location (This is the middle of the button)
  float w; // Width
  float h; // Height
  
  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display(int size) {
    stroke(0);
    fill(200);
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(0);
    textSize(size);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }
  
  boolean isClicked() {
    return mouseX > x - w/2 && mouseX < x + w/2 &&
           mouseY > y - h/2 && mouseY < y + h/2 &&
           mousePressed;
  }
}
