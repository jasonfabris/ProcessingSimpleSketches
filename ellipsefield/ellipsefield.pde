

void setup() {
  size(2000,2000);
  noFill();
  background(255,255,255);
  frameRate(10);
}

void draw() {
  
  PVector loc;
  
  loc = new PVector(random(height), random(width));
  
  int num = int(random(16));
  
  for(int i = 0; i<= num; i++) {
    strokeWeight(random(4));
    ellipse(loc.x, loc.y, 10 + (i*random(4)), 10 + (i * random(4)));
  }
  
}