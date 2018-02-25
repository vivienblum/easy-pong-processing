final class Camera{
  private float posX;
  private float posY;
  private float posZ; 
  private float eyeX;
  private float eyeY;
  private float eyeZ; 
  private float currentX; 
  private boolean team;
  private boolean move = false;
  private boolean switchSide = false;
  
  public Camera(float x, float y, float z, float eX, float eY, float eZ, boolean t){
    posX = eX;
    posY = eY;
    posZ = eZ;
    eyeX = x;
    eyeY = y;
    eyeZ = z;
    team = t;
    currentX = posX;
  }
  
  void draw(){
    if (move){
       posY -= 7;        
       if (team){
         posX += 10;
       }
       else{
         posX -= 10;
       }
       if(posY < -LIMIT_CAM_Y){
         currentX = posX;
         move = false;
       }
    }
    if (switchSide){
      if(team){
        if(posX > -LIMIT_CAM_X){
           posX -= 10; 
           if (abs(currentX) > abs(posX)){
             posZ = sqrt((currentX*currentX)-(posX*posX));
           }
           else{
             posZ = 0; 
           }
           if(posY < -BASE_CAM_Y){
              posY += 3;
           }
        }
        else{
          posX = -LIMIT_CAM_X;
          posY = -BASE_CAM_Y;
          posZ = 0;
          currentX = posX;
          switchSide = false;
        }
      }
      else{
        if(posX < LIMIT_CAM_X){
           posX += 10; 
           if (abs(currentX) > abs(posX)){
             posZ = sqrt((currentX*currentX)-(posX*posX));
           }
           else{
             posZ = 0; 
           }
           if(posY < -BASE_CAM_Y){
              posY += 3;
           }
        }
        else{
          posX = LIMIT_CAM_X;
          posY = -BASE_CAM_Y;
          posZ = 0;
          currentX = posX;
          switchSide = false;
        }        
      }
    }
    
    camera(posX, posY, posZ, eyeX, eyeY, eyeZ, 0, 1, 0);
    pushMatrix();
    background(145);
    fill(2550,0,0);
    rotateY(-PI/2);
    textSize(300);
    text("EASY PONG", -1500,-900,-1750);
    popMatrix();
    pushMatrix();
    fill(0);
    rotateY(-PI/2);
    textSize(100);
    text("SCORE " + SCORE, 1000,-950,-1500);
    popMatrix();
    
  }
  
  public void moveOnPlay(){
    move = true;
  }
  
  public void switchTeam(){
    switchSide = true;
    team = !team;
  }
  
  public void movePos(float x, float y, float z){
    eyeX = x;
    eyeY = y;
    eyeZ = z;
  }

}