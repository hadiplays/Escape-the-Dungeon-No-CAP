import gifAnimation.*;

//Menu menu;
//ModeMenu modeMenu;
Game game;

void setup() {
  // TODO: Switch to using fullscreen for final gameplay purposes
  size(800, 600);
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
