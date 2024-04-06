import java.util.ArrayList;

class User {
    float speed; // How fast pos is changed
    int difficulty; // Saves game difficulty to change user variables respectively
    float xPos; // X position
    float yPos; // Y position
    int flashlight; // How many flashlights a user aquired; this changes the fieldOfView value as flashlight var increases
    int fieldOfView; // User FOV; changes depending on # of flashlight the user has gotten
    int numKeys; // Number of keys user has
    boolean openDoor; // If numKeys = a certain number, this changes to true
    PImage sprite;
    //float[] position;

    // Constructor
    //User(float speed, int difficulty, float xPos, float yPos, int flashlight, int fieldOfView, boolean openDoor) {
    //    this.speed = speed;
    //    this.difficulty = difficulty;
    //    this.xPos = xPos;
    //    this.yPos = yPos;
    //    this.flashlight = flashlight;
    //    this.fieldOfView = fieldOfView;
    //    this.openDoor = openDoor;
        
    //    this.sprite = loadImage("data/Images/bongocat.png");
    //}
    
    User() {
      this.xPos = width/2;
      this.yPos = height/2;
      this.speed = 5;
      this.sprite = loadImage("data/Images/bongocat.png");
      //position = new float[]{xPos, yPos};
    }
    
    void drawUser() {
      background(0); // TODO: delete this line once draw map is done
      move();
      image(sprite, xPos, yPos, 50, 50);
    }
    
    void move() {
      // move according to key press and check for map bounds
      if (keyPressed) {
        if (keyCode == RIGHT) {
          if (xPos < width-50) {
            xPos += speed;
          }
        }
        else if (keyCode == LEFT) {
          if (xPos > 0) {
            xPos -= speed;
          }
        }
        else if (keyCode == UP) {
          if (yPos > 0) {
            yPos -= speed;
          }
        }
        else if (keyCode == DOWN) {
          if (yPos < height-50) {
            yPos += speed;
          }
        }
      }
    }
    
}
