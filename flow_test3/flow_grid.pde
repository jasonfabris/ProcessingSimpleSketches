


class flow_grid {
 
  float x_off = 0;
  float y_off = 10000;
  float grid_noise = noise(x_off, y_off);
  float noise_inc_x = 0.01;
  float noise_inc_y = 0.02;
  float grid_vel_scale = 2;

  flow_grid(int _x_cnt, int _y_cnt) {
        cells = new grid_cell[_x_cnt][_y_cnt];    
  }
  
  
  grid_cell add_cell(PVector cent, PVector dir) {
        
     PVector s = new PVector(row_cell_size, col_cell_size);
     float m = 50;     
     
     return new grid_cell(cent, s, dir, m);       
      
  }
  
  void init_grid() {
      //add cells to grid
      for(int i = 0; i < x_cnt; i++) {
        for(int j = 0; j < y_cnt; j++) {
         
            float x_cent = i * row_cell_size  + row_cell_size/2; 
            float y_cent = j * col_cell_size  + col_cell_size/2; 
            PVector centre = new PVector(x_cent, y_cent);
            
            float x = cos(radians(360/(i + 1)));
            float y = sin(radians(360/(j + 1)));
            PVector dir = new PVector(x, y);
            dir.normalize();
            println("x: ", x, " y:", y);
            
            cells[i][j] = add_cell(centre, dir);
            //cells[i][j].display();
           
           
        } //j 
      }  //i
  }//init grid 
  
  
  
}