class Magnet {
 PVector loc;
 float strength;
 float G = 1;
 
 
 Magnet(PVector _loc, float _strength) {
   strength = _strength;
   loc = _loc.copy();
 }
 
 PVector attract(Tracer t) {
    PVector force = PVector.sub(loc, t.loc);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    //d = constrain(d, 5.0, 25.0);                        // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float str = (G * strength * t.mass) / (d * d);      // Calculate gravitional force magnitude
    force.mult(str);                                  // Get force vector --> magnitude * direction
    return force;
  }
 
 void display() {
    rect(loc.x, loc.y, strength, strength); 
 }
  
}