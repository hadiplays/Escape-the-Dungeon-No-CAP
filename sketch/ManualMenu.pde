import gifAnimation.*;

class ManualMenu {
  
  String title; // Menu title
  Button mainMenuButton;
  PFont font;
  Gif bloodAnimation; // Using gifAnimation library
  PApplet parent = Sketch.this; // Reference to the main PApplet instance
    
  ManualMenu(String title) {
    this.title = title; // Save title name to variable
    mainMenuButton = new Button("Main Menu", width/2, 10*height/12, 100, 50);
    
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
    
    textSize(25);
    fill(255);
    text("You are a student from the CAP3032 course and have gotten stuck in the basement of the ", width/2, 6*height/16);
    text("Computer Science building (the Dungeon). You're under the surveillance of the scary Dr. Ronnie.", width/2, 7*height/16);
    text("If she finds students roaming around, there will be dire consequences!", width/2, 8*height/16);
    text("Use your keyboard's arrow keys to find the three keys to escape the Dungeon,", width/2, 9*height/16);
    text("by processing creatures and Dr. Ronnie's underlings (the TA's).", width/2, 10*height/16);
    
    mainMenuButton.display(30);
  }
  
  boolean handleMouseClick() { // the restart variable in Game will recieve this result
    if (mainMenuButton.isClicked()) {
      println("Going to main menu selection screen...");
      return true;
    } 
    else return false;
  }
  
}
