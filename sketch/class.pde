//import java.util.ArrayList;

//class User {
//    float speed; // How fast the user can can move in all directions
//    int difficulty; // Saves game difficulty to change user variables respectively
//    float xPos; // X position
//    float yPos; // Y position
//    int flashlight; // How many flashlights a user aquired; this changes the fieldOfView value as flashlight var increases
//    int fieldOfView; // User FOV; changes depending on # of flashlight the user has gotten
//    int numKeys; // Number of keys user has
//    boolean openDoor; // If numKeys = a certain number, this changes to true

//    // Constructor
//    User(float speed, int difficulty, float xPos, float yPos, int flashlight, int fieldOfView, boolean openDoor) {
//        this.speed = speed;
//        this.difficulty = difficulty;
//        this.xPos = xPos;
//        this.yPos = yPos;
//        this.flashlight = flashlight;
//        this.fieldOfView = fieldOfView;
//        this.openDoor =openDoor;
//    }
//}

//class Chaser {
//    float speed; // How fast the chaser can move in all directions
//    int difficulty; // Saves game difficulty to change chaser variables respectively
//    float xPos; // X position
//    float yPos; // Y position
//    float[] userPos; // Two sized float array containing the current x and y position of the user

//    // Constructor
//    Chaser(float speed, int difficulty, float xPos, float yPos, float[] userPos) {
//        this.speed = speed;
//        this.difficulty = difficulty;
//        this.xPos = xPos;
//        this.yPos = yPos;
//        this.userPos = userPos;
//    }
//}

//class Map {
//    int flashlight; // Number of flashlights user has
//    float[] flashlightPositions; // Position of each flashlight on the map; a float array containing pairs, each having an x and y position 
//    int numKeys; // Number of keys user has
//    boolean openDoor; // If numKeys = a certain number, this changes to true
//    float[] keyPos; // Position of each key on the map; a float array containing pairs, each having an x and y position 
//    int difficulty; // Map difficulty; used to alter other variables
//    int mapDesign; // Design of the map depending on which level the user is at

//    // Constructor
//    Map(int flashlight, float[] flashlightPositions, int numKeys, boolean openDoor, float[] keyPos, int difficulty, int mapDesign) {
//        this.flashlight = flashlight;
//        this.flashlightPositions = flashlightPositions;
//        this.numKeys = numKeys;
//        this.openDoor = openDoor;
//        this.keyPos = keyPos;
//        this.difficulty = difficulty;
//        this.mapDesign = mapDesign;
//    }
//}

//class Game {
//    int difficulty; // Saves game difficulty to change variables respectively
//    float[] speedChaser; // Saves different speeds for the chaser depending on the difficulty;
//    float[] FOVSet; // Saves different FOV for user based on difficulty
//    Map[] mapLevels; // Different maps for each level
//    ArrayList<Chaser> chasers; // Different chasers saved in array
//    User user; // The actual user

//    void drawMenuInterface() {
//        // Implementation
//    }

//    void modeDifficultyAssignment() {
//        // Implementation
//    }

//    void startQuit() {
//        // Implementation
//    }
//}
