
float nz_off = 0.01;

void setup() {
  size(1400,1400);
  background(255,255,244);
}

void draw() {
  background(20,25,94);
  
  for(int i = 0; i < 360; i+=1) {
    float n = noise(nz_off) + 0.9;   
    float x = cos(radians(i*n)) * (350 + n*100);
    float y = sin(radians(i*n)) * (350 + n*100);
    println(x,y,n,nz_off);
    
    pushMatrix();
      translate(width/2, height/2);
      stroke(255,random(60),235*noise(nz_off));
      strokeWeight(3*noise(nz_off));
      line(0,0,x,y);
    popMatrix();
  }
  
  nz_off += 0.007;
}
