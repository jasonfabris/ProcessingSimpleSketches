class grid_cell {

    PVector centre;
    PVector flow_vel;
    PVector flow_mag;
    PVector cell_size;
    float grid_rect_display_scale = 0.8; // only for displaying rects in the grid
    PVector ul;
    PVector br;
    float strength;
 
    grid_cell(PVector c, PVector c_size, PVector vel, PVector mag) {
        centre = c.get();
        flow_vel = vel.get();
        flow_mag = mag.get();
        cell_size = c_size.get();
        
        //println("centre: ", centre.x, "cell_size: ", cell_size.x);
        
        //scaling factor - power of cell
        strength = randomGaussian()*3 + 5;
        
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
       line(centre.x, centre.y, centre.x + flow_vel.x, centre.y + flow_vel.y);
       PVector vel_disp = flow_vel.copy();
       vel_disp.mult(5);
       println("Cell: ", centre.x, centre.y, centre.x + vel_disp.x, centre.y + vel_disp.y);
    }
    
    void update_cell_force() {
     flow_vel.x += randomGaussian()*5;
     flow_vel.y += randomGaussian()*5;
    
     //flow_vel.limit(20);
     //flow_vel.limit(-20);
     //flow_vel.div(strength);
     
     //flow_mag.x = flow_vel.x;
     //flow_mag.y = flow_vel.y;
     //flow_mag = flow_mag.div(.9); 
     
    }
    
    
}