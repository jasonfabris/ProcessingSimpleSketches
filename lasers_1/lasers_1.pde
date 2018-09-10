
int num_lines = 60;

ArrayList<Gparticle> particles = new ArrayList<Gparticle>();
PVector gforce;
PVector wall_force;
PVector friction;
float wall_dist;

void setup() {
    size(800, 800);
    
    float start_rng_width = height / num_lines;
    
    for(int i = 0; i < num_lines; i++) {
         
      float start_x = random(0, width/4);
      float line_y = random(start_rng_width * i, start_rng_width * i + i);
      //line(start_x, line_y, width, line_y); 
      particles.add(new Gparticle(start_x, line_y, random(80)));
      
    }
    
    
    //vel
    gforce = new PVector(.25,0);
    
    //right wall
    wall_force = new PVector(-10,0);
    
    friction = new PVector(0.01, 0);
    
    
}

void draw() {
    //println(particles.size());
    background(25);
    
    for (Gparticle part : particles) {
        PVector g = gforce.copy();
        g.mult(randomGaussian());
        part.apply_force(gforce);
        
        part.apply_force(friction);
      
        wall_dist = width - part.loc.x;
        PVector wforce = wall_force.copy();
        wforce.div(wall_dist);
        //println("1: ", wall_dist, wall_force.x, wall_force.y);
        
       
          //wforce.div(wall_dist * wall_dist);
          //println("2: ", wall_dist, wforce.x, wforce.y);
         part.apply_force(wforce);
          //println("3: ", wall_dist, "WF: ", wforce.x, wforce.y, " : ", gforce.x, gforce.y, part.vel.x, part.vel.y, "L: ", part.loc.x, part.loc.y);
          
          part.update();
          part.display();
       
    }
  
  
}
  