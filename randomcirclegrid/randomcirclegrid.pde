
int gridsize = 12;
float sz = randomGaussian()*15;
float nzsd = 0.04;

void setup() {
 size(1200,1200); 
 background(230,230,230);
}

void draw() {
  int xoffset = (width / gridsize) / 2;
  int yoffset = (height / gridsize) / 2;
  
  sz = sz + (sz * noise(nzsd));
  background(230,230,230);
  //print(xoffset);
  
  for(int x = 0; x < gridsize; x+=1) {
    for(int y = 0; y < gridsize; y+=1) {
      
      int cx1 = xoffset + (width / gridsize) * x;
      int cy1 = yoffset + (height / gridsize) * y;  
      
      stroke(180, 50, 95, 100);
      strokeWeight(3);
      noFill();
      
      ellipse(cx1 + randomGaussian() * (xoffset / 5), cy1 + randomGaussian() * (yoffset / 5), sz, sz);
      
      for(int n = 0; n < 150; n++) {
        noStroke();
        fill(180, 50, 35, 5);
        ellipse(cx1 + randomGaussian() * 5, cy1 + randomGaussian() * 5, 15, 15);
      }
    }
  }
  nzsd += 0.01;
  print(sz, " ");
  if(sz > 1000) {
    sz = randomGaussian() * 15;
    nzsd = 0.05;
  }
}