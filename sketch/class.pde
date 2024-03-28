import java.util.ArrayList;

class User {
    float speed;
    int difficulty;
    float xPos;
    float yPos;
    int flashlight;
    int fieldOfView;
    boolean key;

    // Constructor
    User(float speed, int difficulty, float xPos, float yPos, int flashlight, int fieldOfView, boolean key) {
        this.speed = speed;
        this.difficulty = difficulty;
        this.xPos = xPos;
        this.yPos = yPos;
        this.flashlight = flashlight;
        this.fieldOfView = fieldOfView;
        this.key = key;
    }
}

class Chaser {
    float speed;
    int difficulty;
    float xPos;
    float yPos;
    float[] userPos;

    // Constructor
    Chaser(float speed, int difficulty, float xPos, float yPos, float[] userPos) {
        this.speed = speed;
        this.difficulty = difficulty;
        this.xPos = xPos;
        this.yPos = yPos;
        this.userPos = userPos;
    }
}

class Map {
    int flashlight;
    float[] flashlightPos;
    boolean key;
    float[] keyPos; 
    int difficulty;
    int mapDesign;

    // Constructor
    Map(int flashlight, float[] flashlightPos, boolean key, float[] keyPos, int difficulty, int mapDesign) {
        this.flashlight = flashlight;
        this.flashlightPos = flashlightPos;
        this.key = key;
        this.keyPos = keyPos;
        this.difficulty = difficulty;
        this.mapDesign = mapDesign;
    }
}


class Game {
    int gameMode;
    float[] speedSet;
    float[] FOVSet; 
    Map[] mapLevels; 
    ArrayList<Chaser> chasers;
    User user; 

    void drawMenuInterface() {
        // Implementation
    }

    void modeDifficultyAssignment() {
        // Implementation
    }

    void startQuit() {
        // Implementation
    }
}
