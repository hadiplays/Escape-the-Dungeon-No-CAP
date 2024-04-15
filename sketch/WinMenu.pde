import gifAnimation.*;

class WinMenu {
  
  String title; // Menu title
  Button mainMenuButton;
  PFont font;
  Gif bloodAnimation; // Using gifAnimation library
  PApplet parent = Sketch.this; // Reference to the main PApplet instance
    
  WinMenu(String title) {
    this.title = title; // Save title name to variable
    mainMenuButton = new Button("Main Menu", width/2, height/2, 200, 100);
    
    this.font = createFont("youmurdererbb.otf", 128);
    textFont(this.font);
    
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
    mainMenuButton.display(60);
  }
  
  boolean handleMouseClick() { // the restart variable in Game will recieve this result
    if (mainMenuButton.isClicked()) {
      println("Going to main menu selection screen...");
      return true;
    } 
    else return false;
  }
  
}
