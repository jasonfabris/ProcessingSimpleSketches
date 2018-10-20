class grid_cell {

    PVector centre;
    PVector cell_dir;
    float cell_mag;
    PVector cell_size;
    float grid_rect_display_scale = 0.99; // only for displaying rects in the grid
    PVector ul;
    PVector br;
    float strength;
 
    grid_cell(PVector _centre, PVector c_size, PVector _dir, float _mag) {
        centre = _centre.copy();
        cell_dir = _dir.copy();
        cell_mag = _mag;
        cell_size = c_size.copy();
        
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
       //ellipse(ul.x, ul.y, 10, 10);
       //ellipse(br.x, br.y, 10, 10);
       
       line(centre.x, centre.y, centre.x + cell_dir.x * cell_mag, centre.y + cell_dir.y * cell_mag);
       //PVector vel_disp = cell_dir.copy();
       //vel_disp.mult(5);
       //println("Cell: ", centre.x, centre.y, centre.x + vel_disp.x, centre.y + vel_disp.y);
    }
    
    void update_cell_force() {
     cell_dir.x += randomGaussian()*5;
     cell_dir.y += randomGaussian()*5;
    
     cell_dir.mult(cell_mag);
    
     cell_dir.limit(20);
     cell_dir.limit(-20);
     
    }
    
    
}