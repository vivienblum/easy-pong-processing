final class Splash {
  
float[] explX = new float[1000];
float[] explY = new float[1000];
float[] explZ = new float[1000];
float[] explXVel = new float[1000];
float[] explYVel = new float[1000];
float[] explZVel = new float[1000];
  
 public Splash(float x, float y, float z){
   for (int i=0; i<=30; i++){
     explX[i] = random(x-10,x+10);
     explY[i] = random(y,y+10);
     explZ[i] = random(z-10,z+20);
     explXVel[i] = random(-5,5);
     explYVel[i] = random(-5,0);
     explZVel[i] = random(-5,0);
   }
 }
   
  void draw(){
    explosionDraw();
  }
  
  void explosionDraw(){
   for (int i=0; i<=30; i++){ 
       explYVel[i] += 0.2;
       explX[i] += explXVel[i];
       explY[i] += explYVel[i];
       explZ[i] += explZVel[i];
        translate(explX[i], explY[i], explZ[i]);
        noStroke();
        fill(255, 255, 100);
        sphere(5);
        stroke(0);
        translate(-explX[i], -explY[i], -explZ[i]);
   }
  } 
  
}