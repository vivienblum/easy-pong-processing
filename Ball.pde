final class Ball {
  protected float x = 100, y = 240, z = 0, rayon = 28;

  protected float speedX = 1, speedY = 0, speedZ = -10, poids = 0.04;

  public Ball(float speedX, float speedY, float speedZ) {
    this.speedX = speedX;
    this.speedY = speedY;
    this.speedZ = speedZ;
  }

  void draw() {   
    speedX += poids;
    x = x + speedX;
    //y = y + speedY;
    //z = z + speedZ;
    
    translate(x, y, z);
    sphere(rayon);
  }
}