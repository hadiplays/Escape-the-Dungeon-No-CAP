import gifAnimation.*;
import ddf.minim.*;

Minim minim;
AudioPlayer backgroundSound;
AudioPlayer gotSound;

//Menu menu;
//ModeMenu modeMenu;
Game game;

void setup() {
  // TODO: Switch to using fullscreen for final gameplay purposes
  size(800, 600);
  minim = new Minim(this);
  backgroundSound = minim.loadFile("data/Sounds/background.mp3");
  
  // Load new audio (to be played when the button is clicked)
 gotSound = minim.loadFile("data/Sounds/sword_slash.mp3");
  
  // Start playing background audio
  backgroundSound.play();
  
  //fullScreen();
  background(0);
  frameRate(30);  
  //menu = new Menu("Escape the Dungeon");
  //modeMenu = new ModeMenu(this, "Select A Mode");
  game = new Game();
}

void draw() {
  //menu.display();
  //menu.handleMouseClick();
  //modeMenu.display();
  game.drawMenuInterface();
}

void keyPressed() {
  game.keyPressed();
}
void stop() {
  gotSound.close();
  backgroundSound.close();
  minim.stop();
}
void keyReleased() {
  game.keyReleased();
}
