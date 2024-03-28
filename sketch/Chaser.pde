import java.util.ArrayList;

class Chaser {
    float speed; // How fast the chaser can move in all directions
    int difficulty; // Saves game difficulty to change chaser variables respectively
    float xPos; // X position
    float yPos; // Y position
    float[] userPos; // Two sized float array containing the current x and y position of the user

    // Constructor
    Chaser(float speed, int difficulty, float xPos, float yPos, float[] userPos) {
        this.speed = speed;
        this.difficulty = difficulty;
        this.xPos = xPos;
        this.yPos = yPos;
        this.userPos = userPos;
    }
}
