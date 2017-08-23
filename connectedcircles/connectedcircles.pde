
      size(1000,1000);
      background(245,245,245);
      strokeWeight(5);
      //stroke(0,0,0,200);
      stroke(180, 25, 215, 70);

      int step = 2;
      int numpts = 360 / step;
      int sz = 10;
      int radius = 250;
      int idx = 0;
      PVector[] pts = new PVector[numpts];
      
      
      for(int i = 0; i < 360; i += step) {
        
        float dx = sin(radians(i)) * (radius + (randomGaussian() * radius/25));
        float dy = cos(radians(i)) * (radius + (randomGaussian() * radius/25));
        //pts = (PVector[])append(pts, new PVector(dx, dy));
        pts[idx] = new PVector(dx, dy);
        idx += 1;        
        printArray(pts);
      }
    
    //println(pts[0].x);
    // draw points
    
    translate(height/2, width/2); 
    for(int i = 0; i < pts.length; i++) {
      ellipse(pts[i].x, pts[i].y, sz, sz);
      
      int rnd_target = (int)random(pts.length);
      line(pts[i].x, pts[i].y, pts[rnd_target].x, pts[rnd_target].y);
      ellipse(pts[rnd_target].x, pts[rnd_target].y, sz, sz);
    }
    