import java.util.ArrayList;
import processing.core.PApplet;
import processing.core.PImage;


class Map {
    int flashlight; // Number of flashlights user has
    float[] flashlightPositions; // Position of each flashlight on the map; a float array containing pairs, each having an x and y position 
    int numKeys; // Number of keys user has
    boolean openDoor; // If numKeys = a certain number, this changes to true
    float[][] keyPos; // Position of each key on the map; a float array containing pairs, each having an x and y position 
    int difficulty; // Map difficulty; used to alter other variables
    int mapDesign; // Design of the map depending on which level the user is at
    float[] userPos = {0, 0}; // Used to create map moving illusion
    
    // Use this map border to see how the game plays
    int coordinateOne = 500;
    int coordinateTwo = 1500;
    
    int[][] obstacles = new int[15][2];
    int keyWidth = 50; // Width of the key rectangle
    int keyHeight = 50; // Height of the key rectangle
    
    float[][] flashlightPos = new float[2][2]; // Position of each flashlight on the map; a float array containing pairs, each having an x and y position 
    int flashlightWidth = 50; // Width of the flashlight rectangle
    int flashlightHeight = 50; // Height of the flashlight rectangle
    
    // Add arrays to store randomized sizes of obstacles
    float[] obstacleWidths;
    float[] obstacleHeights;
    
    PImage keyImage;
    PImage flashlightImage;

    Map() {
        mapDesign = 1;
        initializeObstacles();
        numKeys = 0;

        // Initialize the array
        this.keyPos = new float[3][2];
        keyImage = loadImage("data/Images/key.png"); 
        flashlightImage = loadImage("data/Images/flashlight.png");

        initializeKeys();
        initializeFlashlights();
        obstacleWidths = new float[obstacles.length];
        obstacleHeights = new float[obstacles.length];
        initializeObstacleSizes();
    }
    
    // Method to initialize randomized sizes of obstacles
    void initializeObstacleSizes() {
        for (int i = 0; i < obstacles.length; i++) {
            obstacleWidths[i] = random(150, 300); // Randomize the width
            obstacleHeights[i] = random(200, 350); // Randomize the height
        }
    }

    boolean checkOverlap(float keyX, float keyY) {
      // Define key rectangle
      float keyLeft = keyX;
      float keyRight = keyX + keyWidth;
      float keyTop = keyY;
      float keyBottom = keyY + keyHeight;
      
      // Check against map borders
      if (keyLeft <= -coordinateOne || keyRight >= coordinateTwo || keyTop <= -coordinateOne || keyBottom >= coordinateTwo) {
          return true; // Overlap with map border
      }
      
      // Check each obstacle
      for (int i = 0; i < obstacles.length; i++) {
          // Define obstacle rectangle
          float obstacleLeft = obstacles[i][0];
          float obstacleRight = obstacles[i][0] + 100;
          float obstacleTop = obstacles[i][1];
          float obstacleBottom = obstacles[i][1] + 150;
          
          // Check for overlap
          if (keyRight >= obstacleLeft && keyLeft <= obstacleRight && keyBottom >= obstacleTop && keyTop <= obstacleBottom) {
              return true; // Overlap detected
          }
      }
      return false; // No overlap detected
  }
  
  boolean checkKeyOverlap(float x, float y) {
    for (int i = 0; i < keyPos.length; i++) {
        float keyLeft = keyPos[i][0];
        float keyRight = keyPos[i][0] + keyWidth;
        float keyTop = keyPos[i][1];
        float keyBottom = keyPos[i][1] + keyHeight;

        // Check if the given position overlaps with any key
        if (x + 25 >= keyLeft && x <= keyRight && y + 25 >= keyTop && y <= keyBottom) {
            return true; // Overlap detected
        }
    }
    return false; // No overlap detected
  }

