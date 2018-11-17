
ArrayList<Tracer> pts;
ArrayList<Magnet> mags;

String fname; 

int num_pts = 1700;
int num_mags = 2;

void setup() {

 fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/left_right_mags_v1_%d%d%d%d%d.tiff", year(), month(), day(), hour(), minute(), second());

 size(1800,1800);
 background(252,250,255);
   
   pts  = new ArrayList<Tracer>();
   for(int i = 0; i < num_pts; i++) {
      float y = random(height); 
      if(random(1) < 0.7) {
        pts.add(new Tracer(new PVector(0, y)));
      } else {
        pts.add(new Tracer(new PVector(width, y)));
      }  
   }
   
   mags = new ArrayList<Magnet>();
   for(int i = 0; i < (num_mags); i++) {
     //random locs
     //float y = random(height);
     // float x = random(width);
     float r = map(i, 0, num_mags, 0, 360);    
       float x = width/2 + (cos(radians(r)) * (width/2.2));
       float y = height/2 + (sin(radians(r)) * (height/2.2));
     
     
      mags.add(new Magnet(new PVector(x, y), random(30, 290.0)));
      
   }
   
   for(int i = 0; i < (num_mags / 2); i++) {
     float r = map(i, 0, num_mags/2, 0, 360);    
       float x = width/2 + (cos(radians(r)) * (width/1.5));
       float y = height/2 + (sin(radians(r)) * (height/1.5));
        
      mags.add(new Magnet(new PVector(x, y), random(10, 50.0)));
      
   }
   
     mags.add(new Magnet(new PVector(random(width - 50), random(height - 50)), 350.0));
     mags.add(new Magnet(new PVector(random(150), random(150)), random(100.0, 200.0)));
     mags.add(new Magnet(new PVector(random(width), random(height)), random(800.0)));
     mags.add(new Magnet(new PVector(width/2, height/2), 180.0));

    //for(Magnet m: mags) {
    //   m.display(); 
    //   println("mags: ", mags.size());
    //}  
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
    
    
      p.check_edge();
    p.update();
    p.display();
  }
}

void keyPressed() {
  if(key == 's') {
    save(fname);
  }
}