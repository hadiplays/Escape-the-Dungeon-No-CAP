import gifAnimation.*;

Menu menu;
ModeMenu modeMenu;

void setup() {
  // TODO: Switch to using fullscreen for final gameplay purposes
  size(800, 600);
  //fullScreen();
  background(0);
  frameRate(30);
  
  menu = new Menu(this, "Escape the Dungeon");
  modeMenu = new ModeMenu(this, "Select A Mode");
}

void draw() {
  //menu.display();
  modeMenu.display();
}
