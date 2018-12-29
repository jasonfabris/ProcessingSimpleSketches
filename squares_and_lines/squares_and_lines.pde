
//number of steps
int grid_x = 5;
int grid_y = 10;
int shp_size = 140;
float n_off = 000;
float n_inc = 0.03;

void setup() {
  
  size(1800,2400);
  colorMode(HSB, 360, 100, 100, 100);
  background(180, 50, 50);
  
}

void draw() {
     
  for(float x = width*.1; x < width *.9; x += width/grid_x) {
      for(float y = height*.1; y < height * .9; y += height/grid_y) {
        
        pushMatrix();
          translate(x+shp_size, y + shp_size);
          rotate(noise(n_off) * TWO_PI);
          draw_shp(0,0, shp_size);
        popMatrix();
      
      n_off += n_inc;
      n_inc += 2*n_inc; // get more random
      }  
  }
  noLoop();
}

void draw_shp(int x, int y, int sz) {
 rectMode(CENTER);
 strokeWeight(5);
 stroke(10, 70 , 25);
 fill(10, 60, 70);
 rect(x, y, sz, sz);
 for(int w = 0; w < sz; w += sz/2.5) {
   strokeWeight(random(1.25));
   stroke(100, random(50) , 10, 70);
   line(w, 0, 0, w + sz);
   line(w - sz, 0, 0, w + sz);
   println(w);
 }
 
}
