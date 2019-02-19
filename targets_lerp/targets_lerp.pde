float start_grey = 0;
CTarget[] tgt;

void setup() {
  size(640, 360);
  
  noStroke();
  //noLoop();
   
   tgt = new CTarget[3];
   
   for(int i = 0; i < 3; i++) {
     tgt[i] = new CTarget(random(width), random(height), (int)random(50, 300), (int)random(2, 10), start_grey);
   }
  
}

void draw() {
  
  background(51);
  
  if(start_grey < 254) {
    start_grey = lerp(start_grey, 255, .05);
  } else {
    start_grey = lerp(start_grey, 0, .05);
  }
  
  for(int i = 0; i < 3; i++) {
    tgt[i].update_pos(tgt[i].xloc + random(-5, 5), tgt[i].xloc + random(-5, 5)); 
    tgt[i].drawTarget();
  }
  
  //drawTarget(width*0.5, height*0.5, 300, 10, 255);
  //drawTarget(width*0.75, height*0.3, 120, 6, 125);
  
}



float lerp2(float startx, float endx, float t) {
  float new_val;
 
   new_val = startx * (1 - t) + endx * t;
   return new_val;
}