final class Room{
  
  public Room(){
    textureWrap(REPEAT);
  }
  
  void draw(){
    translate(SIZE_ROOM/2,SIZE_PIED,SIZE_ROOM/2);
    
    PImage img = loadImage("floor.jpg");
    //Sol
    beginShape();
    texture(img);
    vertex(0,0,0,1200,0);
    vertex(-SIZE_ROOM,0,0,0,0);
    vertex(-SIZE_ROOM,0,-SIZE_ROOM, 0,1200);
    vertex(0,0,-SIZE_ROOM,1200,1200);  
    endShape();
    
    img = loadImage("wall.jpg");
    beginShape();
    texture(img);
    vertex(0,0,0,1200,0);
    vertex(-SIZE_ROOM,0,0,0,0);
    vertex(-SIZE_ROOM,-SIZE_ROOM,0, 0,1200);
    vertex(0,-SIZE_ROOM,0,1200,1200);  
    endShape();
    
    img = loadImage("wall.jpg");
    beginShape();
    texture(img);
    vertex(0,0,-SIZE_ROOM,1200,0);
    vertex(-SIZE_ROOM,0,-SIZE_ROOM,0,0);
    vertex(-SIZE_ROOM,-SIZE_ROOM,-SIZE_ROOM, 0,1200);
    vertex(0,-SIZE_ROOM,-SIZE_ROOM,1200,1200);  
    endShape();
    
    img = loadImage("wall.jpg");
    beginShape();
    texture(img);
    vertex(0,0,0,1200,0);
    vertex(0,0,-SIZE_ROOM,0,0);
    vertex(0,-SIZE_ROOM,-SIZE_ROOM, 0,1200);
    vertex(0,-SIZE_ROOM,0,1200,1200);  
    endShape();
    
    img = loadImage("wall.jpg");
    beginShape();
    texture(img);
    vertex(-SIZE_ROOM,0,0,1200,0);
    vertex(-SIZE_ROOM,0,-SIZE_ROOM,0,0);
    vertex(-SIZE_ROOM,-SIZE_ROOM,-SIZE_ROOM, 0,1200);
    vertex(-SIZE_ROOM,-SIZE_ROOM,0,1200,1200);  
    endShape();
        
    translate(-SIZE_ROOM/2,-SIZE_PIED+(SIZE_ROOM/2),-SIZE_ROOM/2);
  }
}