
final class RedCup{
  
  private float radius;
  private float hauteur;
  private float posX;
  private float posZ;
  private color col;
  
  public RedCup(float r, float h, float x, float z, color c){
    radius = r;
    hauteur = h;
    posX = x;
    posZ = z;
    col = c;
  }
  
  void draw(){
    rotateX(-PI/2);
    drawCylinder(30, radius, radius - 15, hauteur);
    rotateX(PI/2);
  }
  
  void drawCylinder( int sides, float r1, float r2, float h)
  {
    float angle = 360 / sides;
    float halfHeight = h / 2;
    // bottom
    fill(255,255,255);
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r2;
        float y = sin( radians( i * angle ) ) * r2;
        vertex( x, y, halfHeight);
    }
    endShape(CLOSE);
    
    //beer
    noStroke();
    shininess(100);
    fill(255,200,100);
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * (r2+3*r1)/4;
        float y = sin( radians( i * angle ) ) * (r2+3*r1)/4;
        vertex( x, y, -halfHeight/2);
    }
    endShape(CLOSE);
    
    // draw exterieur
    fill(col);
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
        float x1 = cos( radians( i * angle ) ) * r1;
        float y1 = sin( radians( i * angle ) ) * r1;
        float x2 = cos( radians( i * angle ) ) * r2;
        float y2 = sin( radians( i * angle ) ) * r2;
        vertex( x1, y1, -halfHeight);
        vertex( x2, y2, halfHeight);
    }
    endShape(CLOSE);
    
    // draw interieur
    r2 -= 1;    
    fill(255,255,255);
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
        float x1 = cos( radians( i * angle ) ) * r1;
        float y1 = sin( radians( i * angle ) ) * r1;
        float x2 = cos( radians( i * angle ) ) * r2;
        float y2 = sin( radians( i * angle ) ) * r2;
        vertex( x1, y1, -halfHeight);
        vertex( x2, y2, halfHeight);
    }
    endShape(CLOSE);
    stroke(0);
  } 
  
}