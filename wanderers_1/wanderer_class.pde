
class Wander {
 
  PVector loc;
  PVector acc;
  PVector vel;
  PVector old_loc;
  
  int wsize; 
  
  float max_speed;
  float nz_val;
  float nz_mag;
  
  Wander() {
    loc = new PVector(round(random(width/2)), height/2);
    old_loc = new PVector(loc.x, loc.y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    max_speed = random(3)+1;
    wsize = round(random(10));
    nz_mag = .01;
    nz_val = noise(nz_mag,nz_mag);
  }
  
  void wander() {
    //println(nz_val);
    old_loc.set(loc);
    println("1: ", old_loc, " : ", loc, " ::: ");
    
    
    //acc.x = noise(nz_mag) * acc.x + acc.x;
    //acc.y = noise(nz_mag) * acc.y + acc.y;
    
    acc = PVector.random2D();    
    acc.mult(random(2));
    
    nz_mag += .01;

    vel.add(acc);
    check_speed();
    
    loc.add(vel);
    check_edges();
    check_collision();
  }

  void check_speed() {
    if(vel.x >= max_speed || vel.y >= max_speed) {
      vel.set(0,0);
    }
    
  }

  void display() {
    stroke(125,125,125, random(50)+175);
    strokeWeight(.75);
    noFill();
    //ellipse(loc.x, loc.y, wsize, wsize);
    line(old_loc.x, old_loc.y, loc.x, loc.y);
  }

  void check_edges() {

    if (loc.x > width) {
      loc.x = width;
      vel.x = vel.x * -1;
    } 
    else if (loc.x < 0) {
      loc.x = width;
    }

    if (loc.y > height) {
      loc.y = 0;
      vel.y = vel.y * -1;
    } 
    else if (loc.y < 0) {
      loc.y = height;
    }
  }

  void check_collision() {
    boolean nearby = false;
    for (int i=0; i < wanderers.length; i++) {
      Wander other_wand = wanderers[i];
      if(other_wand != this) {
        float prox = dist(loc.x, loc.y, other_wand.loc.x, other_wand.loc.y);
        println(prox);
        
        if(prox - wsize - other_wand.wsize < 0) {
          stroke(0,0,0,100);
          strokeWeight(.5);
          ellipse(loc.x, loc.y, vel.x*10, vel.x*10);
        }
        
        //slow down!
        if(prox-wsize-other_wand.wsize < 5) {
          //change direction and decelerate
          acc = acc.div(2);
          PVector new_dir;
          new_dir = new PVector(round(randomGaussian()*5), round(randomGaussian()*5));
          vel = vel.add(new_dir);
        }
        
        
      }
    }
  }

}