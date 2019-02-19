

int origin_x;
int origin_y;
float init_radius;
 
void setup(){
  size(1000,1000);
  
  origin_x = width/2;
  origin_y = height/2;
  
  background(255,255,255);
  
}

void draw() {
  
  fill(255,255,255,55);
  noStroke();
  rect(0,0,width, height);
  
  init_radius = width/1.8;
  float nz = 0.02;
  float max_seg = init_radius;
  
  //background(255,255,255);   TODO:: animation is fun, but maybe its own sketch
 
    for(int i = 0; i < 720; i+=1) {
      
      //prob of getting a small circle
      float sprob = 0.25;
      
      //noisy seg length
      float n = noise(nz);
      print(n, " : ");
      float seg_length = n * init_radius + (randomGaussian() + 5);
      
      //how long is the longest line?
        max_seg = max(seg_length, max_seg);
      
      
      if(random(1) < sprob) {
        stroke(30, 80, (randomGaussian() *10) + 125, (randomGaussian() * 12) + 55);
        strokeWeight(abs(randomGaussian())+1);
        line(origin_x, origin_y, origin_x + cos(radians(i)) * seg_length, origin_y + sin(radians(i)) * seg_length); 
        //println(origin_x, " : ", origin_y, " : ", cos(radians(i)), " : ", cos(radians(i)) * seg_length, " : ", sin(radians(i)), " : ", cos(radians(i))* seg_length);
        
          if(random(1) < sprob) {
            noStroke();
            float sm_size = 14 * n + randomGaussian() + 5;
            float sm_size_2  = sm_size * abs(randomGaussian());
            float sm_size_3 = sm_size_2 * abs(randomGaussian());
     
            
            //first small one
            fill(random(255), random(225), random(255), 150 + random(100));
            ellipse(origin_x + cos(radians(i)) * (seg_length + 15), origin_y + sin(radians(i)) * (seg_length + 15), sm_size, sm_size);
            
            // one more small one
            if(random(1) < sprob / 1.5) {
              fill(random(255), random(215), random(255), 100+random(155));
              ellipse(origin_x + cos(radians(i)) * (seg_length + 25), origin_y + sin(radians(i)) * (seg_length + 25), sm_size_2, sm_size_2);
            }
            
            // one more small one
            if(random(1) < sprob / 1.8) {
              fill(random(255), random(205), random(255), 75+random(225));
              ellipse(origin_x + cos(radians(i)) * (seg_length + 35), origin_y + sin(radians(i)) * (seg_length + 35), sm_size_3/1.25, sm_size_3/1.25);
            }
            
            sprob -= 0.06;
          } else {
            sprob += 0.01;
          }
        
      }
      
      nz += 0.010375;
    }
    
    //middle circle - make donut
    
    //TODO ::: Change simple circle to loop through point connected by arcs/curves to make the middle circle random
    
    noStroke();
    fill(255,255,255,10);   //TODO:: Alpha makes this busy
      ellipse(origin_x, origin_y, init_radius/2.5, init_radius/2.5);
     stroke(255,255,255);
     
    // // Create an array to store vectors of inner circ points
    //  PVector[] vectors = new PVector[36];
     
    // for(int p = 0; p < 36; p++) {
    //   vectors[p] = new PVector();
    //   vectors[p].x = origin_x + cos(radians(p*10)) * init_radius / randomGaussian() + 5;
    //   vectors[p].y = origin_x + sin(radians(p*10)) * init_radius / randomGaussian() + 5;
    // }
     
    // fill(255,255,255);
    // noStroke();
    // beginShape();
    // curveVertex(vectors[0].x, vectors[0].y); // the first control point
    // for (int r = 0; r < vectors.length; r ++) {
    //    curveVertex(vectors[r].x, vectors[r].y); // the first control point
    // }
    // curveVertex(vectors[35].x, vectors[35].y); // the first control point
    //endShape();

     
     // circles to segment the spokes
        //   noFill();
        //   for(int j = 0; j <= 3; j += 1) {
        //     ellipse(origin_x, origin_y, j*45, j*45);
        //   }
}

void keyPressed() {
  
   String s = String.valueOf(second());
   String m = String.valueOf(minute());
   String h = String.valueOf(hour());
   String d = String.valueOf(day());
   String mth = String.valueOf(month());
   String y = String.valueOf(year());
   
   String dte = "sp_and_dt" + y+mth+d+h+m+s + ".tiff";
   
   save(dte); 
}