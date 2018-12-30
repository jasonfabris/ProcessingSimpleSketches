import processing.pdf.*;

//number of steps
int grid_x = 5;
int grid_y = 10;
int shp_size = 140;
float n_off = 000;
float n_inc = 0.03;
String fname;


void setup() {
  //beginRecord(PDF);
  size(1800,2400);
  colorMode(HSB, 360, 100, 100, 100);
  background(180, 50, 50);
  fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/squares_and_lines_2_%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());
}

void draw() {
   beginRecord(PDF, fname); 
  colorMode(HSB, 360, 100, 100, 100);
  background(180, 50, 50);  
  float rnd_amt = 0; // how random is the interior -- imply count rects, get more rnd as progresses
  for(float x = width*.1; x < width *.9; x += width/grid_x) {
      for(float y = height*.1; y < height * .9; y += height/grid_y) {
        
        
        pushMatrix();
          translate(x+shp_size, y + shp_size);
          rotate(noise(n_off) * TWO_PI);
          draw_shp(0,0, shp_size, rnd_amt);
        popMatrix();
      
      n_off += n_inc;
      n_inc += 2*n_inc; // get more random
      rnd_amt += 1;
      }    
  }
  endRecord();
  noLoop();
}

void draw_shp(int x, int y, int sz, float rnd) {
 rectMode(CENTER);
 strokeWeight(5);
 stroke(10, 70 , 25);
 fill(10, 60, 70);
 rect(x, y, sz, sz);
 for(int w = 0; w < sz; w += sz/50) {
   strokeWeight(random(1.25));
   stroke(100, random(50) , 10, 70);
   //clip(0, 0, sz*2, sz*2);
     //line(w, 0, 0, w + sz);
     //line(w - sz, 0, 0, w + sz);
     strokeWeight(.75);
    //println("init ", rnd);
   float rnd_a = map(rnd, 0, grid_x * grid_y, 0, .33);
   rotate(random(rnd_a)*TWO_PI);  // make this work!
   //rotate(random(1)*TWO_PI);
   println(rnd);
     line(w - sz/2, 0-sz/2, w-sz/2, sz/2);
   //noClip();
 }
 
}
