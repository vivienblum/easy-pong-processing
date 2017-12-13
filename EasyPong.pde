import netP5.*; 
import oscP5.*;
 

private static final float SIZE_X = 2000; //Profondeur
private static final float SIZE_Y = 45; //Hauteur
private static final float SIZE_Z = 1000; //Largeur 
 
OscP5 osc;
NetAddress addr;
OscMessage m;
Lights light;
Table table;
Camera cam;
float centerX, centerY, centerZ;
float camX, camY, camZ;

void draw() {
  background(120);
   light.draw();
   cam.draw();
   
   pushMatrix();noStroke();
   table.draw();    
   popMatrix();
}
 
 
void setup() {
  osc = new OscP5(this, 8000);
  addr = new NetAddress("192.168.43.131", 8000);  
  
  centerX = width/2;
  centerY = height/2;
  centerZ = 0;
 
  fullScreen(P3D);
  smooth();
  
  table = new Table(centerX, centerY, centerZ, SIZE_X, SIZE_Y, SIZE_Z, this);
  light = new Lights(0,0,0);
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
  osc.send(m,"192.168.43.131",8000);
  centerY += 10;
  cam.moveEye(centerX,centerY,centerZ);
  cam.movePos(camX,camY,camZ);
}
 
void oscEvent(OscMessage m) {
  //print(m+ " ");
  String[] list = split(m+"", '|');
  if(list[1].equals("gyro")){
   
  }
  if(list[1].equals("accelero")){
     
  }
}