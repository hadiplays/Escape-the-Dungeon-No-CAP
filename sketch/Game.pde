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

    void drawMenuInterface() {
        // Implementation
        mainMenu.handleMouseClick();
        
        if (mainMenu.getMode()) {
          modeMenu.display();
        }
        else {
          mainMenu.display();
        }
    }

    void modeDifficultyAssignment() {
        // Implementation
    }

    void startQuit() {
        // Implementation
    }
}
