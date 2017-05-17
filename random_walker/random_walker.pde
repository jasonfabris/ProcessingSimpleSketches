
Walker w1;

void setup() {
  size(1500,1500);
  frameRate(20);
  
  w1 = new Walker(width/2, height/2);
  
}

void draw() {
  
  w1.get_direction();
  w1.stroll(int(random(8)));
  
}