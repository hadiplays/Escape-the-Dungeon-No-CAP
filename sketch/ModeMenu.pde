import gifAnimation.*;

class ModeMenu {
  
  String title;
  Button easyButton;
  Button mediumButton;
  Button hardButton;
  int mode; // 1 = easy, 2 = medium, 3 = hard
  PFont font;
  //PImage bloodImg;
  Gif bloodAnimation; // Using gifAnimation library
  PApplet parent = Sketch.this; // Reference to the main PApplet instance
  boolean gameStart = false;
  Map map = new Map();
  
  ModeMenu(String title) {
    this.title = title;
    this.mode = 0;
    
    // Initialize buttons
    easyButton = new Button("Easy", width/4, height/2 + 50, 180, 100);
    mediumButton = new Button("Medium", width/2, height/2 + 50, 180, 100);
    hardButton = new Button("Hard", 3 * width/4, height/2 + 50, 180, 100);
    
    //Save font
    this.font = createFont("youmurdererbb.otf", 128);
    textFont(this.font);
    
    //bloodImg = loadImage("data/Images/blood_dripping.gif");
    
    bloodAnimation = new Gif(this.parent, "data/Images/blood_dripping.gif"); // Initialize .gif file
    bloodAnimation.play(); // Play .gif file
  }
  
  void display() {
    if(!gameStart){
        handleMouseClick();
        background(0);
        
        // TODO: get blood dripping gif to be animated..........DONE
        imageMode(CORNER);
        image(bloodAnimation, 0, 0, width, height);
        
        textAlign(CENTER, CENTER);
        textSize(100);
        fill(180, 25, 25);
        text(title, width/2, height/4);
        
        easyButton.display(60);
        mediumButton.display(60);
        hardButton.display(60);
    }else{
        map.drawMap();
    }
  }
  
  void handleMouseClick() {
    if (easyButton.isClicked()) {
      // Change mode to easy
      println("Easy Mode");
      mode = 1;
      gameStart = true;
    } else if (mediumButton.isClicked()) {
      // Change mode to medium
      println("Medium Mode");
      mode = 2;
    } else if (hardButton.isClicked()) {
      // Change mode to hard
      println("Hard Mode");
      mode = 3;
    }
  }
}
