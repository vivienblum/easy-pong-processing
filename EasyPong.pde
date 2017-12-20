import netP5.*; 
import oscP5.*;
import peasy.*;

private static final float SIZE_X = 1600; //Profondeur
private static final float SIZE_Y = 45; //Hauteur
private static final float SIZE_Z = 900; //Largeur 
private static final float SIZE_PIED = 500;  
private static final float SIZE_ROOM = 4000;   
 
OscP5 osc;
NetAddress addr;
OscMessage m;
Lights light;
Table table;
Room room;
PeasyCam camera;
Camera cam;
float centerX, centerY, centerZ;
float camX, camY, camZ;
Ball ball;

void draw() {
   background(120);
   light.draw();
   cam.draw();
   pushMatrix();
   table.draw();    
   room.draw();
   popMatrix();
   if(ball!=null)ball.draw();
}
 
 
void setup() {
  osc = new OscP5(this, 8000);
  
  centerX = width/2;
  centerY = height/2;
  centerZ = 0;
 
  fullScreen(P3D);
  smooth();
  
  table = new Table(centerX, centerY, centerZ, SIZE_X, SIZE_Y, SIZE_Z);
  
 // ball = new Ball(30, 1, 0);
  
  light = new Lights(0,0,0);
  room = new Room();
  camX = -800;
  camY = 0;
  camZ = 0;
  cam = new Camera(centerX, centerY, centerZ, camX, camY, camZ);
} 
 
void keyPressed() {
  if(key == 'a'){
    camY += 10;
  }
  else{
    camY -= 10;
  }
  //osc.send(m,"192.168.43.131",8000);
  centerY += 10;
  cam.moveEye(centerX,centerY,centerZ);
  cam.movePos(camX,camY,camZ);
}
 
void oscEvent(OscMessage m) {
 // print(m+ " " + "\n");
  String[] list = split(m+"", '|');
  
  if(list[1].contains("gyro")){
   
  }
  if(list[1].contains("accelero")){
     String[] data = split(list[1]+"", ':');
     if(ball==null)ball = new Ball(30, Float.parseFloat(data[1]), 0);
  }
}