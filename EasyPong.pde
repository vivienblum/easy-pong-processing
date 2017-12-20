import netP5.*; 
import oscP5.*;
import peasy.*;

private static final float SIZE_X = 1600; //Profondeur
private static final float SIZE_Y = 45; //Hauteur
private static final float SIZE_Z = 900; //Largeur 
private static final float SIZE_PIED = 500;  
private static final float SIZE_ROOM = 4000;   

private float test = 0;
 
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
Avatar blue;
Avatar red;

void draw() {
   background(120);
   light.draw();
   cam.draw();
   //On se met au centre de la table
   translate(centerX, centerY, centerZ);
   pushMatrix();
   table.draw();   
   popMatrix(); 
   pushMatrix();
   room.draw();
   popMatrix();
<<<<<<< HEAD
   if(ball!=null)ball.draw();
=======
   pushMatrix();
   translate(-((SIZE_X/2) + 200), (SIZE_Y/2) + SIZE_PIED, 0);
   blue.draw();
   popMatrix();
   ball.draw();
   checkCollision();
>>>>>>> eeb5c551bf1240344b7a57116730dd67c5a9dfe9
}
 
 
void setup() {
  osc = new OscP5(this, 8000);
<<<<<<< HEAD
=======
  addr = new NetAddress("192.168.43.131", 8000);  
>>>>>>> eeb5c551bf1240344b7a57116730dd67c5a9dfe9
  
  centerX = width/2;
  centerY = height/2;
  centerZ = 0;
 
  fullScreen(P3D);
  smooth();
  
<<<<<<< HEAD
  table = new Table(centerX, centerY, centerZ, SIZE_X, SIZE_Y, SIZE_Z);
  
 // ball = new Ball(30, 1, 0);
=======
  table = new Table(SIZE_X, SIZE_Y, SIZE_Z);
>>>>>>> eeb5c551bf1240344b7a57116730dd67c5a9dfe9
  
  ball = new Ball(30, 1, 0);  
  light = new Lights(0,0,0);
  room = new Room();
  camX = -800;
  camY = 0;
  camZ = 0;
  cam = new Camera(centerX, centerY, centerZ, camX, camY, camZ);
  
  blue = new Avatar(true, "avatar-1.png");
  //camera = new PeasyCam(this, 100);
  //camera.setMinimumDistance(50);
  //camera.setMaximumDistance(1000);
  noStroke();
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
  print(m+ " " + "\n");
  String[] list = split(m+"", '|');
  
  if(list[1].contains("gyro")){
    String[] data = split(list[1]+"", ':');
    print(m+ " " + "\n");
    test = Float.parseFloat(data[1])*10;
  }
  if(list[1].contains("accelero")){
     String[] data = split(list[1]+"", ':');
     if(ball==null)ball = new Ball(Float.parseFloat(data[1]), 1, test);
  }
}

void checkCollision(){
  if (ball.isCollisionTable(table)) {
    ball.setBounce();
  }
  if (ball.isCollisionTeamCup(table.getTeamBlue())) {
    ball.setBounce();
  }
}