import java.util.ArrayList;



class Map {
    int flashlight; // Number of flashlights user has
    float[] flashlightPositions; // Position of each flashlight on the map; a float array containing pairs, each having an x and y position 
    int numKeys; // Number of keys user has
    boolean openDoor; // If numKeys = a certain number, this changes to true
    float[] keyPos; // Position of each key on the map; a float array containing pairs, each having an x and y position 
    int difficulty; // Map difficulty; used to alter other variables
    int mapDesign; // Design of the map depending on which level the user is at
    
    float[] userPosition = {width/2, height/2}; // temporary user position
    Chaser chaser = new Chaser(1, 1, 10, 10, userPosition);


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
        background(255);
        chaser.chaseUser(userPosition);
        chaser.drawChaser();
      }
    }
}
