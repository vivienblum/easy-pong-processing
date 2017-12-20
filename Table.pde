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
    fill(150,150,150);
    //On se met au centre de la table
    translate(posX, posY, posZ);
    shininess(8);
    PImage img = loadImage("wood.jpg");
    //Haut table
    beginShape();
    texture(img);
    vertex(sizeX/2,-sizeY/2,sizeZ/2,2048,0);
    vertex(sizeX/2,-sizeY/2,-sizeZ/2,0,0);
    vertex(-sizeX/2,-sizeY/2,-sizeZ/2, 0,2048);
    vertex(-sizeX/2,-sizeY/2,sizeZ/2,2048,2048);  
    endShape();
    //Bas table
    beginShape();
    texture(img);
    vertex(sizeX/2,sizeY/2,sizeZ/2,100,0);
    vertex(sizeX/2,sizeY/2,-sizeZ/2,0,0);
    vertex(-sizeX/2,sizeY/2,-sizeZ/2, 0,100);
    vertex(-sizeX/2,sizeY/2,sizeZ/2,100,100);  
    endShape();
    //Coté table
    beginShape();
    texture(img);
    vertex(sizeX/2,sizeY/2,sizeZ/2,100,0);
    vertex(sizeX/2,sizeY/2,-sizeZ/2,0,0);
    vertex(sizeX/2,-sizeY/2,-sizeZ/2, 0,100);
    vertex(sizeX/2,-sizeY/2,sizeZ/2,100,100);  
    endShape();
    beginShape();
    texture(img);
    vertex(-sizeX/2,sizeY/2,sizeZ/2,100,0);
    vertex(-sizeX/2,sizeY/2,-sizeZ/2,0,0);
    vertex(-sizeX/2,-sizeY/2,-sizeZ/2, 0,100);
    vertex(-sizeX/2,-sizeY/2,sizeZ/2,100,100);  
    endShape();
    beginShape();
    texture(img);
    vertex(sizeX/2,sizeY/2,sizeZ/2,100,0);
    vertex(-sizeX/2,sizeY/2,sizeZ/2,0,0);
    vertex(-sizeX/2,-sizeY/2,sizeZ/2, 0,100);
    vertex(sizeX/2,-sizeY/2,sizeZ/2,100,100);  
    endShape();
    beginShape();
    texture(img);
    vertex(sizeX/2,sizeY/2,-sizeZ/2,100,0);
    vertex(-sizeX/2,sizeY/2,-sizeZ/2,0,0);
    vertex(-sizeX/2,-sizeY/2,-sizeZ/2, 0,100);
    vertex(sizeX/2,-sizeY/2,-sizeZ/2,100,100);  
    endShape();
    
    
    //On dessine le dessus
   // box(sizeX, sizeY, sizeZ);
    
    //On dessine les pieds    
    translate(-((sizeX/2)-sizeY), (SIZE_PIED/2), (sizeZ/2)-sizeY);
    box(sizeY/2, SIZE_PIED, sizeY/2);
    translate(0,0, -(sizeZ - (2 * sizeY)));
    box(sizeY/2, SIZE_PIED, sizeY/2);
    translate(sizeX - (2 * sizeY),0,0);
    box(sizeY/2, SIZE_PIED, sizeY/2);
    translate(0,0, sizeZ - (2 * sizeY));
    box(sizeY/2, SIZE_PIED, sizeY/2);
    
    //On se remet au centre de la table (sur la table)
    translate(-sizeX + sizeY + 50, -(SIZE_PIED/2) - (sizeY/2), -((sizeZ/2)-sizeY));
    
    //On dessine une equipe
    teamBlue.draw();
    
    translate(sizeX - 100, 0, 0);
    rotateY(PI);
    teamRed.draw();
    translate(sizeX/2 + 50, 0, 0);
  }
}