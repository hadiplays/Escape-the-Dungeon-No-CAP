import java.util.ArrayList;

class Game {
    int difficulty; // Saves game difficulty to change variables respectively
    float[] speedChaser; // Saves different speeds for the chaser depending on the difficulty;
    float[] FOVSet; // Saves different FOV for user based on difficulty
    Map[] mapLevels; // Different maps for each level
    ArrayList<Chaser> chasers; // Different chasers saved in array
    User user; // The actual user
    MainMenu mainMenu; // Menu
    ModeMenu modeMenu;
    float[] userPosition;
    Chaser chaser;
    Map map;
    
    Game() {
      this.user = new User();
      this.mainMenu = new MainMenu("Escape the Dungeon");
      this.modeMenu = new ModeMenu("Select A Mode");
      this.userPosition = new float[]{user.xPos, user.yPos}; // Initialize userPosition after setup
      this.chaser = new Chaser(modeMenu.mode, 10, 10, userPosition); // Chaser(int difficulty, float xPos, float yPos, float[] userPos)
      this.map = new Map();
    }

    void drawMenuInterface() {
        // Implementation
        
        if(this.difficulty == 0){
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
        else{
          this.difficulty = modeMenu.mode;
          println("MODEEEE");
          println(modeMenu.mode);
          chaser.speedChange(modeMenu.mode);
          startGame();
        }
    }

    //void modeDifficultyAssignment() {
    //    // Implementation
    //    if (modeMenu.mode != 0) {
    //      this.difficulty = modeMenu.mode;
    //      println("MODEEEE");
    //      println(modeMenu.mode);
    //      chaser.speedChange(modeMenu.mode);
    //      startGame();
    //    }
    //    else{
    //      println("MODEEEE 2");
    //      println(modeMenu.mode);
    //      this.difficulty = modeMenu.mode; //setting the difficulty
    //    }
    //}
    
    void startGame() {
      // TODO: Start game logic (draw user, chasers, map)
        map.drawMap();
        user.drawUser();
        //userPosition = user.getPosition();
        userPosition = new float[]{user.xPos, user.yPos};
        chaser.chaseUser(userPosition);
        chaser.drawChaser();
        println("GAME LOOP STARTED");
    }

    void startQuit() {
        // Implementation
    }
}
