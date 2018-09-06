
class Gparticle {
  
  float x;
  float y;
  PVector loc;
  PVector vel;
  PVector acc;
  float mass;
  
  Gparticle(float x_, float y_, float mass_) {
    x = x_;
    y = y_;
    loc = new PVector(x, y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    mass = mass_;
  }
    
  void update() {
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  
  void apply_force(PVector force) {
    PVector f = force.copy();
    f.div(mass);
    acc.add(f);
  }
  
  void display() {
    ellipse(loc.x, loc.y, mass/2, mass/2);
  }
}