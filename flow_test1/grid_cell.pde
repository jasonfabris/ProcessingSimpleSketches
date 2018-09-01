class grid_cell {

    PVector centre;
    PVector flow_dir;
    PVector flow_mag;
    PVector cell_size;
    float grid_rect_display_scale = 0.8; // only for displaying rects in the grid
    PVector ul;
    PVector br;
    float strength;
 
    grid_cell(PVector c, PVector c_size, PVector dir, PVector mag) {
        centre = c.get();
        flow_dir = dir.get();
        flow_mag = mag.get();
        cell_size = c_size.get();
        
        //println("centre: ", centre.x, "cell_size: ", cell_size.x);
        
        //scaling factor - power of cell
        strength = randomGaussian()*3 + 15;
        
        ul = new PVector();
        br = new PVector();
        
        ul.x = centre.x - (cell_size.x / 2);
        ul.y = centre.y - (cell_size.y / 2);
        
        br.x = centre.x + (cell_size.x / 2);
        br.y = centre.y + (cell_size.y / 2);
    }
    
    void display() {
       rectMode(CENTER);
       rect(centre.x, centre.y, cell_size.x * grid_rect_display_scale, cell_size.y * grid_rect_display_scale);
       ellipse(ul.x, ul.y, 10, 10);
       ellipse(br.x, br.y, 10, 10);
    }
    
    void update_cell_force() {
     flow_dir.x += random(-2,2);
     flow_dir.y += random(-2,2);
    
     //flow_dir.limit(20);
     //flow_dir.limit(-20);
     //flow_dir.div(strength);
     
     flow_mag.x = flow_dir.x;
     flow_mag.y = flow_dir.y;
     //flow_mag = flow_mag.div(.9); 
     
    }
    
    
}