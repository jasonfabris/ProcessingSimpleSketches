float xoff;
float fac;

void setup() {
  colorMode(HSB, 360, 100, 100);
  
  size(1400,1400);
  background(200,80,70);
  noStroke();
  //stroke(255,255,255,10);
  fill(300,90,10,22);
  //noFill();
  xoff = 0;
}
void draw() {
  fac = random(1);
  //translate(width/fac, height*fac);
    for(int i = 0; i<20000; i++) {
      xoff = xoff + .01;
      float p1;
      float p2;
      
      float n = noise(xoff);
      println(n);
        
        
      p1 = sin((radians(i)) * (randomGaussian()*n + width/(2*n))); 
      p2 = cos(radians(sqrt(i))) / (sin(p1*p1) * (n+n));
      //println(p1, " ", p2, " ", map(p1, 0, 1, 0, width),  map(p2, 0, 1, 0, height));
      
      fill(360*((p1+p2)/2),randomGaussian() * 15 + 75, random(40,100), 30);
      ellipse(map(p1, -1, 1, 0, width), map(p2, -1, 1, 0, height), 100,100);
      //filter(BLUR, 4);
      
    }
    filter(BLUR, 2);
    //noLoop();
}//draw
