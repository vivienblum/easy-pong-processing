final class Lights{
  private float posX;
  private float posY;
  private float posZ; 
  
  public Lights(float x, float y, float z){
    posX = x;
    posY = y;
    posZ = z;
  }
  
  void draw(){
    directionalLight(100, 100, 100, 0, 0, -1);
    directionalLight(100, 100, 100, 0, 0, 1);
    ambientLight(180, 180, 180);
  }
}