final class Avatar{
  private boolean team;
  private PImage img;
  
  public Avatar(boolean t, String s){
    img = loadImage(s);
    team = t;
  }
  
  void draw(){
    if(team){
      translate(-((SIZE_X/2) + 200), (SIZE_Y/2) + SIZE_PIED, 0);
    }
    else{
      translate(((SIZE_X/2) + 200), (SIZE_Y/2) + SIZE_PIED, 0);
    }
    noStroke();
    beginShape();
    texture(img);
    vertex(0,0,600,0,img.height);
    vertex(0,0,-600,img.width,img.height);
    vertex(0,-1200,-600, img.width,0);
    vertex(0,-1200,600,0,0);  
    endShape();
    stroke(0);
  }
}