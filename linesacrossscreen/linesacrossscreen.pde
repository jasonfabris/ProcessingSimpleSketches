import processing.pdf.*;

 size(900,800);
 //frameRate(10);
 background(255,255,255);
 
beginRecord(PDF, "frameall.pdf");
for(int n=0; n<1000; n++) {
  
  pushMatrix();
    int trans = (int)map(random(20), 0, 20, -2, 2);
    translate(-trans, -trans);
    rotate(radians(trans));
    
    for(int i=0; i<width; i+=6) {
      
      int thick = (int)random(2) * i/width;
      boolean is_line = random(1) < 0.33;
      
      if(is_line) {
        strokeWeight(1);
        stroke(255,200,200,60);
        line(i, 0, i, height);
      }
    }
  popMatrix();
}
endRecord();