import processing.pdf.*;

Wander[] wanderers = {};
int num_wand; 

void setup() {
  size(1200,1200);
  num_wand = 6;
  background(255,255,255);
  
  for(int i = 0; i < num_wand; i++) {
     Wander wand = new Wander();
     wand.display();
     wanderers = (Wander[])append(wanderers, wand);
   }

   beginRecord(PDF,"frame-xxxx.pdf");
}

void draw() {
   
 for (int i = 0; i < wanderers.length; i++) {
   wanderers[i].wander();
   wanderers[i].display();
 } 
}

void keyPressed() {
  endRecord();
  exit();
}
  
  