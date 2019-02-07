import processing.pdf.*;

String fname;
fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/concentric_circles_2_%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());
beginRecord(PDF, fname); 

size(1500,1200);
colorMode(HSB, 360,100,100,100);

background(0,0,100);

int num_circs = 112;  //change this!!!
int gap = width/num_circs;

for(int c = 0; c < num_circs; c += 1) {
  
  float r = c * gap;
  
  for(int i = 0; i < 27; i += 3) {
    
    if(i % 2 == 0) {
      stroke(285, 70, 95, 100);
    } else {
      stroke(160, 70, 60, 100);
    }
    
    pushMatrix();
      translate(width/2 + i * (randomGaussian()*1.5), height/2 + (i/2) * 1.66); //random(-1.5, 1.5));
      noFill();
      ellipse(0,0, r*i, r*(i/1.5));
      println(r);
    popMatrix();
  }
  
}

endRecord();
exit();
