import processing.pdf.*;

int increment = 5;
int cyc = 1;
boolean record = false;

void setup() {
  size(2000,2000);
  background(255,255,255);

  beginRecord(PDF, "sqrs.pdf");
      record = true;
}

void draw() {
  
  //translate(width/2, height/2);
  noFill();
  
  for(int i = 0; i <= 1000; i += pow(increment,1.5)) {
    for(int n = 1; n <=6; n++) {    
      switch(n) {
        case 1:
          translate(i,i);
          break;
        case 2:
          translate(-i,-i);
          break;
        case 3:
          translate(0,i);
          break;
        case 4:
          translate(0,-i);
          break;
        case 5:
          translate(i,0);
          break;
        case 6:
          translate(-i,0);
          break;
      }
      rect(0,0, i, i);
      int nze = round(randomGaussian() * 3);
      increment = increment + nze;
    }
    
    if (frameCount % 250 == 0) { 
      saveFrame();
      endRecord();
      record = false;
      exit();
    }
    
  }
  
}