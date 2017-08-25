import processing.pdf.*;
int x = 0;
int num_steps = 100;
 
void setup() {
 size(1000,1770); 
 strokeWeight(.75);
 background(255,255,255);
 beginRecord(PDF,"frame-1.pdf");
}


void draw() {
   float incr = width/num_steps;
   //background(255,255,255);
   //x=0;
   //translate(10,0);
       
   //for(int h=0; h<=360; h++) {
     //println(x, " ", radians(x), " ", sin(radians(x)));
      for(int i = 0; i<15; i++) {
        if(i % 2 == 0) {
          line(x + (i*2), height, x, sin(radians(x))*20*(i+1));
        } else {
          line(x + (i*2), sin(radians(x))*20*(i+1), x, height);
        }
        //line(x+2, height, x+2, sin(radians(x))*50);
      }
    x += incr;
        
   //}
}

void keyPressed() {
  endRecord();
  exit();

}