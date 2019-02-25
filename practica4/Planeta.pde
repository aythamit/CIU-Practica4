class Planeta{
    PShape planeta;
    PImage textura;
    float ang;
    float velocidadRot;
    int radio;
    float x;
    float y;
    float z;
    Satelite luna;
    boolean lunaBool;
    Planeta(float xTemp, float yTemp, float zTemp, int radi, String path){
      x = xTemp;
      y = yTemp;
      z = zTemp;
      radio = radi;
      ang = 0;
      velocidadRot = 0.5;
      int radioLuna = radio / (int) random(5, 10);
      luna = new Satelite(x*0.35,y*0.25,0,radioLuna, texturaSatelite);
      lunaBool = random(1) > .5;
      planeta = createShape(SPHERE, radio);
      textura = loadImage(path);
      planeta.setTexture(textura);
      planeta.setStroke(0);
      //lunaBool = true;
    }
    
    void display(){
      rotateY(radians(ang));
      translate(x, y, z);
      shape(planeta);
     if(lunaBool){ pintaLuna(); }
    }
    void update(){
      ang += velocidadRot;
      if(ang >= 360){ ang = 0; }
    }
    void pintaLuna(){
        pushMatrix();
        luna.display();
        popMatrix();
        luna.update();
    }
}
