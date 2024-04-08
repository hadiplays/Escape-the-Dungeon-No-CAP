class Button {
  
  String label; // Button text
  float x, y; // Button location (This is the middle of the button)
  float w; // Width
  float h; // Height
  
  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void display(int size) {
    stroke(0);
    fill(200);
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(0);
    textSize(size);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }
  
  boolean isClicked() {
    return mouseX > x - w/2 && mouseX < x + w/2 &&
           mouseY > y - h/2 && mouseY < y + h/2 &&
           mousePressed;
  }
}
