

int x_cnt = 10;
int y_cnt = 10;
int particle_cnt = 100;

int grid_size_x = 100;
int grid_size_y = 100;

float row_cell_size;
float col_cell_size;
grid_cell[][] cells;
g_particle[] particles;

void setup() {
   size(1000,1000);
   background(245,245,245);

    row_cell_size = width / x_cnt;
    col_cell_size = height / y_cnt;
  
  cells = new grid_cell[x_cnt][y_cnt];
  
  for(int i = 0; i < x_cnt; i++) {
    for(int j = 0; j < y_cnt; j++) {
        
       float x_cent = i * row_cell_size  + row_cell_size/2; 
       float y_cent = j * col_cell_size  + col_cell_size/2;  
       //println(x_cent, y_cent);
       
       PVector k = new PVector(x_cent, y_cent);
       PVector s = new PVector(row_cell_size, col_cell_size);
       PVector l = new PVector();
       PVector m = new PVector();
       
       if(i % 4 == 0) {
         l.set(random(5)+10, random(5)+10);
         m.set(random(5) * i +10, random(5) * j +10);
       } else {
         l.set(random(-5,5), random(-5,5));
         m.set(random(-5,5) * i, random(-5,5) * j);
       }
       
       //grid_cell g = new grid_cell(k, s, l, m);
       cells[i][j] = new grid_cell(k, s, l, m);
       
       
       //println("i: ", i, " j: ", j);
       //cells[i][j].display();
       
    } //j
  }  //i
  
  //particles
  particles = new g_particle[particle_cnt];
  
  for(int p = 0; p < particle_cnt; p++) {
    PVector particle_loc = new PVector();
    particle_loc.x = (random(width));
    particle_loc.y = (random(height));
    
    PVector v = new PVector();
    v.x = random(-1,1);
    v.y = random(-1,1);
    particles[p] = new g_particle(particle_loc, v);
  
  } //p
  
} //setup


void draw() {
  
  //particles
      for(int p = 0; p < particle_cnt; p++) {
        particles[p].get_cell(cells);
        println("P: ", particles[p].parent_cell.flow_mag.x, particles[p].parent_cell.flow_mag.x);
        particles[p].update();
        
         
         if(p > 0) {
           particles[p].apply_force(particles[p-1].vel);
         }
         
         particles[p].display();
          
      } //p
      
     //update cells
       for(int i = 0; i < x_cnt; i++) {
          for(int j = 0; j < y_cnt; j++) {
              cells[i][j].update_cell_force();  //make rules about this
          }
       }
    
}