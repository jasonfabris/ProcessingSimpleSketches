import processing.pdf.*;

float r = 0.25; 
float rval = 0;
String fname;

void setup() {
  fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/moire_1_%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());
  beginRecord(PDF, fname);

  colorMode(HSB, 360,100,100,100);
  size(3000,3000);
  frameRate(2);
  //background(252,250,255);
  background(252,90,80);
}

void draw() {
    
  pushMatrix();
    translate(width/2, height/2);
    rotate(rval);
    scale(random(0.95,1.05));
    //stroke(0,0,255,100);
    //strokeWeight(1);
    noFill();
    //fill(100);
    //grids();
    circs();
    //rect(width/2, height/2, height/5, width/5, 20);
    //rect(0, 0, height/5, width/5, 20);
  popMatrix();

  rval += r;
  
  
}

void grids() {
  float w = width - 50;
  float h = height - 50;
  
  //draw vert lines
  stroke(190,140,100,35);
  strokeWeight(1);
    for(float i = -w/2; i < w/2; i += width/50) {
      line(i, -h/2, i, h/2);
    }

}

void circs() {
   float w = width - 50;
  float h = height - 50;
  
  //draw vert lines
  //stroke(190,140,100,25);
  stroke(90,100,100,20);
  strokeWeight(.5);
  //noFill();
    for(float i = -w/2; i < w/2; i += width/50) {
      //println(randomGaussian() * (i/100) + (i/50));
      translate(randomGaussian() * (i/100) + (i/50), randomGaussian() * (i/100) + (i/50));
      ellipse(0,0,i,i);
    }
}

void keyPressed() {
  if(key == 's') {
     endRecord();
     exit();
  }
}
