
class Wander {
 
  PVector loc;
  PVector acc;
  PVector vel;
  PVector old_loc;
  
  int wsize; 
  
  float max_speed;
  float min_speed;
  float nz_valx;
  float nz_valy;
  float nz_magx;
  float nz_magy;
  
  Wander(float cmin_speed, float cmax_speed, float cnz_magx, float cnz_magy) {
    loc = new PVector(round(random(width)), height/2);
    old_loc = new PVector(loc.x, loc.y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    max_speed = cmax_speed;
    min_speed = cmin_speed;
    wsize = round(random(10));
    nz_magx = cnz_magx;
    nz_magy = cnz_magy;
  }
  
  void wander() {
    
    //println("1: ", old_loc, " : ", loc, " : ", " ::: ");
    old_loc.set(loc);
    
    //nz_val = map(noise(nz_mag), 0, 1, -1, 1);
    
    nz_valx = map(noise(nz_magx), 0, 1, -1.5, 1.5);
    nz_valy = map(noise(nz_magy), 0, 1, -1.5, 1.5);
    
    acc.x = nz_valx  + acc.x;
    acc.y = nz_valy + acc.y; // + acc.y;
    
    println(" --nzval ", nz_valx , " --nzval ", nz_valy , " ---ax ", acc.x, " ---ay ", acc.y, " ---vx ", vel.x, " ---vy ", vel.y);
    
    acc.limit(3);
    
    //acc = PVector.random2D();    
    //acc.mult(random(1.5));
    
    int closest = find_nearest();
    
    println(closest, wanderers[closest].loc);
    
       
    check_speed();
    vel.add(acc);
    
    loc.add(vel);
    
    loc.sub((wanderers[closest].loc).div(4));
    
    check_edges();
    check_collision();
  }

  void check_speed() {
    if(vel.x >= max_speed) {
      vel.set(max_speed,vel.y);
    }
    
    if(vel.x < min_speed) {
      vel.set(0, vel.y);
    }
    
    if(vel.y >= max_speed) {
      vel.set(vel.x,max_speed);
    }
  
    if(vel.y < min_speed) {
      vel.set(vel.x,0);
    }
  }

  void display() {
    stroke(125,125,125, 200);
    strokeWeight(1);
    noFill();
    //ellipse(loc.x, loc.y, wsize, wsize);
    line(old_loc.x, old_loc.y, loc.x, loc.y);
  }

  void check_edges() {

    if (loc.x > width) {
      loc.x = width;
      vel.x = vel.x * -1.5;
      vel.y = vel.y * -1;
    }
    
    if (loc.x < 0) {
      loc.x = 0;
      vel.x = vel.x * -1.5;
      vel.y = vel.y * -1;
    }

    if (loc.y > height) {
      loc.y = height;
      vel.y = vel.y * -1.5;
      vel.x = vel.x * -1;
    } 
    else if (loc.y < 0) {
      loc.y = 0;
      vel.y = vel.y * -1.5;
      vel.x = vel.x * -1;
    }
  }

  int find_nearest() {
    float[] dists = new float[wanderers.length];
    float prox_last = 1000;
    float prox = 0;
    float smallest;
    int closest = 0;
    
    for (int i=0; i < (wanderers.length)-1; i++) {
      Wander other_wand = wanderers[i];
      if(other_wand != this) {
        dists[i] = dist(loc.x, loc.y, other_wand.loc.x, other_wand.loc.y);
      }
      
      smallest = min(dists);
      
      for(int n=0; n < wanderers.length; n++) {
        if(dists[n] == smallest) {
          closest = n;
        }
      }
      
    }
    return closest;
  }

  void check_collision() {
    boolean nearby = false;
    for (int i=0; i < wanderers.length; i++) {
      Wander other_wand = wanderers[i];
      if(other_wand != this) {
        float prox = dist(loc.x, loc.y, other_wand.loc.x, other_wand.loc.y);
        //println(prox);
        
        if(prox - wsize - other_wand.wsize < 0) {
          stroke(100,0,0,100);
          strokeWeight(.5);
          ellipse(loc.x, loc.y, vel.x*10, vel.x*10);
          ellipse(loc.x, loc.y, vel.x*10+5, vel.x*10+5);
          ellipse(loc.x, loc.y, vel.x*10+10, vel.x*10+10);
          
          acc.x *= -1.5;
          acc.y *= -1.5;
        }
        
        //slow down!
        if(prox-wsize - other_wand.wsize < 3) {
          //change direction and accelerate
          acc = acc.mult(2);
          PVector new_dir;
          new_dir = new PVector(round(randomGaussian()*5), round(randomGaussian()*5));
          vel = vel.add(new_dir);
        }
               
      }
    }
  }

}