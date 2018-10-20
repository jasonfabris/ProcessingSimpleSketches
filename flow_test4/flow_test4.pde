

    PVector loc_force(PVector loc, float time, boolean switch_flag) {
      PVector f = loc.copy();
      
      f.x = (f.x / (width / 1.5)) * TWO_PI;
      f.y = (f.y / (height / 1.5)) * TWO_PI;
      
     
      
      time = (time % 3);
      time = sin(radians(time*360));
                  
      f.x = sin(f.x); // / sin(f.x + time);
      f.y = sin(f.y); //* cos(f.y + time);
      f.normalize();
      f.x = map(f.x, 0, 1, -3, 3);
      f.y = map(f.y, 0, 1, -3, 3);
      
      if(switch_flag) { 
        f.mult(-1);
        println("switch!");
      }
      
      //println(frameCount, f.x, f.y, time, switch_flag, " a");
      
      return f;
    }

void keyPressed() {
  if (key == 's') {
    saveFrame("C:/Users/Jason/Documents/Processing Projects/flow-######.tiff");
  }
}

PVector init_loc;
PVector init_vel = new PVector(0,0);

ArrayList<Particle> pts;
float n = 0.501;
  float n_inc = 0.101;
 boolean switch_time;
int num_pts = 8;

void setup() {
    size(900,900);
    background(255);
    pts  = new ArrayList<Particle>();
    
    for(int i = 0; i < num_pts; i++) {
      init_loc = new PVector();
      init_loc.x = random(width);
      init_loc.y = random(height);
      pts.add(new Particle(init_loc, init_vel, random(80)));
    }
}//setup

void draw() {
  
  for(Particle p: pts) {
    
      // get noise
      PVector nz_frc = new PVector(noise(n), noise(n + 10000));
      nz_frc.normalize();
      nz_frc.x = map(nz_frc.x, 0, 1, -1, 1);
      nz_frc.y = map(nz_frc.y, 0, 1, -1, 1);
      nz_frc.mult(2);
      
       
       if(frameCount %7 == 0) {
         switch_time = !switch_time ;
       }
      
           p.apply_force(loc_force(p.loc, frameCount, switch_time));
           p.apply_force(nz_frc);
           p.check_edges();
           p.update();
           //println(frameCount, p.loc.x, p.loc.y);
         
           p.display();
  }
  n += n_inc;
}