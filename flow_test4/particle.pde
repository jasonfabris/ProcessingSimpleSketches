class Particle {
 
    float x_pos;
    float y_pos;
    float mass = 5;
    float topspeed = 20;
    
    PVector vel;
    PVector acc;
    PVector loc;
    PVector prev_loc;
  
    Particle(PVector _loc, PVector _vel, float _mass) {
      loc = _loc.copy();
      vel = _vel.copy();
      acc = new PVector();
      mass = _mass;
    }
    
    void apply_force(PVector force) {
      PVector f = PVector.div(force, mass);
      acc.add(f);
    }
    
    void update() {
        prev_loc = loc.copy();
            
        vel = vel.add(acc); 
        vel.limit(topspeed);
        vel.limit(-1 * topspeed);
      
        loc.add(vel); 
        acc.mult(0);
 
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
  }//check edges
    
    void display() {
      noStroke();
      stroke(255 * sin(vel.x), 10 * sin(vel.y), 30 * cos(mass), 125);
      line(prev_loc.x, prev_loc.y, loc.x, loc.y);
      //fill(255,10,30,125);
      //  ellipse(loc.x, loc.y, 5, 5);
    }
}