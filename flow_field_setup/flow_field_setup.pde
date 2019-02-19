
size(500,500);

int grid_x = width/10;
int grid_y = height/10;
float step_x = 360/grid_x;
float step_y = 360/grid_y;
float x_mag = 10;
float y_mag = 10;

float nz_fct = 0.103;
float nz_start = 10;
float nz;

for(int x = 0; x < grid_x; x++) {
  nz = noise(nz_start, nz_start);
  
  float angle_x = radians(step_x * x);
  float x_val = cos(angle_x) * nz * x_mag;  
  
  for(int y = 0; y < grid_y; y++) {
    nz = noise(nz_start, nz_start);
    
    float angle_y = radians(step_y * y);
    float y_val = sin(angle_y) * nz * y_mag;
        
    nz_start += nz_fct;
    
    println(x, y, grid_x * x + 5, grid_y * y + 5, nz, x_val, y_val);
    pushMatrix();
      translate(grid_x * x + 5, grid_y * y + 5);
      line(0, 0, x_val, y_val);
    popMatrix();
    
  } //y
} //x