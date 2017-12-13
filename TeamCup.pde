final class TeamCup{
  private static final float REDCUP_SIZE = 40;
  private RedCup cups[];
  private int numCup;
  private float hauteur;
  
  public TeamCup(int i){
    numCup = i;
    cups = new RedCup[10];
    hauteur = 100;
    for(int j=0; j<10; j++){
      cups[j] = new RedCup(REDCUP_SIZE, hauteur);
    }
  }
  
  void draw(){
    //4 verres
    translate(0, hauteur/2, REDCUP_SIZE * 7/2);
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
    translate(-REDCUP_SIZE * 8, -hauteur/2, 0);
  }
}