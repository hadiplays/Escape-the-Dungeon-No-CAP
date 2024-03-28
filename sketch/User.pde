import java.util.ArrayList;

class User {
    float speed; // How fast the user can can move in all directions
    int difficulty; // Saves game difficulty to change user variables respectively
    float xPos; // X position
    float yPos; // Y position
    int flashlight; // How many flashlights a user aquired; this changes the fieldOfView value as flashlight var increases
    int fieldOfView; // User FOV; changes depending on # of flashlight the user has gotten
    int numKeys; // Number of keys user has
    boolean openDoor; // If numKeys = a certain number, this changes to true

    // Constructor
    User(float speed, int difficulty, float xPos, float yPos, int flashlight, int fieldOfView, boolean openDoor) {
        this.speed = speed;
        this.difficulty = difficulty;
        this.xPos = xPos;
        this.yPos = yPos;
        this.flashlight = flashlight;
        this.fieldOfView = fieldOfView;
        this.openDoor =openDoor;
    }
}
