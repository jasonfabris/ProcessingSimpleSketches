float xoff;
float fac;

void setup() {
  size(1100,1100);
  background(0,0,100);
  noStroke();
  stroke(255,255,255,10);
  fill(255,255,255,10);
  //noFill();
  xoff = 0;
}
void draw() {
  fac = random(1);
  //translate(width/fac, height*fac);
    for(int i = 0; i<5000; i++) {
      xoff = xoff + .01;
      float p1;
      float p2;
      
      float n = noise(xoff);
        
      p1 = sin((radians(i)) * (randomGaussian() + width/2)) - n;
      p2 = cos(radians(i^2)) + (cos(p1) / n);
      //println(p1, " ", p2, " ", map(p1, 0, 1, 0, width),  map(p2, 0, 1, 0, height));
      ellipse(map(p1, 0, 1, 0, width), map(p2, 0, 1, 0, height), 10,10);
      
    }
    
}//draw