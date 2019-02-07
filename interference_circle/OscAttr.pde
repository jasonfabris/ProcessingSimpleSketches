class OscAttr {
  
  float amp;  ///max amplitude
  float period; //rotations
  float r;
  
  float loc_x;
  float loc_y;
  
  
  OscAttr(float _amp) {
      
    loc_x = width/2;
    loc_y = height/2;
    amp = _amp;
    period = 60; // every 2 seconds?
  
  }
  
  void display() {
    r = amp * cos(TWO_PI * period/frameCount);
    println(r, frameCount);
    
    noFill();
    stroke(10, 100, 100, 100);
    ellipse(loc_x, loc_y, r, r);
    
    float r_old = amp * cos(period/(frameCount-1));
    noFill();
    stroke(75, 65, 80, 100);
    ellipse(loc_x, loc_y, r_old, r_old);
    
    
  }
  
}
