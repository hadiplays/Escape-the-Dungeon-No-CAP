import java.util.ArrayList;

class Game {
    int difficulty; // Saves game difficulty to change variables respectively
    float[] speedChaser; // Saves different speeds for the chaser depending on the difficulty;
    float[] FOVSet; // Saves different FOV for user based on difficulty
    Map[] mapLevels; // Different maps for each level
    ArrayList<Chaser> chasers; // Different chasers saved in array
    User user; // The actual user
    MainMenu mainMenu = new MainMenu("Escape the Dungeon");; // Menu
    ModeMenu modeMenu = new ModeMenu("Select A Mode");;
    
    Game() {
      this.user = new User();
    }

    void drawMenuInterface() {
        // Implementation
        
        if (mainMenu.getIsStarted()) { //goes to the modeMenu
          modeMenu.display();
          //modeMenu.handleMouseClick();
          //modeDifficultyAssignment();
        }
        else { //stays in the mainMenu
          mainMenu.display();
          //mainMenu.handleMouseClick();
        }
    }

    void modeDifficultyAssignment() {
        // Implementation
        if (modeMenu.mode != 0) {
          startGame();
        }
    }
    
    void startGame() {
      // TODO: Start game logic (draw user, chasers, map)
      //user.draw();
    }

    void startQuit() {
        // Implementation
    }
}
