

int x_cnt = 80;
int y_cnt = 80;
int particle_cnt = 12; //more of these makes everything converge on origin

//int grid_size_x = 50;
//int grid_size_y = 50;

float row_cell_size;
float col_cell_size;
grid_cell[][] cells;
g_particle[] particles;

void setup() {
   size(1600,1600);
   background(245,250,255);

    row_cell_size = width / x_cnt;
    col_cell_size = height / y_cnt;
  
  cells = new grid_cell[x_cnt][y_cnt];
  float x_off = 0;
  float y_off = 10000;
  float grid_noise = noise(x_off, y_off);
  float noise_inc_x = 0.01;
  float noise_inc_y = 0.02;
  float grid_vel_scale = 2;
  
  //init grid
  for(int i = 0; i < x_cnt; i++) {
    for(int j = 0; j < y_cnt; j++) {
        
       float x_cent = i * row_cell_size  + row_cell_size/2; 
       float y_cent = j * col_cell_size  + col_cell_size/2;  
       //println(x_cent, y_cent);
       
       PVector k = new PVector(x_cent, y_cent);
       PVector s = new PVector(row_cell_size, col_cell_size);
       PVector cell_vel = new PVector();
       PVector m = new PVector();
       
       if(i % 4 == 0 && i > 1 && j > 1) {
         cell_vel.set(cells[i-1][j-1].flow_vel);
         m.set(random(1) * i, random(1) * j);
       } else {
         //cell_vel.set(random(-5,5), random(-5,5));
         cell_vel.set(map(noise(x_off, y_off), 0, 1, grid_vel_scale * -1, grid_vel_scale), map(noise(x_off, y_off), 0, 1, grid_vel_scale * -1, grid_vel_scale));
         m.set(random(-.5,.5) * i, random(-.5,.5) * j);
         cell_vel.set(cos(radians(360/x_cent)), sin(radians(360/y_cent)));
       }
       
       //grid_cell g = new grid_cell(k, s, l, m);
       cells[i][j] = new grid_cell(k, s, cell_vel, m);
       
       
       //println("i: ", i, " j: ", j);
       //cells[i][j].display();
       x_off =+ noise_inc_x;
        
    } //j
    y_off += noise_inc_y; 
  }  //i
  
  //init particles
  particles = new g_particle[particle_cnt];
  
  for(int p = 0; p < particle_cnt; p++) {
    PVector particle_loc = new PVector();
    particle_loc.x = (random(width-width/3, width/3));
    particle_loc.y = (random(height-height/3, height/3));
    
    PVector v = new PVector();
    v.x = randomGaussian()*2;
    v.y = randomGaussian()*2;
    particles[p] = new g_particle(particle_loc, v);
  
  } //p
  
} //setup


void draw() {
  //background(240,240,240);
  //particles
      for(int p = 0; p < particle_cnt; p++) {
        particles[p].get_cell(cells); //find parent cell
        //println("P: ", particles[p].parent_cell.flow_mag.x, particles[p].parent_cell.flow_mag.x);
        
        particles[p].apply_force(particles[p].parent_cell.flow_vel);
        
        //attract particles
        for(int k = 0; k < particle_cnt; k++) {
            if(k != p) {
              PVector grav = particles[p].attract(particles[k]);
              grav.mult(-1); //repel instead
              particles[p].apply_force(grav);
            }
        }
        //particles[p].apply_force(new PVector(-1,-1));
         
        
         //if(p > 0) {
         //  particles[p].apply_force(particles[p-1].vel);
         //}
          
        particles[p].check_edges();
        particles[p].update();
        
         
         
         particles[p].display();
          
      } //p
      
     //update cells
       for(int i = 0; i < x_cnt; i++) {
          for(int j = 0; j < y_cnt; j++) {
              cells[i][j].update_cell_force();  //make rules about this
          }
       }
       
       //if(frameCount % 100 == 0) { println(frameCount); }
    
} //draw