
int grid_size_x = 18;
int grid_size_y = 50;
size(1800,800);
background(245, 245, 255);
rectMode(CENTER);

float nz_off_x = 0;
float nz_off_y = 0;
float increment = 0.2;  //0.03?

int rect_size = 100;

for (int x = 0; x < grid_size_x; x++) {
  nz_off_x += increment;   
  nz_off_y = 0;
  for (int y = 0; y < grid_size_y; y++) {
    nz_off_y += increment;
    float nz = noise(x * nz_off_x, y * nz_off_y);
    
     //float nz_y = noise(10000 + y * nz_inc_y);
     pushMatrix();
         translate( ((width/grid_size_x) * x + 50 * map(nz, 0, 1, -1, 1)) ,  ((height/grid_size_y) * y + 50 * map(nz, 0, 1, -1, 1)));
         //println((width/grid_size) * x , (height/grid_size) * y, (width/grid_size) * x + 50 * map(nz_x, 0, 1, -1, 1) , (height/grid_size) * y + 50 * map(nz_y, 0, 1, -1, 1), nz_x, nz_y, nz_inc_x, nz_inc_y);
         
         float r = random(100,225);
         float g = random(10,20);
         float b = 180*nz;
         float a = 200 *nz;
         float a2 = 200 * (nz * 2);
         
         noStroke();
         fill(r, g, b, a);
           rect(0,0,rect_size,rect_size);
         
         stroke(r, g, b, a2);
         strokeWeight(18);
         noFill();
         //  rect(rect_size/4,rect_size/4, rect_size - rect_size/4, rect_size - rect_size/4);
          
     popMatrix();
   }
}