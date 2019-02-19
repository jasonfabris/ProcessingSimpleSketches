class Particle {
 
 PVector loc;
 PVector vel;
 PVector acc;
 
 float max_mass = 32;
 float mass = 12;
  
 Particle(PVector _loc) {
   loc = _loc.copy();
   vel  = new PVector(0,0);
   acc = new PVector(0,0);
   
   mass = max_mass * (randomGaussian()/3 + 0.75);
   //println(10 * (randomGaussian()/6 + 1));
   
 }
  
 void apply_force(PVector f) {
  
   acc.add(f);
 }
  
 void wander() { 
    float rndx = randomGaussian();
    float rndy = randomGaussian();
    vel.x *= rndx;
    vel.y *= rndy;
 }
 
 void update() {
   
   vel.add(acc);
   loc.add(vel);
   
   acc.mult(0);
   
 }
 
 void display() {
    //noFill();
    //stroke(200, 100, 90, 80);
    //stroke(200, 100, map(mass, 0, max_mass, 60, 95), map(mass, 0, max_mass, 20, 40));
    
    //noStroke();
    stroke(map(mass, 0, max_mass, 200, 260), 100, map(mass, 0, max_mass, 80, 100), map(mass, 0, max_mass, 20, 50));
    fill(map(mass, 0, max_mass, 190, 220), 100, map(mass, 0, max_mass, 60, 95), map(mass, 0, max_mass, 20, 50));
    ellipse(loc.x, loc.y, mass/2, mass/2); 
    
    
 }
  
}