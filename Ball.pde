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

  void draw() {   
    speedY += POIDS;
    x = x + speedX;
    y = y + speedY;
    z = z + speedZ;
    
    translate(x, y, z);
    sphere(RAYON);
    translate(-x, -y, -z);
  }
}