final class Ball {
  protected float x = 100;
  protected float y = 100;
  protected float  z = 0;  

  protected float speedX;
  protected float speedY;
  protected float speedZ;
  
  protected float rayon = 28;
  protected float poids = 0.04;

  public Ball(float speedX, float speedY, float speedZ) {
    this.speedX = speedX;
    this.speedY = speedY;
    this.speedZ = speedZ;
  }

  void draw() {   
    speedY += poids;
    x = x + speedX;
    y = y + speedY;
    z = z + speedZ;
    
    translate(x, y, z);
    sphere(rayon);
    translate(-x, -y, -z);
  }
}