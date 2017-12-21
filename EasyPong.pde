import netP5.*; 
import oscP5.*;
import peasy.*;

private static final float SIZE_X = 1600; //Profondeur
private static final float SIZE_Y = 45; //Hauteur
private static final float SIZE_Z = 900; //Largeur 
private static final float REDCUP_SIZE = 45;
private static final float REDCUP_HEIGHT = 100;
private static final float SIZE_PIED = 500;  
private static final float SIZE_ROOM = 4000;   

private static final float LIMIT_CAM_X = 1600;   
private static final float LIMIT_CAM_Y = 1000;   
private static final float BASE_CAM_Y = 600;   

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
Ball ball;
Avatar blue;
Avatar red;

void draw() {
   background(120);
   light.draw();
   //On se met au centre de la table
   translate(centerX, centerY, centerZ);
   cam.draw();
   pushMatrix();
   table.draw();   
   popMatrix(); 
   pushMatrix();
   room.draw();
   popMatrix();
   if(ball!=null)ball.draw();
   pushMatrix();
   red.draw();
   popMatrix();
   pushMatrix();
   blue.draw();
   popMatrix();
   if(ball!=null)checkCollision();
}
 
 
void setup() {
  osc = new OscP5(this, 8000);
  addr = new NetAddress("192.168.43.131", 8000);  
  noStroke();
  
  centerX = (width/2) - (SIZE_X/2);
  centerY = (height/2) - SIZE_PIED ;
  centerZ = 0;
 
  fullScreen(P3D);
  smooth();
  
  table = new Table(SIZE_X, SIZE_Y, SIZE_Z);  
  ball = new Ball(15, 1, 0);  
 
  //ball = new Ball(30, 1, 0);  

  light = new Lights(0,0,0);
  room = new Room();
  cam = new Camera(centerX, centerY, centerZ, -LIMIT_CAM_X, -BASE_CAM_Y, 0, true);
  
  blue = new Avatar(true, "avatar-1.png");
  red = new Avatar(false, "avatar-2.png");  
} 
 
void keyPressed() {
  if(key == 'a'){
    cam.switchTeam();
  }
  else{
    cam.moveOnPlay();    
  }
  //osc.send(m,"192.168.43.131",8000);
}
 
void oscEvent(OscMessage m) {
  String[] list = split(m+"", "|");
  
  if(list[1].contains("gyro")){
    print(m +"\n");
    String[] data = split(list[1]+"", ':');
    test = Float.parseFloat(data[1])*2;
  }
  if(list[1].contains("accelero")){
     String[] data = split(list[1]+"", ':');
     if(ball==null)ball = new Ball(Float.parseFloat(data[1])-20, 1, -test);
     test=0;
  }
}

void checkCollision(){
  if (ball != null) {
    if (ball.isCollisionTable(SIZE_X, SIZE_Y, SIZE_Z)) {
      ball.setBounce();
    }
    else if (ball.isCollisionTeamCup(table.getTeamBlue())) {
      ball.setBounce();
    }
    else if (ball.isCollisionTeamCup(table.getTeamRed())) {
      ball.setBounce();
    }
    if (ball.isOut(SIZE_ROOM)) {
      print("Fin\n");
      ball = null;
    }
    else if (ball.isInTeamCup(table.getTeamRed())) {
      print("In\n");
      ball = null;
    }
    else if (ball.isInTeamCup(table.getTeamBlue())) {
      print("In\n");
      ball = null;
    }
    print("Running\n");
  }  
}