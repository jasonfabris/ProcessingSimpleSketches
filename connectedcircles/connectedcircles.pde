import processing.pdf.*;

void setup() { 
   size(1200,1200);
   background(245,245,245);
   strokeWeight(5);
   //stroke(0,0,0,200);
   
   frameRate(.25);
   //noLoop();
   beginRecord(PDF,"fourbyfour.pdf");
}
 
static final int poisson(final double lambda) {
  final double L = Math.exp(-lambda);

  double p = 1;
  int k = -1;

  do ++k; 
  while ((p *= Math.random()) > L);

  return k;
}
 
    void draw() {
      background(245,245,245);
      int gridsize = 4;
      int orbwidth = (int)(((width / gridsize)/2) * .8);
      
      for(int x = 0; x < gridsize; x+=1) {
        for(int y = 0; y < gridsize; y+=1) {
    
          int cx1 = ((width / gridsize) / 2) + (width / gridsize) * x;
          int cy1 = ((height / gridsize) / 2) + (height / gridsize) * y;  
      
          N_Orb orb1 = new N_Orb(cx1, cy1, orbwidth);
          orb1.draw_orb();
        }
      }
    
    
    }
   
   void keyPressed() {
       //if(frameCount == 1) {
      endRecord();
      exit();
      //}
    
   }
   