  void initializeObstacles() {
      for (int i = 0; i < obstacles.length; i++) {
          int randomX, randomY;
          boolean overlap;
          do {
              overlap = false;
              randomX = (int) random(-coordinateOne + 100, coordinateTwo - 150); // Adjusted range for X position
              randomY = (int) random(-coordinateOne + 100, coordinateTwo - 150); // Adjusted range for Y position
  
              // Check for overlap with existing obstacles
              for (int j = 0; j < i; j++) {
                  if (Math.abs(randomX - obstacles[j][0]) < 300 && Math.abs(randomY - obstacles[j][1]) < 300) {
                      overlap = true;
                      break;
                  }
              }
          } while (overlap); // Repeat until a non-overlapping position is found
  
          obstacles[i][0] = randomX;
          obstacles[i][1] = randomY;
      }
  }


  
  void initializeKeys() {
      for (int i = 0; i < this.keyPos.length; i++) {
          do {
              float keyX = random(-coordinateOne + 100, coordinateTwo - 100); // Adjusted to fit within map borders
              float keyY = random(-coordinateOne + 100, coordinateTwo - 100); // Adjusted to fit within map borders
              // Adjust key position to ensure it doesn't overlap with obstacles
              if (!checkOverlap(keyX, keyY) && (keyX < 350 || keyX > 650) && (keyY < 350 || keyY > 650)) {
                  this.keyPos[i][0] = keyX;
                  this.keyPos[i][1] = keyY;
              }
          } while (this.keyPos[i][0] == 0 && this.keyPos[i][1] == 0); // Ensure key position is set
      }
  }
  
  void initializeFlashlights() {
    

    // Initialize flashlights
    for (int i = 0; i < 2; i++) {
        do {
            float flashlightX = random(-coordinateOne + 100, coordinateTwo - 100);
            float flashlightY = random(-coordinateOne + 100, coordinateTwo - 100);
            if (!checkOverlap(flashlightX, flashlightY) && (flashlightX < 350 || flashlightY > 650) && (flashlightX < 350 || flashlightY > 650) && !checkKeyOverlap(flashlightX, flashlightY)) {
                // Check for overlap with obstacles and keys
                    this.flashlightPos[i][0] = flashlightX;
                    this.flashlightPos[i][1] = flashlightY;
            }
        } while (this.flashlightPos[i][0] == 0 && this.flashlightPos[i][1] == 0); // Ensure flashlight position is set
    }
  }



    // Constructor..........NOT BEING USED CURRENTLY; SHOULD BE USED THOUGH
    //Map(int flashlight, float[] flashlightPositions, int numKeys, boolean openDoor, float[][] keyPos, int difficulty, int mapDesign) {
    //    this.flashlight = flashlight;
    //    this.flashlightPositions = flashlightPositions;
    //    this.numKeys = numKeys;
    //    this.openDoor = openDoor;
    //    this.keyPos = keyPos;
    //    this.difficulty = difficulty;
    //    this.mapDesign = mapDesign;
        
    //    for (int i = 0; i < obstacles.length; i++) {
    //      obstacles[i][0] = int(random(-50, 1000));
    //      obstacles[i][1] = int(random(-50, 1000));
    //    }
    //}
    
    void drawMap(){
      
      if(mapDesign == 1){
        push();
        background(0);
        fill(255);
        rectMode(CORNER);
        noStroke();
        rect(-coordinateOne + userPos[1],-coordinateOne + userPos[0],2000,100);
        rect(-coordinateOne + userPos[1],-coordinateOne + userPos[0],100,2000);
        rect(coordinateTwo + userPos[1],-coordinateOne + userPos[0],100,2100);
        rect(-coordinateOne + userPos[1],coordinateTwo + userPos[0],2000,100);
        
        for (int i = 0; i < obstacles.length; i++) {
            rect(obstacles[i][0] + userPos[1], obstacles[i][1] + userPos[0], obstacleWidths[i], obstacleHeights[i]);
        }
        
        fill(255,255,0);
        for (int i = 0; i < keyPos.length; i++) {
            image(keyImage, keyPos[i][0] + userPos[1], keyPos[i][1] + userPos[0], keyWidth, keyHeight);
        }
        
        // Change the fill color to red for flashlights
        fill(255, 0, 0); // Red color
        //for (int i = 0; i < flashlightPos.length; i++) {
        //    image(flashlightImage, flashlightPos[i][0] + userPos[1], flashlightPos[i][1] + userPos[0], flashlightWidth, flashlightHeight);
        //}
        
        removeFlashlight();
        removeKey();
        
        
        
        pop();
      }
    }
    
