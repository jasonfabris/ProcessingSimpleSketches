import processing.pdf.*;

int orig_gap = 11;
int last_gap = 11;
int gap = 11;
int x = 0;
int y = 0;

float nz = 0;
float deviation = 0;

void setup() {
 size(1600,1200);
 background(205,10,255);  
  beginRecord(PDF,"tenpt2.pdf");
}
void draw() {
 stroke(0,150,20);
 strokeWeight(4);
 strokeCap(ROUND);
 
 
 if(x>width) {
  y += gap;
  x = 0;
  int adj = round((randomGaussian() * deviation)/4);
  if(random(1) <0.5) {
    adj = adj * -1;
    println("Adj:", adj);
  }
  
  //if(y>height) {
    //y = 0;
    //gap = gap/3;
  //}
  
  int sign;
  if(random(1) < 0.33) {
    sign = -1; 
  } else {
    sign = 1;
  }
  
  gap = round(last_gap + (adj * sign)) ;
 
  //println(gap);
  if(gap <= 0 | gap > orig_gap * 1.5 | gap < orig_gap * .75) {
    gap = round(orig_gap + map(random(1), 0, 1, -1, 1));
  }
  last_gap = (int)(gap*.9);
 }
 
 if(y > height/2) {
   stroke(255, 69, 5);
 }
 
 if(random(1) < 0.5) {
   line(x, y, x+gap+noise(nz) ,y+gap+noise(nz) );
   //arc(x, y+gap*(gap/30), x, y, 0, radians(25), OPEN);
 } else {
   line(x, y+gap+(noise(nz)*(gap/30)), x+gap+(noise(nz)*1.5*(gap/30)), y);
   //arc(x, y+gap+(noise(nz)*(gap/30)), x, x, 0, radians(75), OPEN);
   if(random(1) < 0.025) {
     noFill();
     strokeWeight(2);
     stroke(0,150,120,90);
     ellipse(x, y, gap, last_gap);
   }
   //println(gap);
 }
 x+=gap;
 nz += 0.0208;
 deviation += 0.015;
}

 void keyPressed() {
       //if(frameCount == 1) {
      endRecord();
      exit();
      //}
    
   }