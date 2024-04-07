import java.util.ArrayList;



class Map {
    int flashlight; // Number of flashlights user has
    float[] flashlightPositions; // Position of each flashlight on the map; a float array containing pairs, each having an x and y position 
    int numKeys; // Number of keys user has
    boolean openDoor; // If numKeys = a certain number, this changes to true
    float[] keyPos; // Position of each key on the map; a float array containing pairs, each having an x and y position 
    int difficulty; // Map difficulty; used to alter other variables
    int mapDesign; // Design of the map depending on which level the user is at
    float[] userPos = {0, 0}; // Used to create map moving allusion
    


    Map(){
      mapDesign = 1;
    }
    // Constructor
    Map(int flashlight, float[] flashlightPositions, int numKeys, boolean openDoor, float[] keyPos, int difficulty, int mapDesign) {
        this.flashlight = flashlight;
        this.flashlightPositions = flashlightPositions;
        this.numKeys = numKeys;
        this.openDoor = openDoor;
        this.keyPos = keyPos;
        this.difficulty = difficulty;
        this.mapDesign = mapDesign;
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
        pop();
      }
    }
    
    void getUserPos(float[] userPos) {
      this.userPos[0] += userPos[0];
      this.userPos[1] += userPos[1];
    }
}
