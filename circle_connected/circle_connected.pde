
  float x;
  float y;
  float x2;
  float y2;
  
  float r = 100; 
  float i2;
  float i_top;
  float i_bottom;

  int steps = 200;
  int step_size = 1;

void setup() {
  size(500,500);
  background(255,255,255);
}

void draw() {
  for (float i = 1; i <= steps; i += step_size) {
   
    i2 = trans(i);
    
    i_top = map(i, 1, 10, 0, 179);
    x = cos(radians(i_top)) * r;
    y = sin(radians(i_top)) * r;
    
    i_bottom = map(i2, 1, 10, 180, 359);
    x2 = cos(radians(i_bottom)) * r;
    y2 = sin(radians(i_bottom)) * r;
    
    println(i, i2, x, x2, y, y2);
    
    pushMatrix();
      translate(width/2, height/2);
      strokeWeight(0.5);
      stroke(100,100,100,50);
      line(x, y, x2, y2);
      
    popMatrix();
    
  }
}


  float trans(float x) {
    
    float new_x = 1/(3/x * sin(2*x));
        
    return new_x;
    
  }