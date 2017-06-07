
import processing.pdf.*;
int wd;
boolean record;

void setup() {
  size(1200,800);
  colorMode(RGB, 255);
  background(240,240,248);
  stroke(20,20,20,75);
  frameRate(10);
}

void draw() {
  
  if (record) {
    beginRecord(PDF, "frame-####.pdf"); 
  }
  
  for(int i= 0;i<width;i+=1) {
    wd = int(3 * noise(i));
    strokeWeight(wd);
    line(0+(randomGaussian()*(i/2)),0,0+(randomGaussian()*(i/2)), height);
    print(int(noise(i)), ", ");
    translate(pow(i,1.12),0);
  }
  
   if (record) {
    endRecord();
  record = false;
  }
}

void keyPressed() {
  saveFrame();
  record=true;
}