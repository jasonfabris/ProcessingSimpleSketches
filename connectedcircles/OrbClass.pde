      
      class N_Orb {
      
        int step = 5;
        int numpts = 360 / step;
        int sz = 10;
        int radius = 150;
        int idx = 0;
        PVector[] pts = new PVector[numpts];
        int x_center;
        int y_center;
        
        N_Orb(int xpos, int ypos, int rad) {
          
          radius = rad;
          x_center = xpos;
          y_center = ypos;
          
          stroke(180, 25, 215, 70);
          
          for(int i = 0; i < 360; i += step) {  
              float dx = sin(radians(i)) * (radius + (randomGaussian() * radius/20));
              float dy = cos(radians(i)) * (radius + (randomGaussian() * radius/20));
              //pts = (PVector[])append(pts, new PVector(dx, dy));
              pts[idx] = new PVector(dx, dy);
              idx += 1;        
              //printArray(pts);
          }
        }
        
        void draw_orb() {   
          pushMatrix();
            translate(x_center, y_center); 
            for(int i = 0; i < pts.length; i++) {
               ellipse(pts[i].x, pts[i].y, sz, sz);
        
                int rnd_target = (int)random(pts.length);
                line(pts[i].x, pts[i].y, pts[rnd_target].x, pts[rnd_target].y);
                ellipse(pts[rnd_target].x, pts[rnd_target].y, sz, sz);
              }
          popMatrix();
        }
}
      