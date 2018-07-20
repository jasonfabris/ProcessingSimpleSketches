
int num_circles;

String fname; 


void setup() {
  size(1000,1000);
  num_circles = 350;
}

void draw() {
  
  fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/point_cloud_red_%d%d%d%d%d%d.png", year(), month(), day(), hour(), minute(), second(), frameCount);

  translate(width/2, height/2);
  background(250,250,255);
  
    for(int n = 0; n < num_circles; n++) {
      float off_x = random(-20,20);
      float off_y = random(-20,20);
      float noise_st = 0;
      
      translate(off_x, off_y);
      float r1 = random(width*.25);
      float r2 = random(height*.25);
          
        for(int i = 0; i < 720; i++) {
         
          float x;
          float y;
          float nv = noise(noise_st);     
          x = cos(radians(i)) * r1 * nv;
          y = sin(radians(i)) * r1 * (nv*2);
          
          stroke(255,0,0,75);
          point(x,y);
          noise_st += 0.04;
        }
    }
    save(fname);
} // draw