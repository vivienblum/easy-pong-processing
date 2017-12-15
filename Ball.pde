final class Ball {
  protected float x = 100, y = 100, z = 0, rayon = 28;

  protected float speedX = 1;
  protected float speedY = -10;
  protected float speedZ = -10;
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