import processing.pdf.*;

Wander[] wanderers = {};
int num_wand; 

void setup() {
  size(1200,1200);
  num_wand = 12;
  background(255,255,255);
  
  for(int i = 0; i < num_wand; i++) {
     Wander wand = new Wander(random(5)*-1, random(5), random(1)/200, random(1)/200);
     wand.display();
     wanderers = (Wander[])append(wanderers, wand);
   }
  
   beginRecord(PDF,"frame-xxxx.pdf");
}

void draw() {
   
 for (int i = 0; i < wanderers.length; i++) {
   wanderers[i].wander();
   wanderers[i].display();
   wanderers[i].nz_magx += (random(1)/15);
   wanderers[i].nz_magy += (random(1)/15);
 } 
 
 
}

void keyPressed() {
  endRecord();
  exit();
}
  
  