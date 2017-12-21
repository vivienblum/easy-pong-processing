final class Room{
  
  PImage floor = loadImage("floor.jpg");
  PImage wall = loadImage("wall.jpg");
  
  public Room(){
    textureWrap(REPEAT);
  }
  
  void draw(){
    translate(SIZE_ROOM/2,SIZE_PIED,SIZE_ROOM/2);
    
    //Sol
    beginShape();
    texture(floor);
    vertex(0,0,0,1200,0);
    vertex(-SIZE_ROOM,0,0,0,0);
    vertex(-SIZE_ROOM,0,-SIZE_ROOM, 0,1200);
    vertex(0,0,-SIZE_ROOM,1200,1200);  
    endShape();
    
    beginShape();
    texture(wall);
    vertex(0,0,0,1200,0);
    vertex(-SIZE_ROOM,0,0,0,0);
    vertex(-SIZE_ROOM,-SIZE_ROOM,0, 0,1200);
    vertex(0,-SIZE_ROOM,0,1200,1200);  
    endShape();

    beginShape();
    texture(wall);
    vertex(0,0,-SIZE_ROOM,1200,0);
    vertex(-SIZE_ROOM,0,-SIZE_ROOM,0,0);
    vertex(-SIZE_ROOM,-SIZE_ROOM,-SIZE_ROOM, 0,1200);
    vertex(0,-SIZE_ROOM,-SIZE_ROOM,1200,1200);  
    endShape();
    
    beginShape();
    texture(wall);
    vertex(0,0,0,1200,0);
    vertex(0,0,-SIZE_ROOM,0,0);
    vertex(0,-SIZE_ROOM,-SIZE_ROOM, 0,1200);
    vertex(0,-SIZE_ROOM,0,1200,1200);  
    endShape();
    
    beginShape();
    texture(wall);
    vertex(-SIZE_ROOM,0,0,1200,0);
    vertex(-SIZE_ROOM,0,-SIZE_ROOM,0,0);
    vertex(-SIZE_ROOM,-SIZE_ROOM,-SIZE_ROOM, 0,1200);
    vertex(-SIZE_ROOM,-SIZE_ROOM,0,1200,1200);  
    endShape();
        
    translate(-SIZE_ROOM/2,-SIZE_PIED+(SIZE_ROOM/2),-SIZE_ROOM/2);
  }
}