final class Avatar{
  private boolean team;
  private String source;
  
  public Avatar(boolean t, String s){
    source = s;
    team = t;
  }
  
  void draw(){
    PImage img = loadImage(source);
    beginShape();
    texture(img);
    vertex(0,0,500,0,img.height);
    vertex(0,0,-500,0,0);
    vertex(0,1000,-500, img.width,0);
    vertex(0,1000,500,img.width,img.height);  
    endShape();
  }
}