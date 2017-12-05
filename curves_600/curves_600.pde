
import processing.pdf.*;
   
  color[] jellyfish = {#0B91CE, #0A41C2, #9691FF, #E0DDCE, #B587B8};
  int counter = 1;
  
  void setup() {
       size(1200, 800);
       background(240);
       smooth();
       noFill();
       frameRate(5);
  }
  void draw() {
  }
  
  void keyPressed() {
  beginRecord(PDF, "frame-####.pdf"); 
    
    background(240,240,240);
    
    int cpX1 = int(randomGaussian()*height);
    int cpX2 = int(randomGaussian()*height);
    
    int cpY1 = int(random(height));
    int cpY2 = int(random(height));
  
      //int x = int(random(width-400, width+1200));
      //int y = int(random(height));
      
      int x=width/2;
      int y=height/2;
      
     for(int i = 0; i<600; i++) {
       stroke(jellyfish[int(random(5))],jellyfish[int(random(5))],jellyfish[int(random(5))], 40);
          
       beginShape();
         vertex(random(width/2), height/2); // for the first point!
         bezierVertex(cpX1, cpY1, cpX2, cpY2, x, y);
       endShape();
       
       cpX1 += 10;
       cpX2 += 10;
       cpY1 += 10;
       cpY2 += 10;
       x += 3;
       y += randomGaussian() * 2;
       
     } // inc i
     
     //sav
     counter +=1;
   endRecord();
     
  }//keypressed
  