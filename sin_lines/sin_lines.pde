import processing.pdf.*;
int x = 0;
int num_steps = 30;
String fname = "";

//int r = 230;
//int g = 20;
//int b = 20;

int r = 20;
int g = 230;
int b = 20;


void setup() {
 size(1800,1000); 
 strokeWeight(.75);
 background(255,255,255);
 fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/sin_lines_%d%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());
  beginRecord(PDF, fname);
}


void draw() {
   float incr = width/num_steps;
   color init_col = color(r,g,b,12);
   stroke(init_col);
   if(x> width) {
     x=0;
     b = b+8;
     init_col = color(r,g,b,12);
   }
   //translate(10,0);
       
   //for(int h=0; h<=360; h++) {
     //println(x, " ", radians(x), " ", sin(radians(x)));
      for(int i = 0; i<300; i++) {
        if(i % 2 == 0) {
          line(x + (i*12), height, x, sin(radians(x))*20*(i+1));
        } else {
          line(x + (i*7), sin(radians(x))*random(20)*(i+1), x, height);
        }
        //line(x+2, height, x+2, sin(radians(x))*50);
      }
    incr += randomGaussian()*20 + 25;
    x += incr;    
   //}
}

void keyPressed() {
  endRecord();
  exit();

}