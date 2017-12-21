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
   if(ball!=null)ball.draw();
   pushMatrix();
   blue.draw();
   popMatrix();
  // ball.draw();
   checkCollision();
}
 
 
void setup() {
  osc = new OscP5(this, 8000);
  addr = new NetAddress("192.168.43.131", 8000);  
  
  centerX = width/2;
  centerY = height/2;
  centerZ = 0;
 
  fullScreen(P3D);
  smooth();
  

  //table = new Table(centerX, centerY, centerZ, SIZE_X, SIZE_Y, SIZE_Z);
  
 // ball = new Ball(30, 1, 0);

  table = new Table(SIZE_X, SIZE_Y, SIZE_Z);

  
  ball = new Ball(15, 1, 0);  
  light = new Lights(0,0,0);
  room = new Room();
  camX = -800;
  camY = 0;
  camZ = 0;
  cam = new Camera(centerX, centerY, centerZ, camX, camY, camZ);
  
  blue = new Avatar(false, "avatar-1.png");
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
  if (ball != null) {
    if (ball.isCollisionTable(SIZE_X, SIZE_Y, SIZE_Z)) {
      ball.setBounce();
    }
    if (ball.isCollisionTeamCup(table.getTeamBlue())) {
      ball.setBounce();
    }
    if (ball.isCollisionTeamCup(table.getTeamRed())) {
      ball.setBounce();
    }
    if (ball.isInCup(table.getTeamBlue())) {
      print("In\n");
      ball = null;
    }
    if (ball.isInCup(table.getTeamRed())) {
      print("In\n");
      ball = null;
    }
    print("Running\n");
    if (ball.isOut(SIZE_ROOM)) {
      print("Fin\n");
      ball = null;
    }
  }  
}