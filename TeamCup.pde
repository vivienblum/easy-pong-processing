final class TeamCup{
  private static final float REDCUP_SIZE = 45;
  private RedCup cups[];
  private float hauteur;
  private float x;
  private boolean team;
  private color col;
  
  public TeamCup(boolean t, float abs){
    team = t;
    x = abs;
    cups = new RedCup[10];
    hauteur = 100;
    if(team){
      col = color(255,0,0);
    }
    else{
      col = color(0,0,255);
    }
    
    //4 verres
    float posX = x, posZ = REDCUP_SIZE * 7/2;
    for(int j=0; j<4; j++){
      if(team){
        cups[j] = new RedCup(REDCUP_SIZE, hauteur, posX, posZ, col);
      }
      else{
        cups[j] = new RedCup(REDCUP_SIZE, hauteur, -posX, -posZ, col);
      }
      posZ += -REDCUP_SIZE*2;
    }
    
    posZ += REDCUP_SIZE * 14/2;
    posX += REDCUP_SIZE * 2;
    //3 verres
    for(int j=4; j<7; j++){
      if(team){
        cups[j] = new RedCup(REDCUP_SIZE, hauteur, posX, posZ, col);
      }
      else{
        cups[j] = new RedCup(REDCUP_SIZE, hauteur, -posX, -posZ, col);
      }
      posZ += -REDCUP_SIZE*2;
    }
    
    posZ += REDCUP_SIZE * 10/2;
    posX += REDCUP_SIZE * 2;    
    //2 verres
    for(int j=7; j<9; j++){
      if(team){
        cups[j] = new RedCup(REDCUP_SIZE, hauteur, posX, posZ, col);
      }
      else{
        cups[j] = new RedCup(REDCUP_SIZE, hauteur, -posX, -posZ, col);
      }
      posZ += -REDCUP_SIZE*2;
    }
    
    posZ += REDCUP_SIZE * 6/2;
    posX += REDCUP_SIZE * 2;    
    //1 verres
    translate(REDCUP_SIZE * 2, 0, REDCUP_SIZE * 6/2);
    if(team){
      cups[9] = new RedCup(REDCUP_SIZE, hauteur, posX, posZ, col);
    }
    else{
      cups[9] = new RedCup(REDCUP_SIZE, hauteur, -posX, -posZ, col);
    }
  }
  
  void draw(){
    //4 verres
    translate(0, -hauteur/2, REDCUP_SIZE * 7/2);
    for(int j=0; j<4; j++){
      cups[j].draw();
      translate(0,0,-REDCUP_SIZE*2);
    }
    
    //3 verres
    translate(REDCUP_SIZE * 2, 0, REDCUP_SIZE * 14/2);
    for(int j=4; j<7; j++){
      cups[j].draw();
      translate(0,0,-REDCUP_SIZE*2);
    }
    
    //2 verres
    translate(REDCUP_SIZE * 2, 0, REDCUP_SIZE * 10/2);
    for(int j=7; j<9; j++){
      cups[j].draw();
      translate(0,0,-REDCUP_SIZE*2);
    }
    
    //1 verres
    translate(REDCUP_SIZE * 2, 0, REDCUP_SIZE * 6/2);
    cups[9].draw();
    
    //Reset
    translate(-REDCUP_SIZE * 8, hauteur/2, 0);
  }
  
  public RedCup[] getCups() {
   return cups; 
  }
}