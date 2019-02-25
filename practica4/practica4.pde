

Estrella estrella;
Nave nave;
PImage fondo;

float px, py;
int mode = 0;
final int VISTA_GENERAL = 0;
final int VISTA_NAVE = 1;

float vx , vy , ang ;
float posX, posY , posZ;
float mouseXActual, mouseYActual;
float velocidadCamara = 2.5;

void setup() {
  size(1024, 768, P3D);
    imageMode (CENTER) ;
//Carga de l a imagen
  fondo=loadImage ("img/fondo2.jpg" );
  estrella = new Estrella(width/2, height/2, 0, 100);
  nave = new Nave(width*0.45, height*0.5, 0, 80);
  px=0;
  py=0;
  ang = 0;
  posX = width / 2.0 ;
  posY = height / 2.0;
  posZ = ( height / 2.0 ) / tan ( PI *30.0 / 180.0 );
  hint (DISABLE_DEPTH_TEST) ;

}


void draw() {
  
  vx=-sin ( radians ( ang ) ) ;
  vy=cos ( radians ( ang ) ) ;
  background(0);
  instrucciones();
  camera ( posX ,posY , posZ , width/2.0-px , height /2.0-py , 0 , vx , vy , 0 ) ;
  estrella.display();
  estrella.update();

  keyPressed();
  if(mode == VISTA_GENERAL) {  nave.display(); }
}
void instrucciones(){
  fill(255);
  textSize(20);
  text("Click Izquierdo para cambiar de modo", 40, 20);
    if (mode == VISTA_NAVE){
        text("Mouse para mover la camara en el eje X e Y", 40, 50);
        text("Flecha Arriba / Flecha Abajo para moverte en el eje Z", 40, 80);
    }
    else if(mode == VISTA_GENERAL){
        text("Flecha Izq / Flecha Derecha para moverte en el eje X", 40, 50);
        text("Flecha Arriba / Flecha Abajo para moverte en el eje Y", 40, 80);
        text("Z / X para moverte en el eje Z", 40, 110);
     }

}
void mouseClicked ( ) {
  if (mode == 0 ) {
    mode=VISTA_NAVE;
  } else {
    mode = VISTA_GENERAL;
  }
}
void mouseMoved(){
  if (mode == VISTA_NAVE){
    if(mouseX > mouseXActual){ px+=velocidadCamara; }
    else if (mouseX < mouseXActual) {px-=velocidadCamara; }
  
    if(mouseY > mouseYActual){ py+=velocidadCamara; }
    else if (mouseY < mouseYActual) {py-=velocidadCamara; }
    mouseYActual = mouseY;
    mouseXActual = mouseX;
  }
}
void keyPressed ( ) {
  if(keyPressed){
    if (mode == VISTA_NAVE){
      if ( key == CODED) {
        if ( keyCode == UP) { posZ-=10; } 
        else if ( keyCode == DOWN) { posZ+=10; }
        else if ( keyCode == LEFT ) { posX-=10; }
        else if ( keyCode == RIGHT) { posX+=10; }
      }
    }
    else if(mode == VISTA_GENERAL){
        if ( keyCode == 90 ) { nave.z-=10; }
        else if ( keyCode == 88) { nave.z+=10; }
      if ( key == CODED) {
        if ( keyCode == UP) { nave.y-=10; } 
        else if ( keyCode == DOWN) { nave.y+=10; }
        else if ( keyCode == LEFT ) { nave.x-=10; }
        else if ( keyCode == RIGHT) { nave.x+=10; }
      }
    }
  }
}
