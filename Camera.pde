final class Camera{
  private float posX;
  private float posY;
  private float posZ; 
  private float eyeX;
  private float eyeY;
  private float eyeZ; 
  
  public Camera(float x, float y, float z, float eX, float eY, float eZ){
    posX = x;
    posY = y;
    posZ = z;
    eyeX = eX;
    eyeY = eY;
    eyeZ = eZ;
  }
  
  void draw(){
   camera(eyeX, eyeY, eyeZ, posX, posY, posZ, 0, 1, 0);
  }
  
  public void moveEye(float x, float y, float z){
    posX = x;
    posY = y;
    posZ = z;
  }
  
  public void movePos(float x, float y, float z){
    eyeX = x;
    eyeY = y;
    eyeZ = z;
  }

}