    void moveMap(float[] userPos) {
      this.userPos[0] += userPos[0];
      this.userPos[1] += userPos[1];
    }
    
    int[][] getObstacles(){return this.obstacles;}
    
    
    void removeFlashlight(){
      
      ArrayList<float[]> tempPos = new ArrayList<float[]>();
      
      for (int i = 0; i < flashlightPos.length; i++) {
            // Update flashlight position
            float flashlightX = flashlightPos[i][0] + userPos[1];
            float flashlightY = flashlightPos[i][1] + userPos[0];
      
            // Check if flashlight is in the middle of the screen
            float centerX = width / 2;
            float centerY = height / 2;
            float distanceToCenter = dist(centerX, centerY, flashlightX, flashlightY);
            if (distanceToCenter > 50) { // If distance to center is greater than the flashlight size
              // Draw flashlight
              tempPos.add(new float[]{flashlightPos[i][0], flashlightPos[i][1]});
              image(flashlightImage, flashlightX, flashlightY, flashlightWidth, flashlightHeight);
            }
       }
       flashlightPos = tempPos.toArray(new float[tempPos.size()][2]);
    }
    
    void removeKey() {
      // Create a temporary ArrayList to store key positions that were not collected
      ArrayList<float[]> tempPos = new ArrayList<float[]>();
    
      for (int i = 0; i < keyPos.length; i++) {
        // Update key position
        float keyX = keyPos[i][0] + userPos[1];
        float keyY = keyPos[i][1] + userPos[0];
    
        // Check if key is in the middle of the screen
        float centerX = width / 2;
        float centerY = height / 2;
        float distanceToCenter = dist(centerX, centerY, keyX, keyY);
    
        if (distanceToCenter > 50) { // If distance to center is greater than the key size
          // Add the key position to tempPos
          tempPos.add(new float[]{keyPos[i][0], keyPos[i][1]});
          // Draw the key
          image(keyImage, keyX, keyY, keyWidth, keyHeight);
        }
        else{
          numKeys += 1;
          print("KEY NUMBEEERRR: ");
          println(numKeys);
        }
      }
    
      // Convert ArrayList to array and assign it to keyPos
      keyPos = tempPos.toArray(new float[tempPos.size()][2]);
    }
    
    //boolean collectFlashlight(float[] move) {
      
    //     println("HFUIEHFIOEHIOFHJFOIEHFIOF");
    //    // Check if the given position overlaps with any flashlight
    //    for (int i = 0; i < flashlightPos.length; i++) {
    //        float flashlightX = flashlightPos[i][0];
    //        float flashlightY = flashlightPos[i][1];
    //        print("FLASHING Light X;  ");
    //        println(flashlightX);
            
    //        print("FLASHING Light Y;  ");
    //        println(flashlightY);
            
    //        print("X;  ");
    //        println(move[1]);
            
    //        print("Y;  ");
    //        println(move[0]);  
            
            
    //        //float distance = dist(move[1], move[0], flashlightX, flashlightY);
    //        float distance = sqrt(pow((flashlightX - move[0]), 2) + pow((flashlightY - move[1]), 2));
    //        //println(distance);
            
    //        println("Distance");
    //        println(distance);
    //        if (distance <= 50) { // flashlight width and height are both 50
    //            // Flashlight found, remove it from the map
    //            println("REMOVEDDDDDD");
    //            flashlightPos[i][0] = 0;
    //            flashlightPos[i][1] = 0;
    //            return true; // Flashlight collected successfully
    //        }
    //    }
    //    return false; // No flashlight found at the given position
    //}
}
