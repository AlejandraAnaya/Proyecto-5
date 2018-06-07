
import gifAnimation.*;
import controlP5.*; 



ControlP5 p5;
Gif fondo;

static final int r = 0;
static final int golpe = 1;
static final int inicio = 2;
static final int ganador = 3;
static final int perder = 4;
//static final int reinicio = 5;
static final int esp = 5;
static final float gr = 9.8; 

float x;            
float y;
float v=20;      
float angulo=15;     
float t=0;           
float v2= 3.5;   
float contador = 5; 
int intentos = 5;  
int estado = inicio; 
int hp1= 1000;
int pant, span;
PImage van1,van2, andy1, lata, oreja, teclado,fondo1, fondo2,derrotar, escape;
PFont letra1, letra2; 

Van van; 



void setup() {

  size(1200, 580);

  letra1 = createFont("Rockwell", 50);
  letra2 = createFont("Helvetica 35 Thin", 20);


  p5 = new ControlP5(this);

  lata =loadImage ("lata2.png");
  van1 = loadImage("v1.png");
  van2= loadImage("v3.png");
  andy1 = loadImage("a2.png");
  teclado = loadImage("4.png");
  fondo1 = loadImage("2.jpg");
  fondo2 = loadImage("pix.jpg");
  derrotar = loadImage("derr.png");
  escape = loadImage("esc.png");
  
  fondo = new Gif(this, "22.gif");
  fondo.play();

  van = new Van((int)(width-178-random(300)), height-80, 1, 1, "v1.png");
  
  
}



void draw() { 
  pantallas(); 
  textAlign(CENTER, CENTER);
}


void mouseReleased() {
  if (pant<2) {
    pant++;
  }

}