import processing.pdf.*;

void setup() { 
   size(1200,1200);
   background(245,245,245);
   strokeWeight(5);
   //stroke(0,0,0,200);
   stroke(180, 25, 215, 70);
   //noLoop();
   beginRecord(PDF,"frame-xxxx.pdf");
}
 
    void draw() {
      int gridsize = 3;
      
      for(int x = 0; x < gridsize; x+=1) {
        for(int y = 0; y < gridsize; y+=1) {
    
          int cx1 = ((width / gridsize) / 2) + (width / gridsize) * x;
          int cy1 = ((height / gridsize) / 2) + (height / gridsize) * y;  
      
          N_Orb orb1 = new N_Orb(cx1, cy1);
          orb1.draw_orb();
        }
      }
    
      if(frameCount == 1) {
        endRecord();
        exit();
      }
    
    }
   