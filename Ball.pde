final class Ball {
  private static final float RAYON = 28;
  private static final float POIDS = 0.4;
  
  private float x = -100;
  private float y = -600;
  private float  z = 0;  

  private float speedX;
  private float speedY;
  private float speedZ;

  public Ball(float speedX, float speedY, float speedZ) {
    this.speedX = speedX;
    this.speedY = speedY;
    this.speedZ = speedZ;
  }
  
  public boolean isCollisionTable(float profondeur, float hauteur, float largeur) {
   if (x - RAYON < profondeur/2 && x + RAYON > -profondeur/2) {
      if (z - RAYON < largeur/2 && z + RAYON > -largeur/2) {
        if (y - RAYON < hauteur/2 && y + RAYON > -hauteur/2) {
          return true;
        }
      }
    }
    return false;
  }
  
  public boolean isCollisionTeamCup(TeamCup teamCup) {
    for (RedCup cup : teamCup.getCups()) {
      
    }
    return false;
  }
  
  public boolean isInTeamCup(TeamCup teamCup) {
    for (RedCup cup : teamCup.getCups()) {
      if (isInCup(cup)) return true;
    }
    return false;
  }
  
  protected boolean isInCup(RedCup cup) {
    return false;
  }
  
  public boolean isOut(float size) {
    if (x - RAYON > size/2 || x + RAYON < -size/2 || y - RAYON > size/2 || y + RAYON < -size/2 || z - RAYON > size/2 || z + RAYON < -size/2) {
      return true;
    }
    return false;
  }
  
  public void setBounce() {
     speedY *= -1;
  }
  
  protected void incrementTrajectory() {
    speedY += POIDS;
    
    x = x + speedX;
    y = y + speedY;
    z = z + speedZ;
  }

  void draw() {
    incrementTrajectory();
    translate(x, y, z);
    noStroke();
    sphere(RAYON);
    stroke(0);
    translate(-x, -y, -z);
  }
}