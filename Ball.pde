final class Ball {
  private static final float RAYON = 28;
  private static final float POIDS = 0.4;
  
  private float x = -100;
  private float y = -600;
  private float z = 0;  

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
          y = - SIZE_Y - RAYON;
          return true;
        }
      }
    }
    return false;
  }
  
  public boolean isCollisionTeamCup(TeamCup redTeamCup, TeamCup blueTeamCup) {
    for (RedCup cup : redTeamCup.getCups() ) {
      if (isCollisionRedCup(cup)) return true;
    }
    for (RedCup cup : blueTeamCup.getCups() ) {
      if (isCollisionBlueCup(cup)) return true;
    }
    return false;
  }
  
  public boolean isInTeamCup(TeamCup teamCup) {
    for (RedCup cup : teamCup.getCups()) {
      if (isInCup(cup)){
        return true;
      }
    }
    return false;
  }
  
  protected boolean isInCup(RedCup cup) {   
    if((-(y + RAYON) >= 50) && -(y - RAYON) <= 100 + cup.getHauteur()){
        double distance = getDistance(cup.getPosX(), x, cup.getPosZ(), z);
        if (((distance/6) <= (cup.getRadius()+15))) {
          return true;
        }
    }
      return false;
 }
 
 /*protected boolean isInCup(RedCup cup) {   
   if((x - RAYON > (cup.getPosX() - cup.getRadius())) && (x + RAYON < (cup.getPosX() + cup.getRadius()))) {
     if(y - RAYON < -(SIZE_Y/2 + cup.getHauteur())) {
       if((z - RAYON > (cup.getPosZ() - cup.getRadius())) && (z + RAYON < (cup.getPosZ() + cup.getRadius()))) {
          return true;
               
      }
    }
   }
      return false;
 }*/
 
/* protected boolean isCollisionCup(RedCup cup){
   print(ball.getX() + "," + ball.getY() + "," + ball.getZ() + "\n");
   print(cup.getPosX() + "," + cup.getPosZ() + "," + cup.getHauteur() + "\n\n");
      if (x - RAYON >= cup.getPosX() + cup.getRadius() && x + RAYON <= -(cup.getPosX() - cup.getRadius())) {
        print("x");
        if(y - RAYON <= (SIZE_Y/2 + cup.getHauteur())) {
          print("y");
      if (z - RAYON >= cup.getPosZ() + cup.getRadius() && z + RAYON <= -(cup.getPosZ() - cup.getRadius())) {
        print("z");
          return true; 
       }
     }
   }
   return false; 
 }*/
  
 protected boolean isCollisionRedCup(RedCup cup) {
    if((-(y + RAYON) >= 50) && -(y - RAYON) <= 100 + cup.getHauteur()){
      double distance = Math.sqrt(Math.pow((cup.getPosX() - x), 2) + Math.pow((cup.getPosZ() - z), 2));
      if ((distance/6) <= (cup.getRadius() + RAYON)) {
        x = cup.getPosX() - cup.getRadius() + RAYON;
        y = -200 - RAYON;
        return true;
      }
    }
    return false;
  }
  
   protected boolean isCollisionBlueCup(RedCup cup) {
    if((-(y + RAYON) >= 30) && -(y - RAYON) <= 100 + cup.getHauteur()){
      double distance = Math.sqrt(Math.pow((-cup.getPosX() - x), 2) + Math.pow((cup.getPosZ() - z), 2));
      if ((distance/5) <= (cup.getRadius() + RAYON)) {
        x = -cup.getPosX() + cup.getRadius() + RAYON;
        y = -200 - RAYON;
        return true;
      }
    }
    return false;
  }
  
  protected double getDistance(float xA, float xB, float yA, float yB) {
    return sqrt(pow((xA - xB), 2) + pow((yA - yB), 2));
  }
  
  public boolean isOut(float size) {
    if (x - RAYON > size/2 || x + RAYON < -size/2 || y - RAYON > size/2 || y + RAYON < -size/2 || z - RAYON > size/2 || z + RAYON < -size/2) {
      return true;
    }
    return false;
  }
  
  public void setBounceX() {
    speedX/=1.5;
    speedX *= -1;
  }

  public void setBounceZ() {  
    speedZ/=1.2;
    speedZ *= -1;
  }
  
  public void setBounceY() {  
    speedY = speedY/2;
    speedY= -speedY;
  }
  
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  public float getZ(){
    return z;
  }
  
  public void stop(float x2, float y2, float z2) {
    speedX = 0;
    speedY = 0;
    speedZ = 0;
    x = x2;
    y = y2;
    z = z2;
  }
  
  protected void incrementTrajectory() {
    if(speedY != 0) speedY += POIDS;
    
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