
class Van {

    PImage img;
    float x;          
    float y;          
    int w;          
    int h;           
    int f=1;   
    boolean visible = true;

   Van() {}

   Van(int x, int y, int x_, int y_, String file) {
    img = loadImage(file);
    this.x = x;
    this.y = y;
    this.w = img.width/x_;
    this.h = img.height/y_;
  }

  void pos(int x2, int y2) {
    this.x = x2;
    this.y = y2;
  }

  int getX() {
    return (int)x;
  }

  int getY() {
    return (int)y;
  }

  boolean colisionan(Van b) {
    int x4 = (int)b.x+b.w*b.f/2;
    int x3 = (int)x+w/2*f;
    int y3 = (int)y+h/2;
    return (b.visible && x3 >= x4-b.w/2 && x3 <= x4+b.w/2 && y3 >= b.y && y3 <= b.y+b.h);
  }

  boolean dentro(float x2, float y2) {
    int x3 = (int)x+w/2*f; 
    int y3= (int)y+h/2;
    return (x2 > x3-w/2 && x2< x3+w/2 && y2 > y3-h/2 && y2 < y3+h/2);
  }
}