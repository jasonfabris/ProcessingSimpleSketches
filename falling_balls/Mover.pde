
class Mover {
  
  PVector vel;
  PVector loc;
  PVector acc;
  float mass;
  float[] friends;
  
  
  Mover(float init_x, float init_y, float init_mass, int num_friends) {
    loc = new PVector(init_x, init_y);
    mass = init_mass;
    friends = new float[num_friends];
    
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    
  }
  
   
  void update_loc() {
    vel.add(acc);
    loc.add(vel);
    
    acc.mult(0); //reset accel
  
  }
  
  void apply_frc(PVector frc) {
    PVector f = PVector.div(frc, mass);
    acc.add(f);
  }
  
  void display() {
    int size = (int)random(130);
    noFill();
    ellipse(loc.x, loc.y, size, size);
  }
 
  void check_edges() {
    if (loc.x > width) {
      loc.x = width;
      vel.x *= -1;
    } else if (loc.x < 0) {
      loc.x = 0;
      vel.x *= -1;
    }
    
    if (loc.y > height) {
      if(random(1) < .8) {
        vel.y = 0; //stay on bottom
        friends = new float[0]; // lose all your friends
      } else {
        vel.y = -.2;
      }  
    }
    
    if (loc.y < 1) {
      vel.y *= -1;
    }
    
  } //check_edges

  void make_friends(int self_id, int pop_count) {
  //pass in # of people out there pick length of friends array
    for (int i = 0; i < friends.length; i++) {
      int f = (int)random(pop_count);
      if (f != i) {
        friends[i] = f;
      }
    }
  }
  
  void connect_friend(Mover friend) {
    stroke(random(60), random(150), random(200), random(100));
    strokeWeight(.8);
    line(loc.x, loc.y, friend.loc.x, friend.loc.y);
  }
  
  PVector attract(Mover m) {
    float G = random(0,6);
    PVector force = PVector.sub(loc, m.loc);
    float distance = force.mag();
    distance = constrain(distance, 2, 150);
    force.normalize();
    
    float strength =  ((G * mass * m.mass) / (distance * distance));
    force.mult(strength);
    return(force);
    
  }
}