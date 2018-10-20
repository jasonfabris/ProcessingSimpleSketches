class g_particle {
 
  PVector loc;
  PVector prev_loc;
  PVector vel;
  PVector acc;
  float mass;
  grid_cell parent_cell;
  float topspeed = 15;
  
  g_particle(PVector pos, PVector veloc) {
     loc = pos.copy();
     prev_loc = pos.copy();
     mass = random(2);
     
     vel = veloc.copy();
     acc = new PVector(0,0);
     //vel.x = .5;
     //vel.y = .5;
  }
  
  void display() {
     float r= map(vel.x, -topspeed, topspeed, 0, 255);  
     float g = map(vel.y, -topspeed, topspeed, 100, 255);
     float b = map(vel.y, -topspeed, topspeed, 100, 255);
     float al = map(mass, 0, 75, 80, 20);
     
     stroke(r, g, b, al);
     //ellipse(loc.x, loc.y, 20, 20);
     line(loc.x, loc.y, prev_loc.x, prev_loc.y);
     
     if (vel.x > .8 * topspeed || vel.x <= .8 * topspeed * -1) {
       noStroke();
       fill(r, g, b, al/10);
       ellipse(loc.x, loc.y, 25, 25);
     }
  }
  
  void get_cell(grid_cell[][] cells) {
     
    //println("x: ", cells.length);
    
    for(int x = 0; x < cells.length; x++) {
      for(int y = 0; y < cells.length; y++) {
        
        if(loc.x > cells[x][y].ul.x && loc.x < cells[x][y].br.x &&
             loc.y > cells[x][y].ul.y && loc.y < cells[x][y].br.y) {
               //println("Parent: ", cells[x][y].centre.x, cells[x][y].centre.y);
               parent_cell = cells[x][y];
             }           
        //println(cells[x][y].centre.x, " :: ", cells[x][y].cell_size.y);
        //println("L:", loc.x, "  C: ", cells[x][y].br.x, cells[x][y].ul.x);
         
       } //x
    } //y
  } //get_cell
  
  void apply_force(PVector force) {
     PVector f = PVector.div(force, mass);
     acc.add(f);
  }
  
  PVector attract(g_particle g) {
      PVector dir = PVector.sub(loc, g.loc);
      float dist = dir.mag();
      dir.normalize();
      
      dist = max(dist, 5);
      
      float strength = (1 * mass * g.mass) / (dist * dist);
      dir.mult(strength); // try 20 for arbirtrary strength
      return dir;
  }
  
   void update() {
      prev_loc = loc.get();
            
      vel = vel.add(acc); 
      vel.limit(topspeed);
      vel.limit(-1 * topspeed);
      
      loc.add(vel); 
      
      acc.mult(0);
      
      
   }
    
  void check_edges() {
   //check edges
      if (loc.x > width || loc.x < 0) {
        acc.x *= -1;
        //vel.y *= -1;
      }
      
      if (loc.y > height || loc.y < 0) {
        acc.y *= -1;
        //vel.x *= -1;
      } 
  }
  
  void update_loc() {
      
  }
  
}