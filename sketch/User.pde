import java.util.ArrayList;

class User {
    float[] translate; // [x][y] How much sprite has been translated from original center, helps determine map translation
    int [] pseudoPos;
    float xPos; // original X position
    float yPos; // original Y position
    float speed; // How fast pos is changed
    int difficulty; // Saves game difficulty to change user variables respectively
    int flashlight; // How many flashlights a user aquired; this changes the fieldOfView value as flashlight var increases
    int fieldOfView; // User FOV; changes depending on # of flashlight the user has gotten
    int numKeys; // Number of keys user has
    boolean openDoor; // If numKeys = a certain number, this changes to true
    PImage sprite;
    int userSize = 100;

    // Constructor
    User() {
      this.translate = new float[2];
      this.pseudoPos = new int[]{ width/2, height/2 };
      this.xPos = width/2;
      this.yPos = height/2;
      this.speed = 10;
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
      // && checkNoObstacle(RIGHT)
      if (keyCode == RIGHT) {
        // check won't collide
        translate[0] = -1 * speed;
        pseudoPos[0] += speed;
      }
      if (keyCode == LEFT) {
        // check won't collide
        translate[0] = speed;
        pseudoPos[0] -= speed;
      }
      if (keyCode == UP) {
        // check won't collide
        translate[1] = speed;
        pseudoPos[1] -= speed;
      }
      if (keyCode == DOWN) {
        // check won't collide
        translate[1] = -1 * speed;
        pseudoPos[1] += speed;
      }
      //println(xPos, yPos);
    }
    
    void keyReleased() {
      if (keyCode == RIGHT) {        
        translate[0] = 0;
      }
      if (keyCode == LEFT) {
        translate[0] = 0;
      }
      if (keyCode == UP) {
        translate[1] = 0;
      }
      if (keyCode == DOWN) {
        translate[1] = 0;
      }
    }
    
    //boolean checkNoObstacle(int direction) {
    //  // Calculate the hypothetical next position based on the direction
    //  int nextX = pseudoPos[0];
    //  int nextY = pseudoPos[1];
      
    //  if (direction == RIGHT) {
    //    nextX += speed;
    //  } else if (direction == LEFT) {
    //    nextX -= speed;
    //  } else if (direction == UP) {
    //    nextY -= speed;
    //  } else if (direction == DOWN) {
    //    nextY += speed;
    //  }
  
    //  // Check if the hypothetical position collides with any obstacles
    //  for (int i = 0; i < map.obstacles.length; i++) {
    //    if (checkCollision(nextX, nextY, userSize, userSize, map.obstacles[i][0], map.obstacles[i][1], 200, 250)) {
    //      return false; // Collision detected
    //    }
    //  }
    //  return true; // No collision detected
    //}
    
    //boolean checkCollision(int r1x, int r1y, int r1w, int r1h, int r2x, int r2y, int r2w, int r2h) {
    //  return (
    //    r1x + r1w >= r2x && r1x <= r2x + r2w && r1y + r1h >= r2y && r1y <= r2y + r2h
    //  );
    //}
}
