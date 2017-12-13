final class Ball {
  protected float x = 240, y = 100, z = 0, rayon = 28;

  protected float speedX = 0, speedY = 1, speedZ = -10, poids = 0.04;

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
  }
}