String texturaPlaneta1 = "img/texturaPlaneta.jpg";
String texturaPlaneta2 = "img/texturaPlaneta2.jpg";
String texturaPlaneta3 = "img/texturaPlaneta3.jpg";
String texturaPlaneta4 = "img/texturaPlaneta4.jpg";
String texturaPlaneta5 = "img/texturaPlaneta5.jpg";
String texturaSatelite = "img/texturaLuna.jpg";
class Estrella{
    PShape sol;
    PImage textura; 
    float ang;
    float velocidadRot;
    int radio;
    int x;
    int y;
    int z;
    ArrayList<Planeta> planetas;
    
    Estrella(int xTemp, int yTemp, int zTemp, int radi){
      planetas = new ArrayList<Planeta>();
      x = xTemp;
      y = yTemp;
      z = zTemp;
      radio = radi;
      ang = 0;
      velocidadRot = 0.25;
      textura = loadImage("img/texturaEstrella.jpg");
      sol = createShape(SPHERE, radio); 
      sol.setTexture(textura);
      sol.setStroke(0);
      aniadePlanetas();
    }
    void display(){
      translate(x, y, z);
      rotateX(radians(-45));
      pintarEstrella();
      pintarPlanetas();
    }
    void update(){
      ang += velocidadRot;
      if(ang >= 360){ ang = 0; }
    }
    void aniadePlanetas(){
      planetas.add(new Planeta(x*0.5,-y*0.5,0,radio /(int)random(5, 10),texturaPlaneta1));
      planetas.add(new Planeta(x*0.5,y,0,radio /(int)random(5, 10),texturaPlaneta2));
      planetas.add(new Planeta(x*0.75,y*0.75,0,radio /(int)random(5, 10),texturaPlaneta3));
      planetas.add(new Planeta(x*0.25,y*0.75,0,radio /(int)random(5, 10),texturaPlaneta4));
      planetas.add(new Planeta(-x*0.45,-y*0.75,0,radio /(int)random(5, 10),texturaPlaneta5));
    }
    void pintarEstrella(){
      pushMatrix();
      rotateY(radians(ang));
      shape(sol);
      popMatrix();
    }
    void pintarPlanetas(){
      for (Planeta planeta : planetas) {
        pushMatrix();
        planeta.display();
        popMatrix();
        planeta.update();
      }
    }
}
