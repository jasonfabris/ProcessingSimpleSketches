
int m = 1;
int p = 1;

void drawgrid(int xwid, int ywid) {
  
  for(int x = 0; x<= width; x+=xwid){
    for(int y = 0; y <= height; y+=ywid) {
      line(x, 0, x, height);
      line(0, y, width, y);
    }
  }
}

void setup() {
   size(1400,1400); 
   background(0,195,235);
   
   stroke(210,210,210,100);
   drawgrid(12,12);

}

void draw(){  
  background(0,195,225);
  stroke(180,80,150);
  noFill();
    
  pushMatrix();
    translate(width/2, height/2); 
    rect(0, 0, 170, 170);
  popMatrix();
  
  for(int i = 0; i<=360; i+=5) {
    i = i + m;
    //print(m, " ");
    pushMatrix();
      translate(width/2, height/2);
      rotate(radians(i));
  
  //  // and draw the square at the origin
  //    //noFill();
      rect(0, 0, 170, 170);
  
  //    drawgrid(15,8);
  //    print(i);
    popMatrix();
  }
   
   if(abs(m) % 750 == 0) { 
     p= -1 * p; 
   } 
   
   print("m:", m, "  ", "  p:", p, "  ");
   m += (1*p); 
   
}