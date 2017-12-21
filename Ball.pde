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
  
  public boolean isCollisionTable(Table table) {
    /*if (x - RAYON < table.getX() + table.getSizeX()/2 && x + RAYON > table.getX() - table.getSizeX()/2) {
      if (z - RAYON < table.getZ() + table.getSizeZ()/2 && z + RAYON > table.getZ() - table.getSizeZ()/2) {
        if (y - RAYON < table.getY() + table.getSizeY()/2 && y + RAYON > table.getY() - table.getSizeY()/2) {
          return true;
        }
      }
    }*/
    return false;
  }
  
  public boolean isCollisionTeamCup(TeamCup teamCup) {
    for (RedCup cup : teamCup.getCups()) {
      
    }
    // fruit is an element of the `fruits` array.
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