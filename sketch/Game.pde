import java.util.ArrayList;

class Game {
    int difficulty; // Saves game difficulty to change variables respectively
    float[] speedChaser; // Saves different speeds for the chaser depending on the difficulty;
    float[] FOVSet; // Saves different FOV for user based on difficulty
    Map[] mapLevels; // Different maps for each level
    Map map; // Map instance
    ArrayList<Chaser> chasers; // Different chasers saved in array
    User user; // User instance
    MainMenu mainMenu; // Main Menu
    ModeMenu modeMenu; // Mode Menu
    float[] userPosition; // Two sized array with the x and y t
    Chaser chaser; // Chaser instance
    GameOverMenu gameOverMenu; // Game Over Menu
    boolean restart; // Variable to restart game
    
    // Game constructor
    Game() {
      this.user = new User();
      this.map = new Map(user);
      //this.user = new User(map);
      this.mainMenu = new MainMenu("Escape the Dungeon");
      this.modeMenu = new ModeMenu("Select A Mode");
      // Initialize userPosition after setup
      // xPos = width/2 and yPos = height/2 at the start
      this.userPosition = new float[]{user.xPos, user.yPos};
      this.chaser = new Chaser(modeMenu.mode, 10, 10, userPosition, map); // Chaser(int difficulty, float xPos, float yPos, float[] userPos)
      this.gameOverMenu = new GameOverMenu("Game Over!");
      this.restart = false;
      this.difficulty = 0;
    }

    void drawMenuInterface() {
        // Implementation
        
        if (restart) { // Sets default values to all variables
          this.user = new User();
          this.mainMenu = new MainMenu("Escape the Dungeon");
          this.modeMenu = new ModeMenu("Select A Mode");
          // Initialize userPosition after setup
          // xPos = width/2 and yPos = height/2 at the start
          this.userPosition = new float[]{user.xPos, user.yPos};
          this.chaser = new Chaser(modeMenu.mode, 10, 10, userPosition, map); // Chaser(int difficulty, float xPos, float yPos, float[] userPos)
          this.map = new Map(user);
          this.gameOverMenu = new GameOverMenu("Game Over!");
          this.restart = false;
          this.difficulty = 0;
        }
        
        /* In Java, instance variables (fields) of a class are initialized with default 
        ** values if no explicit initialization is provided. For numeric types like int, 
        ** the default initial value is 0.
        ** So, in the Game class, difficulty would have an initial value of 0 because 
        ** it's an int field and it hasn't been explicitly initialized in the constructor.
        */
        
        if(this.difficulty == 0){ // 0 means no mode has been selected
          if (mainMenu.getIsStarted()) { //goes to the modeMenu
            modeMenu.display();
            this.difficulty = modeMenu.handleMouseClick();
            //modeDifficultyAssignment();
          }
          else { //stays in the mainMenu
            mainMenu.display();
            mainMenu.handleMouseClick();
          }
        }
        else if (this.difficulty == -1) {
          gameOverMenu.display();
          restart = gameOverMenu.handleMouseClick();

        }
        else{
          this.difficulty = modeMenu.mode;
          //println("Mode: ", modeMenu.mode);
          chaser.speedChange(modeMenu.mode);
          startGame();
        }
    }

    void startGame() {
      // TODO: Start game logic (draw user, chasers, map)
        map.drawMap();
        user.drawUser();
        
        // Need to update this user position
        userPosition = user.translate;
        chaser.chaseUserNEW(userPosition); 
        
        chaser.drawChaser();
        map.updateMapPositions(userPosition);
        checkGameOver();
    }

    void startQuit() {
        // Implementation
    }
    
    void checkGameOver() {
      float[] userPosArr = user.getPosition();
      float[] chaserPosArr = chaser.getPosition();
      
      float distance = sqrt(pow((chaserPosArr[0] - userPosArr[0]), 2) + pow((chaserPosArr[1] - userPosArr[1]), 2));
      //println(distance);
      if (distance <= 100) difficulty = -1; //gameOver
    }
    
    
    int getDifficulty () {return this.difficulty;}
    
    void keyPressed() {
        user.keyPressed();
    }

    void keyReleased() {
        user.keyReleased();
    }
}
