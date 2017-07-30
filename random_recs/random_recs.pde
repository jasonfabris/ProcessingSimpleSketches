// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover mover;

void setup() {
  size(1000,1000);
  mover = new Mover();
  background(255);
}

void draw() {
  
  
  mover.update();
  mover.checkEdges();
  mover.display(); 
}  