

void setup() {
  size(2000,2000);
  noFill();
  background(255,255,255);
  frameRate(10);
}

void draw() {
  
  PVector loc;
  
  loc = new PVector(random(height), random(width/10));
  
 // loc.x = loc.x + random(70);
 // loc.y = loc.y + random(70);
    
    
  int num = int(random(25));
  
  for(int i = 0; i<= num; i++) {
    strokeWeight(random(6)/4);
    ellipse(loc.x, loc.y, 30 + (i*random(7)), 30 + (i * random(7)));
    
  }
  
}