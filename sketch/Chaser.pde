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
    Chaser(int difficulty, float xPos, float yPos, float[] userPos) {
        this.speed = 1;
        this.difficulty = difficulty;
        this.xPos = xPos;
        this.yPos = yPos;
        this.userPos = userPos;
        this.chaserImage = this.parent.loadImage("data/Images/ronny.png");
        this.chaserImage.resize(50, 50);
    }
    
    void speedChange(int level){
        this.difficulty = level;
        if(level == 1){ // easy mode
          this.speed = 1;
        }
        else if(level == 2){ // medium mode
          this.speed = 2;
        }
        else if(level == 3){ // hard
          this.speed = 3;
        }
        else{
          this.speed = 0.5;
        }
    }
    
    void drawChaser(){
         parent.image(chaserImage, xPos, yPos);
    }
    
    
    void chaseUser(float[] userPos) {
        //println("User Position");
        //println(userPos[0]);
        //println(userPos[1]);
        //println(speed);
        speedChange(this.difficulty);
        
        // Calculate the distance between chaser and user in x and y axes
        float distX = userPos[0] - xPos;
        float distY = userPos[1] - yPos;
        
        // Calculate the angle between chaser and user
        float angle = atan2(distY, distX);
        
        //println(angle);
        
        // Calculate the movement in x and y directions
        float moveX = this.speed * cos(angle);
        float moveY = this.speed * sin(angle);
        println("SPEEEDDDDD");
        println(difficulty);
        println(speed);
        //println(moveY);
        
        // Update chaser's position
        this.xPos += moveX;
        this.yPos += moveY;
        
        // Print the new position (you can remove this print statement if not needed)
        //System.out.println("Chaser's new position: (" + xPos + ", " + yPos + ")");
    }

    float[] getPosition() {
      float[] position = new float[2]; // Initialize a float array of size 2
      position[0] = xPos; // Assign xPos to the first element
      position[1] = yPos; // Assign yPos to the second element
      return position; // Return the initialized array
    }
    
/********************************TESTING SMTHN***************************************/
    
    // This function is similar to the chaseUser() function except
    // it moves the chaser's position based on the user.
    void chaseUserNEW(float[] move) {
        //println("User Position");
        //println(userPos[0]);
        //println(userPos[1]);
        //println(speed);
        speedChange(this.difficulty);
        
        // Calculate the distance between chaser and user in x and y axes
        float distX = width/2 - xPos;
        float distY = height/2 - yPos;
        
        // Calculate the angle between chaser and user
        float angle = atan2(distY, distX);
        
        //println(angle);
        
        // Calculate the movement in x and y directions
        float moveX = this.speed * cos(angle);
        float moveY = this.speed * sin(angle);
        println("SPEEEDDDDD");
        println(difficulty);
        println(speed);
        //println(moveY);
        
        // Update chaser's position
        this.xPos += moveX + move[1];
        this.yPos += moveY + move[0];
        
        // Print the new position (you can remove this print statement if not needed)
        //System.out.println("Chaser's new position: (" + xPos + ", " + yPos + ")");
    }
}
