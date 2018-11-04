

    PVector loc_force(Particle p, float time, boolean switch_flag) {
      PVector f = p.loc.copy();
      
      PVector c = new PVector(width/2, height/2);
      //c.x += sin(time)*100;
      //c.y += sin(time)*100;
      f = c.sub(f);
      f.mult(p.mass);
      
      float dist = f.mag();
      //f.normalize();
      //f.mult(1/dist);
      
      // -----------------------
      //f.x = (f.x / (width / 1.5)) * TWO_PI;
      //f.y = (f.y / (height / 1.5)) * TWO_PI;
      
      //time = (time % 3);
      //time = sin(radians(time*360));
                  
      //f.x = sin(f.x); // / sin(f.x + time);
      //f.y = sin(f.y); //* cos(f.y + time);
      //f.normalize();
      //f.x = map(f.x, 0, 1, -3, 3);
      //f.y = map(f.y, 0, 1, -3, 3);
      // ------------------------------
     // println(switch_flag);
      if(switch_flag) { 
        f.mult(-4);
        if(random(1) < 0.25) {
          f = p.pt_origin.sub(c);
          //f = c.sub(p.pt_origin);
          
          //f.mult(-1);
        }
      }
      
      return f;
    }

void keyPressed() {
  if (key == 's') {
    saveFrame("C:/Users/Jason/Documents/Processing Projects/Output/flow5-######.tiff");
  }
}

PVector init_loc;
PVector init_vel = new PVector(0,0);

ArrayList<Particle> pts;
float n = 0.01;
  float n_inc = 0.03;
 boolean switch_time;
int num_pts = 550;

void setup() {
    size(1400,700);
    background(255);
    pts  = new ArrayList<Particle>();
    
    for(int i = 0; i < num_pts; i++) {
      init_loc = new PVector();
      init_loc.x = random(width);
      init_loc.y = random(height);
      
      float frac = (float(i+1)) / (float(num_pts));
      init_loc.x = width/2 + cos(radians(360 * (frac + random(0,.04)))) * (width / 4);
      init_loc.y = height / 2 + sin(radians(360 * (frac + random(0,.04)))) * (height / 2);
      //println(i, init_loc.x, init_loc.y);
      
      //ellipse(init_loc.x, init_loc.y, 20, 20);
      
      pts.add(new Particle(init_loc, init_vel, randomGaussian() * 10 + 30 ));
    }
}//setup

void draw() {
  //background(255);
  
  if(frameCount % 120 == 0) {
         switch_time = !switch_time ;
       }
      //println(frameCount, " ", frameCount % 40, " : ", switch_time);
  
  
  for(Particle p: pts) {
    
      // get noise
      PVector nz_frc = new PVector(noise(n), noise(n + 10000));
      nz_frc.normalize();
      //println(nz_frc.x, nz_frc.y);
      nz_frc.x = map(nz_frc.x, 0, 1, -35, 35);
      nz_frc.y = map(nz_frc.y, 0, 1, -35, 35);
      //nz_frc.mult(2);
      
       
       
           // go to centre or head back
           //if(random(1) < .8) {
             p.apply_force(loc_force(p, frameCount, switch_time));
            //} 
           p.apply_force(nz_frc);
           p.check_edges();
           p.update();
           //println(frameCount, p.loc.x, p.loc.y);
         
           p.display();
  }
  n += n_inc;
  
}