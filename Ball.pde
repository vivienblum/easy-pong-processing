final class Ball {
  private static final float RAYON = 28;
  private static final float POIDS = 0.4;
  
  private float x = 100;
  private float y = 100;
  private float  z = 0;  

  private float speedX;
  private float speedY;
  private float speedZ;

  public Ball(float speedX, float speedY, float speedZ) {
    this.speedX = speedX;
    this.speedY = speedY;
    this.speedZ = speedZ;
  }
  
  protected void incrementTrajectory() {
    
    if (y > 400) {
       speedY *= -1;
       //speedX = 0;
       //speedY = 0;
       //speedZ = 0;
    }
    else {
      speedY += POIDS;
    }
    
    x = x + speedX;
    y = y + speedY;
    z = z + speedZ;
  }

  void draw() {
    incrementTrajectory();
    translate(x, y, z);
    sphere(RAYON);
    translate(-x, -y, -z);
  }
}