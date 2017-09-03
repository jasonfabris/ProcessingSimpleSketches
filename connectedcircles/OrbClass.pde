      
      class N_Orb {
      
        int step;
        int numpts;
        int sz = 10;
        int idx = 0;
        PVector[] pts;
        int x_center;
        int y_center;
        int radius;
        
        N_Orb(int xpos, int ypos, int rad, int steps) {
          
          radius = rad;
          x_center = xpos;
          y_center = ypos;
          
          step = steps;
          numpts = int(360 / step);
          pts = new PVector[numpts];
          
          stroke(180, 25, 215, 70);
          strokeWeight(.75);
          noFill();
          
          println(step, " ", numpts, " ", pts.length);
                    
          for(int i = 0; i+step <= 360; i += step) {
            
              float wobble = random(step/1.33);
              float dx = sin(radians(i + wobble)) * (radius + (randomGaussian() * radius/20));
              float dy = cos(radians(i + wobble)) * (radius + (randomGaussian() * radius/20));
              //pts = (PVector[])append(pts, new PVector(dx, dy));
              pts[idx] = new PVector(dx, dy);
              idx += 1;        
          }
          printArray(pts);
        }
        
        void draw_orb() {   
          pushMatrix();
            translate(x_center, y_center); 
            for(int i = 0; i < pts.length; i++) {
              
               ellipse(pts[i].x, pts[i].y, sz, sz);    
                int rnd_target = (int)random(pts.length);
                
                println(i, " : ", pts[i], " :: ", rnd_target, " : ", pts[rnd_target]);
                line(pts[i].x, pts[i].y, pts[rnd_target].x, pts[rnd_target].y);
                ellipse(pts[rnd_target].x, pts[rnd_target].y, sz, sz);
              }
          popMatrix();
        }
        
        void draw_orb_seq() {}
        
        //multiple connections from each node
        void draw_orb_mult(int max_cons) {
        pushMatrix();
            translate(x_center, y_center); 
            for(int i = 0; i < pts.length; i++) {
              
               ellipse(pts[i].x, pts[i].y, sz, sz);    
                
                int cons = (int)random(max_cons) + 1;
                for(int n = 0; n < cons; n++) {
                  int rnd_target = (int)random(pts.length);
                
                  //println(i, " : ", pts[i], " :: ", rnd_target, " : ", pts[rnd_target]);
                  line(pts[i].x, pts[i].y, pts[rnd_target].x, pts[rnd_target].y);
                  //ellipse(pts[rnd_target].x, pts[rnd_target].y, sz, sz);
                }
              }
          popMatrix();
        }
        
        void draw_orb_curves() {
        // need centre of circle?
        }
}
      