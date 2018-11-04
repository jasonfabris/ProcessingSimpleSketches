class Particle {
     
    PVector pt_origin;  
    float x_pos;
    float y_pos;
    float mass;
    float topspeed = 50;
    
    PVector vel;
    PVector acc;
    PVector loc;
    PVector prev_loc;
  
    Particle(PVector _loc, PVector _vel, float _mass) {
      pt_origin = _loc.copy(); // original loc, don't change
      loc = _loc.copy();
      vel = _vel.copy();
      acc = new PVector();
      mass = _mass;
      topspeed = 150/mass;
    }
    
    void apply_force(PVector force) {
      PVector f = PVector.div(force, mass);
      acc.add(f);
    }
    
    void update() {
        prev_loc = loc.copy();
            
        vel = vel.add(acc); 
        vel.limit(1 * topspeed);
        vel.limit(-1 * topspeed);
      
        loc.add(vel); 
        acc.mult(0.01);
 
   }
    
  void check_edges() {
   //check edges
      if (loc.x > (width - 10) || loc.x < (0  + 10)) {
        acc.x *= -1;
        //vel.y *= -1;
      }
      
      if (loc.y > (height - 10) || loc.y < (0 + 10)) {
        acc.y *= -1;
        //vel.x *= -1;
      } 
      
      PVector c = new PVector(width/2, height/2);
      float c_dist = c.sub(loc).mag();
      if (c_dist < 5) {acc.mult(-1);}
      
  }//check edges
    
    void display() {
      noStroke();
      //10 * sin(vel.y)
      stroke(255 * sin(vel.x), 0, 120 * cos(mass), 15);
      //curve(prev_loc.x, prev_loc.y, prev_loc.x, prev_loc.y, loc.x, loc.y, prev_loc.x, prev_loc.y);
      line(prev_loc.x, prev_loc.y, loc.x, loc.y);
      //fill(255,10,30,125);
      //  ellipse(loc.x, loc.y, 5, 5);
    }
}