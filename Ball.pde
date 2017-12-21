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
          y = -hauteur - RAYON;
          speedY *= 0.5;
          return true;
        }
      }
    }
    return false;
  }
  
  public boolean isCollisionTeamCup(TeamCup teamCup) {
    for (RedCup cup : teamCup.getCups()) {
      if (isCollisionCup(cup)) return true;
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
    
    if (y - RAYON > -SIZE_Y/2 - cup.getHauteur() && y + RAYON < -SIZE_Y/2) {
      print("X : "+cup.getPosX()+" Z : "+cup.getPosZ()+"\n");
      print("X : "+x+" Z : "+z+"\n");
      //double distance = Math.sqrt(Math.pow((cup.getPosX() - x), 2) + Math.pow((cup.getPosZ() - z), 2));
      double distance = getDistance(cup.getPosX(), x, cup.getPosZ(), z);
      print("DISTANCE : "+distance+" RADIUS : "+cup.getRadius()+"\n");
      if (distance < cup.getRadius() + 15) {
        //stop();
        return true;
      }
    }
    return false;
  }
  
  protected boolean isCollisionCup(RedCup cup) {
    if (y + RAYON > -SIZE_Y/2 - cup.getHauteur() && y - RAYON < -SIZE_Y/2) {
      double distance = Math.sqrt(Math.pow((cup.getPosX() - x/* + RAYON*/), 2) + Math.pow((cup.getPosZ() - z/* + RAYON*/), 2));
      //print("DISTANCE : "+distance+" RADIUS : "+cup.getRadius()+"\n");
      if (distance > cup.getRadius() && distance < cup.getRadius() + RAYON) {
        print("Bounce \n");
        speedX *= 0.45;
        return true;
      }
    }
    return false;
  }
  
  protected double getDistance(float xA, float xB, float yA, float yB) {
    return Math.sqrt(Math.pow((xA - xB), 2) + Math.pow((yA - yB), 2));
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
  
  public void setBounceX() {
     speedX *= -1;
  }
  
  public void stop() {
    speedX = 0;
    speedY = 0;
    speedZ = 0;
    x = -100;
    y = -600;
    z = 0;
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