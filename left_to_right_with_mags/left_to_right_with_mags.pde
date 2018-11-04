
ArrayList<Tracer> pts;
ArrayList<Magnet> mags;

int num_pts = 1200;
int num_mags = 5;

void setup() {
 size(1400,1800);
 background(252,252,255);
   
   pts  = new ArrayList<Tracer>();
   for(int i = 0; i < num_pts; i++) {
      float y = random(height); 
      pts.add(new Tracer(new PVector(0, y)));
   }
   
   mags = new ArrayList<Magnet>();
   for(int i = 0; i < num_mags; i++) {
     //random locs
     //float y = random(height);
     // float x = random(width);
     float r = map(i, 0, num_mags, 0, 360);    
       float x = width/2 + (cos(radians(r)) * (width/3));
       float y = height/2 + (sin(radians(r)) * (height/3));
     
     
      mags.add(new Magnet(new PVector(x, y), random(30, 190.0)));
      
   }
 
}

void draw() {
  
  for(Magnet m: mags) {
  //m.display(); 
  }
  
  PVector frc1 = new PVector();
  frc1.x = random(0.05);
  frc1.y = 0;
  
  for (Tracer p: pts) {
    
    p.apply_force(frc1);
    
    for(Magnet m: mags) {
      p.apply_force(m.attract(p));
    }
    
    p.update();
    p.display();
  }
}