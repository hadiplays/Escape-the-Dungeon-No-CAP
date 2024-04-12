import java.util.ArrayList;



class Map {
    int flashlight; // Number of flashlights user has
    float[] flashlightPositions; // Position of each flashlight on the map; a float array containing pairs, each having an x and y position 
    int numKeys; // Number of keys user has
    boolean openDoor; // If numKeys = a certain number, this changes to true
    float[][] keyPos; // Position of each key on the map; a float array containing pairs, each having an x and y position 
    int difficulty; // Map difficulty; used to alter other variables
    int mapDesign; // Design of the map depending on which level the user is at
    float[] userPos = {0, 0}; // Used to create map moving allusion
    float[][] mapBorders = {
        {-100, -200},
        {-100, 800},
        {-100, -200},
        {800, -200}
    };
    int[][] obstacles = new int[10][2];
    int keyWidth = 50; // Width of the key rectangle
    int keyHeight = 50; // Height of the key rectangle

    Map() {
        mapDesign = 1;
        for (int i = 0; i < obstacles.length; i++) {
            obstacles[i][0] = int(random(-50, 800));
            obstacles[i][1] = int(random(-50, 800));
        }

        // Initialize the array
        this.keyPos = new float[3][2];

        // Fill in the rest of the elements with non-overlapping random values
        for (int i = 0; i < this.keyPos.length; i++) {
            do {
                float keyX = random(-50, 750);
                float keyY = random(-50, 750);
                // Adjust key position to ensure it doesn't overlap with obstacles
                if (!checkOverlap(keyX, keyY)) {
                    this.keyPos[i][0] = keyX;
                    this.keyPos[i][1] = keyY;
                }
            } while (this.keyPos[i][0] == 0 && this.keyPos[i][1] == 0); // Ensure key position is set
        }
    }

    // Check for overlap with obstacles
    boolean checkOverlap(float keyX, float keyY) {
        // Define key rectangle
        float keyLeft = keyX;
        float keyRight = keyX + keyWidth;
        float keyTop = keyY;
        float keyBottom = keyY + keyHeight;
        
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
    // Constructor
    Map(int flashlight, float[] flashlightPositions, int numKeys, boolean openDoor, float[][] keyPos, int difficulty, int mapDesign) {
        this.flashlight = flashlight;
        this.flashlightPositions = flashlightPositions;
        this.numKeys = numKeys;
        this.openDoor = openDoor;
        this.keyPos = keyPos;
        this.difficulty = difficulty;
        this.mapDesign = mapDesign;
        
        for (int i = 0; i < obstacles.length; i++) {
          obstacles[i][0] = int(random(-50, 1000));
          obstacles[i][1] = int(random(-50, 1000));
        }
    }
    
    void drawMap(){
      
      if(mapDesign == 1){
        push();
        background(0);
        fill(255);
        rectMode(CORNER);
        noStroke();
        rect(-100 + userPos[1],-200 + userPos[0],1000,100);
        rect(-100 + userPos[1],800 + userPos[0],1000,100);
        rect(-100 + userPos[1],-200 + userPos[0],100,1000);
        rect(800 + userPos[1],-200 + userPos[0],100,1000);
        
        for (int i = 0; i < obstacles.length; i++) {
          rect(obstacles[i][0] + userPos[1], obstacles[i][1] + userPos[0], 100, 150);
        }
        
        fill(255,255,0);
        for (int i = 0; i < keyPos.length; i++) {
          rect(keyPos[i][0] + userPos[1], keyPos[i][1] + userPos[0], 50, 50);
        }

        pop();
      }
    }
    
    void moveMap(float[] userPos) {
      this.userPos[0] += userPos[0];
      this.userPos[1] += userPos[1];
    }
    
    int[][] getObstacles(){return this.obstacles;}
}
