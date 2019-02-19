
PVector f_grav;

ArrayList<Particle> partics = new ArrayList<Particle>();
ArrayList<Attr> attrs = new ArrayList<Attr>();

Repeller r;
Repeller s;
Repeller t;

void setup() {
  
  size(1000,1000);
  
  colorMode(HSB, 360, 100, 100, 100);
  
  background(200,10,90);
  
  //f_grav = new PVector(0,-.06);
  
  for (int x = 0; x < width; x += 8) {
    for(int y = 0; y < height; y += 8) {
      Particle p = new Particle(new PVector(x,y));
      partics.add(p);
    }
  }
  
  //attractors
  for(int i = 0; i < 360; i += 27) {
     float x = (width / 2) + random(-10, 10) + cos(radians(i)) * (width / 3);
     float y = (height / 2) + random(-10, 10) + sin(radians(i)) * (height / 3);
     
     Attr a = new Attr(new PVector(x, y), random(.05,3.5));
     attrs.add(a);
     //a.display();
     //println(a.loc.x, a.loc.x, a.strength);
  }
  
  //repeller
  r = new Repeller(new PVector(width/2, height/2), random(1.75, 2.5));
  s = new Repeller(new PVector(random(width/2) + width/2, random(height/2) + width/2), random(0.75,3.5));
  t = new Repeller(new PVector(random(width/2) + width/2, random(height/2) + width/2), random(5.75,10.5));
  
}

void draw() {
  background(200,10,90);
  //println(partics.size());
  for(Particle p : partics) {
     
    //p.apply_force(f_grav);
    
    for(Attr a : attrs) {
       a.attract(p); 
    }
    
    r.repel(p);
    s.repel(p);
    t.repel(p);
    
    
    p.update();
    p.wander();
    p.display();
   
   //add a new attractor
   //if(frameCount % 600 == 0) {
   // Attr a = new Attr(new PVector(random(width), random(height)), random(0,1));
   //  attrs.add(a);  
   //}
     
   //move a random attractor
   if(frameCount % 60 == 0) {
     Attr a = attrs.get(int(random(attrs.size())));
     a.move(new PVector(a.loc.x + (randomGaussian()*4), a.loc.y + (randomGaussian()*4)));
     //a.display();
     //println(a.loc.x, a.loc.y);
   }
   
   
  }
  
  

}