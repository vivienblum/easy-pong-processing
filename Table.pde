final class Table{
  
  private float posX;
  private float posY;
  private float posZ; 
  private float sizeX; 
  private float sizeY; 
  private float sizeZ; 
  
  private TeamCup teamBlue;
  private TeamCup teamRed;
  
  public Table(float x, float y, float z, float sX, float sY, float sZ){
    posX = x;
    posY = y;
    posZ = z;
    sizeX = sX;
    sizeY = sY;
    sizeZ = sZ;
    teamBlue = new TeamCup(0);
    teamRed = new TeamCup(1);
  }
  
  void draw(){
    fill(100,100,100);
    //On se met au centre de la table
    translate(posX, posY, posZ);
    
    //On dessine le dessus
    box(sizeX, sizeY, sizeZ);
    
    //On dessine les pieds    
    translate(-((sizeX/2)-sizeY), (SIZE_PIED/2), (sizeZ/2)-sizeY);
    box(sizeY, SIZE_PIED, sizeY);
    translate(0,0, -(sizeZ - (2 * sizeY)));
    box(sizeY, SIZE_PIED, sizeY);
    translate(sizeX - (2 * sizeY),0,0);
    box(sizeY, SIZE_PIED, sizeY);
    translate(0,0, sizeZ - (2 * sizeY));
    box(sizeY, SIZE_PIED, sizeY);
    
    //On se remet au centre de la table (sur la table)
    translate(-sizeX + sizeY + 50, -(SIZE_PIED/2) - (sizeY/2), -((sizeZ/2)-sizeY));
    
    //On dessine une equipe
    teamBlue.draw();
    
    translate(sizeX - 100, 0, 0);
    rotateY(PI);
    teamRed.draw();
    translate(sizeX/2 + 50, 0, 0);
  }
  
  float getX() {
    return posX;  
  }
  
  float getY() {
    return posY;  
  }
  
  float getZ() {
    return posZ;  
  }
  
  float getSizeX() {
    return sizeX;  
  }
  
  float getSizeY() {
    return sizeY;  
  }
  
  float getSizeZ() {
    return sizeZ;  
  }
}