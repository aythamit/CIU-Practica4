class Nave{
  float x;
  float y;
  float z;
  float radio;
      Nave(float xTemp, float yTemp, float zTemp, int radi){
      x = xTemp;
      y = yTemp;
      z = zTemp;
      radio = radi;
    }
    void display(){
      translate(x, y, z);
      fill(0,200,100);
      box(radio);
    }
}
