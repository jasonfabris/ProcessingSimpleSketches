class Repeller {
 
  PVector loc;
  float strength;
  
  
  Repeller(PVector _loc, float _strength) {
  
    loc = _loc.copy();
    strength = _strength;
  
  }
  
  void display() {
     
    ellipse(loc.x, loc.y, 15, 15);
     //println(loc.x, loc.x, strength); 
  }
  
  void repel(Particle p) {
       
    //println("hi!");
      float dist = PVector.dist(p.loc, loc);
      dist = 1 / (dist);
      
      PVector f = PVector.sub(loc, p.loc);
      f.normalize();
      f.mult(dist * -1 * strength);
      
      p.apply_force(f);
      //println(dist);
    
  }
  
}