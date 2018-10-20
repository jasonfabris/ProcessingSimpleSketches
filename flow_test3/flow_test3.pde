
float row_cell_size;
float col_cell_size;

int x_cnt = 20;
int y_cnt = 20;
int particle_cnt = 200; //more of these makes everything converge on origin

g_particle[] particles;
//int grid_size_x = 50;
//int grid_size_y = 50;
grid_cell[][] cells;

void setup() {
   size(1600,1600);
   background(245,250,255);

    row_cell_size = width / x_cnt;
    col_cell_size = height / y_cnt;
    
    //init grid
    flow_grid grid = new flow_grid(x_cnt, y_cnt);  
    grid.init_grid();
    
    
    //init particles
    particles = new g_particle[particle_cnt];
  
    for(int p = 0; p < particle_cnt; p++) {
        //starting location
        PVector particle_loc = new PVector();
        particle_loc.x = (random(width/1.5, width - width/1.5));
        particle_loc.y = (random(height/12, height - height/12));
        //starting velocity
        PVector v = new PVector();
        v.x = randomGaussian()*12;
        v.y = randomGaussian()*12;
        particles[p] = new g_particle(particle_loc, v); 
    } //p
  
} //setup


void draw() {
  //background(240,240,240);
  //particles
      for(int p = 0; p < particle_cnt; p++) {
        particles[p].get_cell(cells); //find parent cell
        
        particles[p].apply_force(particles[p].parent_cell.cell_dir);
        
        //attract particles
        for(int k = 0; k < particle_cnt; k++) {
            if(k != p) {
              PVector grav = particles[p].attract(particles[k]);
              grav.mult(-1); //repel instead
              particles[p].apply_force(grav);
            }
        }
                  
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