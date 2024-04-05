import java.util.ArrayList;
import processing.core.PApplet;
import processing.core.PImage;

class Chaser {
    float speed; // How fast the chaser can move in all directions
    int difficulty; // Saves game difficulty to change chaser variables respectively
    float xPos; // X position
    float yPos; // Y position
    float[] userPos; // Two sized float array containing the current x and y position of the user
    PApplet parent = Sketch.this; // Reference to the main PApplet instance
    PImage chaserImage; // Image for the chaser

    // Constructor
    Chaser(float speed, int difficulty, float xPos, float yPos, float[] userPos) {
        this.speed = speed;
        this.difficulty = difficulty;
        this.xPos = xPos;
        this.yPos = yPos;
        this.userPos = userPos;
        this.chaserImage = this.parent.loadImage("data/Images/ronny.png");
        this.chaserImage.resize(50, 50);
    }
    
    void speedChange(float s){
        this.speed = s;
    }
    
    void drawChaser(){
         parent.image(chaserImage, xPos, yPos);
    }
    
    
    void chaseUser(float[] userPos) {
        println(userPos[0]);
        println(userPos[1]);
        println(speed);
        
        // Calculate the distance between chaser and user in x and y axes
        float distX = userPos[0] - xPos;
        float distY = userPos[1] - yPos;
        
        // Calculate the angle between chaser and user
        float angle = atan2(distY, distX);
        
        println(angle);
        
        // Calculate the movement in x and y directions
        float moveX = speed * cos(angle);
        float moveY = speed * sin(angle);
        println(moveX);
        println(moveY);
        
        // Update chaser's position
        this.xPos += moveX;
        this.yPos += moveY;
        
        // Print the new position (you can remove this print statement if not needed)
        System.out.println("Chaser's new position: (" + xPos + ", " + yPos + ")");
    }

}
