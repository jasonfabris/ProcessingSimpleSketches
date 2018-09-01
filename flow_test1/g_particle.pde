class g_particle {
 
  PVector loc;
  PVector prev_loc;
  PVector vel;
  PVector acc;
  float mass;
  grid_cell parent_cell;
  
  g_particle(PVector pos, PVector veloc) {
     loc = pos.get();
     prev_loc = pos.get();
     mass = random(75.0);
     
     vel = veloc.get();
     //vel.x = .5;
     //vel.y = .5;
  }
  
  void display() {
     stroke(map(vel.x, -20, 20, 25, 255) ,25, map(vel.y, -20, 20, 25, 200),map(mass, 0, 75, 100, 15));
     //ellipse(loc.x, loc.y, 20, 20);
     line(loc.x, loc.y, prev_loc.x, prev_loc.y);
  }
  
  void get_cell(grid_cell[][] cells) {
     
    //println("x: ", cells.length);
    
    for(int x = 0; x < cells.length; x++) {
      for(int y = 0; y < cells.length; y++) {
        
        if(loc.x > cells[x][y].ul.x && loc.x < cells[x][y].br.x &&
             loc.y > cells[x][y].ul.y && loc.y < cells[x][y].br.y) {
               println("Parent: ", cells[x][y].centre.x, cells[x][y].centre.y);
               parent_cell = cells[x][y];
             }           
        //println(cells[x][y].centre.x, " :: ", cells[x][y].cell_size.y);
        //println("L:", loc.x, "  C: ", cells[x][y].br.x, cells[x][y].ul.x);
         
       } //x
    } //y
  } //get_cell
  
  void apply_force(PVector force) {
     vel.add(force);
     vel.div(10);
  }
  
   void update() {
      prev_loc = loc.get();
      PVector mag = parent_cell.flow_mag.get();
      println("PMag: ", mag.x, mag.y);
      acc = PVector.div(mag, mass);
      println("Acc: ", acc.x, acc.y);
      
      vel = vel.add(acc); 
      vel.limit(20);
      vel.limit(-20);
      loc.add(vel); 
      
      acc.mult(0);
      
      //check edges
      if (loc.x > width || loc.x < 0) {
        vel.mult(-1);
      }
      
      if (loc.y > height || loc.y < 0) {
        vel.mult(-1);
      }
   }
    
  
  
  void update_loc() {
      
  }
  
}