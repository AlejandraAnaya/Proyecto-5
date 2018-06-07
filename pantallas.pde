void pantallas() {

  switch (pant) {
  case 0: 
    inicio3();
    break; 

  case 1: 
    pres();
    break; 

  case 2: 
    prin();
    break;

  }
}


void inicio3() {
  image(fondo2, 0, 0, 2000, 1000);
  filter(BLUR, 6);
  fill(255);
  textFont(letra1);
  text("DERROTANDO A VINCENT", width/2, height-520);
  textFont(letra2);
  text(" La constante competitividad entre corrientes artísticas ha existido a lo largo de la historia.\n" +
    "El rechazo de los artistas por el arte pasado ha sido la motivación principal de la creación de nuevas tendencias.\n" +
    "En esta ocasión Andy Warhol está intentando derrotar al máximo exponente del Post-Impresionismo, Vincent Van Gogh.\n" +
    "¡Ayúdalo a vencer esta batalla!", width/2, height/2);
  textFont(letra1);
  textSize(15);
  fill(237, 230, 0);
  text("Presiona clic para continuar", width/2, height/2+200);
}


void pres() {
  image(fondo1, 0, 0, 2000, 1000);
  filter(BLUR, 6);
  image(teclado, -50, -50, 1300, 600);
  fill(255); 
  textFont(letra1);
  text("CONTROLES DEL TECLADO", width/2, height -520);
  textSize(15);
  fill(255);
  text("Presiona clic para continuar", width/2, height-40);
}


void prin() {

  image(fondo, 0, 0., width, height);
  
  if (hp1 <= 1000)
  {
    image(van1, 0, 0., 1200, 600);
  }

  if (hp1 <= 0)
  {
    image(van2, 0, 0., 1200, 600);
  } 

  textFont(letra1);
  textSize(30);
  fill (255);
  text("Vida: \n" + hp1, width/2+450, height/2-120);

  if (contador > 0) contador -= (1/frameRate); 
  if (contador <= 1 && estado >= inicio) {
    contador = 0;
    intentos = 5;
    x = 0;
    estado = r;
    v=20;  
    angulo=15;
  }

  switch (estado) {

  case inicio:       
    textSize(210);
    fill(255, 255, 0);
    text((int)contador, width/2, height/2);
    break;

  case ganador:
    image(derrotar, 100, 50, 1000, 500);
    break;

  case perder:
    textSize(20);
    image(escape,100,50,1000,500);
    break;

  case golpe:
  case r:

    andy();
    proyectil();

    if (van.dentro(x, y)) {
      hp1=-0;
      estado = ganador;
      contador = esp;
    }

    break;

    
  }

  textSize(20);
  fill(255);
  text("Angulo: "+(int)angulo+"º", 150, 30); 
  text("Velocidad: "+v/10, 150, 60);   
  text("Intentos: "+intentos, 150, 90);
}



void keyPressed() {
  if (estado == golpe) return;

  switch (keyCode) {
  case UP :    
    ang1();     
    break;
  case DOWN :  
    ang2();    
    break;
  case LEFT :  
    vel2();    
    break;
  case RIGHT : 
    vel1();    
    break;
  case 32 :    
    espacio();    
    break;
  }
}





void andy() {

  pushMatrix(); 
  imageMode(CENTER); 
  translate(88-angulo/4, height-60-angulo/5); 
  rotate(radians(-angulo)); 
  image(andy1, 120, -120, 357, 395); 
  imageMode(CORNER); 
  popMatrix();
}



void proyectil() {

  if (estado == golpe) {
    x= 150+(-angulo/2)+v*cos(radians(angulo))*t;
    y= (height-60-angulo)-(v*sin(radians(angulo))*t-gr*pow(t, 2)/2);

    float zoom = 0.8-(cos(t*3)/6);
    pushMatrix(); 
    imageMode(CENTER); 
    translate(x, y); 
    rotate(radians(-angulo+t*(100/v)*7)); 
    scale(zoom); 
    image(lata, 0, 0, 60, 101);
    imageMode(CORNER); 
    popMatrix(); 
    t+=0.25;

    if (y > height) {
      estado = r;
      x = 0;
      intentos--; 
      if (intentos <= 0) {
        contador = esp;
        estado = perder;
      }
    }
  }
}


void vel1() {
  if (estado == golpe) return;
  if (v < 80) v += 5;
}  

void vel2() {
  if (estado == golpe) return;
  if (v > 20) v-= 5;
}

void ang1() {
  if (estado == golpe) return;
  if (angulo < 90) angulo += 5;
}

void ang2() {
  if (estado == golpe) return;
  if (angulo > 0) angulo -= 5;
}

void espacio() {
  if (estado == golpe) return;
  if (intentos > 0) {
    t = 0;
    estado = golpe;
  }
  
 /* 
if (estado == ganador || estado == perder) {
estado = reinicio; 

}
  
  if (keyPressed) {
    if (key == 'b' || key == 'B') {
      pant = 0;
    }
  } else {
    return;
  }*/
}