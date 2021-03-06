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

private float orientation = 0;
private float hauteur = 0;
private boolean running = true;
private static int SCORE;
 
OscP5 osc;
OscP5 osc2;
NetAddress addr;
OscMessage m;
Lights light;
Table table;
Room room;
Splash splash;
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
   pushMatrix();
   red.draw();
   popMatrix();
   
   if (ball != null) {
     ball.draw();
   }
   if(splash != null) {
     splash.draw();
   }

   if(running){
     checkCollision();
   }
}
 
 
void setup() { 
  osc = new OscP5(this, 8000);
  addr = new NetAddress("192.168.1.54", 8000);  
  
  SCORE = 0;
  noStroke();
  
  centerX = (width/2) - (SIZE_X/2);
  centerY = (height/2) - SIZE_PIED ;
  centerZ = 0;
 
  fullScreen(P3D);
  smooth();

  ball = new Ball(15, 7, 0);
  table = new Table(SIZE_X, SIZE_Y, SIZE_Z);  

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
  else if(key== '+'){
    cam.moveOnPlay();    
  }
  
  if(key=='b'){
    ball = new Ball(17, 9, 0);
    running=true;
  }
}
 
void oscEvent(OscMessage m) {
  String[] list = split(m+"", "|");
  hauteur = 5;
  if(list[1].contains("orientation")){
    String[] data = split(list[1]+"", ':');
    orientation = Float.parseFloat(data[1])/2;
    if(Float.parseFloat(data[2])>=50){
        print(data[2]);
        hauteur = 10;
    }
  }
  if(list[1].contains("vitesse")){
     String[] data = split(list[1]+"", ':');
     float vitesse = Float.parseFloat(data[1]) - 5;
     if(ball.getSpeedX() < vitesse) ball = new Ball(vitesse, hauteur, -orientation);
     running=true;
  }
}

void checkCollision(){
  if (ball != null) {

    if (ball.isInTeamCup(table.getTeamRed())){
      ball.stop(ball.getX(), ball.getY(), ball.getZ());
      running = false; 
      SCORE+=1;
      splash = new Splash(ball.getX(), ball.getY(), ball.getZ());
    }else
    
    if(ball.isCollisionTeamCup(table.getTeamRed(), table.getTeamBlue())) {
       ball.setBounceX();
       ball.setBounceZ();
       ball.setBounceY();
    }
    
    if (ball.isCollisionTable(SIZE_X, SIZE_Y, SIZE_Z)){
        ball.setBounceY();
    }
  }  
}