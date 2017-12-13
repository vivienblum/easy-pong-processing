final class Table{
  
  private float posX;
  private float posY;
  private float posZ; 
  private float sizeX; 
  private float sizeY; 
  private float sizeZ; 
  
  private TeamCup teamBlue;
  private TeamCup teamRed;
  
  public Table(float x, float y, float z, float sX, float sY, float sZ, PApplet a){
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
    float sizePied = 500;    
    translate(-((sizeX/2)-sizeY), (sizePied/2), (sizeZ/2)-sizeY);
    box(sizeY, sizePied, sizeY);
    translate(0,0, -(sizeZ - (2 * sizeY)));
    box(sizeY, sizePied, sizeY);
    translate(sizeX - (2 * sizeY),0,0);
    box(sizeY, sizePied, sizeY);
    translate(0,0, sizeZ - (2 * sizeY));
    box(sizeY, sizePied, sizeY);
    
    //On se remet au centre de la table (sur la table)
    translate(-sizeX + sizeY + 50, -(sizePied/2), -((sizeZ/2)-sizeY));
    
    //On dessine une equipe
    teamBlue.draw();
    
    translate(sizeX - 100, 0, 0);
    rotateY(PI);
    teamRed.draw();
  }
}