
size(1200,1200);
colorMode(HSB, 360,100,100,100);

background(0,0,100);

int num_circs = 25;
int gap = width/num_circs;

for(int c = 0; c < num_circs; c += 1) {
  
  float r = c * gap;
  
  for(int i = 0; i < 10; i += 1) {
    stroke(0+180/(i+1), 100, 100);
    pushMatrix();
      translate(width/2 + i, height/2 + i* 1.66); //random(-1.5, 1.5));
      noFill();
      ellipse(0,0, r, r);
      println(r);
    popMatrix();
  }
  
}
