class Attr {
 
  PVector loc;
  float strength;
  
  
  Attr(PVector _loc, float _strength) {
  
    loc = _loc.copy();
    strength = _strength;
  
  }
  
  void display() {
    
    stroke(0,0,0);
    
    ellipse(loc.x, loc.y, 15, 15);
     //println(loc.x, loc.x, strength); 
  }
  
  void attract(Particle p) {
       
    //println("hi!");
      float dist = PVector.dist(p.loc, loc);
      dist = 1 / (dist);
      
      PVector f = PVector.sub(loc, p.loc);
      f.normalize();
      f.mult(dist * strength);
      //f.div(p.mass/12);
      
      p.apply_force(f);
      //println(dist);
    
  }
  
  void move(PVector tgt) {
      
    loc.x = lerp(loc.x, tgt.x, .4);
    loc.y = lerp(loc.y, tgt.y, .4);
    
  }
  
}