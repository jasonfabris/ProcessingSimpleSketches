class Tracer {
  
 PVector loc;
 PVector prev_loc;
 PVector vel;
 PVector acc;
 float size = 10;
 float mass = 0;
 float max_mass = 200;
 
 Tracer(PVector _loc) {
  loc = _loc.copy(); 
  acc = new PVector();
  vel = new PVector();
  mass += randomGaussian() * 10 + max_mass; 
 }
 
 void apply_force(PVector frc) {
   acc.add(frc);
 }
 
 void update() {
    prev_loc = loc.copy();            
    vel = vel.add(acc); 
    //vel.limit(1 * topspeed);
    //vel.limit(-1 * topspeed);
      
    loc.add(vel); 
    acc.mult(0);
 }
 
 void check_edge() {
    if((loc.x > width-10) || (loc.y  < 10)) {
      //vel.mult(0);
      float a_mag = vel.mag();
      vel.mult(a_mag*-1);
      size += 5;
    }
    
    if((loc.y > height-10) || (loc.y < 10)) {
      //vel.mult(0);
      float a_mag = vel.mag();
      vel.mult(a_mag*-1);
      size += 5;
    }
    
 }
 
 void display() {
  //ellipse(loc.x, loc.y, size, size);
  float alph = map(mass, 0, max_mass, 5, 20);
  //println(mass, alph);
  stroke(random(150, 240), 20, map(loc.y, 0, height, 0, 255), alph);
  line(prev_loc.x, prev_loc.y, loc.x, loc.y);
  //strokeWeight(size);
 }
}