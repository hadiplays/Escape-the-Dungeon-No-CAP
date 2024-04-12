import java.util.ArrayList;

class User {
    float[] position; // How much sprite has been translated from original center, helps determine map translation
    float speed; // How fast pos is changed
    int difficulty; // Saves game difficulty to change user variables respectively
    float xPos; // X position
    float yPos; // Y position
    int flashlight; // How many flashlights a user aquired; this changes the fieldOfView value as flashlight var increases
    int fieldOfView; // User FOV; changes depending on # of flashlight the user has gotten
    int numKeys; // Number of keys user has
    boolean openDoor; // If numKeys = a certain number, this changes to true
    PImage sprite;
    int userSize = 100; //50

    // Constructor
    User() {
      this.position = new float[2];
      this.xPos = width/2;
      this.yPos = height/2;
      this.speed = 5;
      this.sprite = loadImage("data/Images/bongocat.png");
    }
    
    void drawUser() {
      image(sprite, xPos, yPos, userSize, userSize);
    }
    
    float[] getPosition() {
      float[] position = new float[2]; // Initialize a float array of size 2
      position[0] = xPos; // Assign xPos to the first element
      position[1] = yPos; // Assign yPos to the second element
      return position; // Return the initialized array
    }
    
    
    // TODO: Can remove this move() function because keyboard input takes care of adjusting user's "position"
    // Since user doesn't move, actual movement takes place in Map() where map objects are translated by user's position
///********************************TESTING STUFF*****************************************/
//    // This function basically sends the amount of spaces you want every other
//    // object around the user to move.
//    // This makes the allusion of the user moving throughout the map
//    float[] move() { //first number up/down, second number right/left
//      return position;
//    }
    
    void keyPressed() {
      if (keyCode == RIGHT) {
        position[1] = -1 * speed;
      }
      if (keyCode == LEFT) {
        position[1] = speed;
      }
      if (keyCode == UP) {
        position[0] = speed;
      }
      if (keyCode == DOWN) {
        position[0] = -1 * speed;
      }
    }
    
    void keyReleased() {
      if (keyCode == RIGHT) {
        position[1] = 0;
      }
      if (keyCode == LEFT) {
        position[1] = 0;
      }
      if (keyCode == UP) {
        position[0] = 0;
      }
      if (keyCode == DOWN) {
        position[0] = 0;
      }
    }
    
    //boolean checkForObstacle(int direction) {
    //  if (keyCode == RIGHT) {
          
    //  }
    //  if (keyCode == LEFT) {
        
    //  }
    //  if (keyCode == UP) {
        
    //  }
    //  if (keyCode == DOWN) {
        
    //  }
    //  return false;
    //}
}
