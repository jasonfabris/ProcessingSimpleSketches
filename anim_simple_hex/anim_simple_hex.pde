
int shp_count = 70;

void setup() {
    size(1000,1000);
    colorMode(HSB, 360, 100, 100, 100);
    
    background(12, 75, 28);
    //frameRate(15);
}

void draw() {
    
    background(12, 75, 28);
    
    float n = frameCount;
    float h = 65 + frameCount / 24;
    float w = 175 + frameCount / 250;
    
    for(int i = 0; i < shp_count; i++) {
      float pos = radians(360/shp_count);
      //for (float c = 0; c < 360; c+=10) {
        pushMatrix();
          translate(width/2 + cos(i) * (n % w), height/2 + sin(i) * (n % h));
          noFill();
          stroke(200,100,100, 50);
          //polygon(cos(pos*i) * 120, sin(pos*i) * 120, width/3, 6);
          polygon(0, 0, width/3, 6);
        popMatrix();
     //}
    }
  
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
