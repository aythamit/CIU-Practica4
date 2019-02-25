class Satelite{
    PShape luna;
    PImage textura;
    float ang;
    float velocidadRot;
    int radio;
    float x;
    float y;
    float z;
    Satelite(float xTemp, float yTemp, float zTemp, int radi, String path){
      x = xTemp;
      y = yTemp;
      z = zTemp;
      radio = radi;
      ang = 0;
      velocidadRot = 0.5;
      luna = createShape(SPHERE, radio);
      textura = loadImage(path);
      luna.setTexture(textura);
      luna.setStroke(0);
    }
    void display(){
      rotar();
      translate(x, y, z);
      shape(luna);
    }
    void rotar(){
       rotateZ(radians(ang));
    }
    void update(){
      ang += velocidadRot;
      if(ang >= 360){ ang = 0; }
    }
}
