
float nz_sd_x = 5;
float nz_sd_y = 5000;
float nz_inc_x = 0.01;
float nz_inc_y = 0.065;

ArrayList<Shp> shps = new ArrayList<Shp>();

void setup() {
  size(1100,1100);
  colorMode(HSB, 360,100,100,100);
  background(197, 80, 70);

    
  for(int i = 0; i < 60; i++) {
    float r= random(width/1.2); 
     shps.add( new Shp(0., 0., r, 327., 100., 100., random(20., 55.)) ); 
  }
  
  frameRate(10);

}

void draw() {
  background(197, 100, 70);
  float x = width/2;
    float y = height/2;

  for (Shp shp : shps) {
    float rnd_adj = noise(nz_sd_x, nz_sd_y);
    rnd_adj = map(rnd_adj, 0, 1, -1, 1);
  
      shp.display(rnd_adj);
    
    nz_sd_x += nz_inc_x;
    nz_sd_y += nz_inc_y;
  }
  
  //fade
  for (int i = shps.size() - 1; i >= 0; i--) {
    Shp shp = shps.get(i);
    shp.fade();
    println("Alpha: ", shp.al);
    if (shp.al < 5) {
      shps.remove(i);    //replace with new circle
      shps.add( new Shp(0., 0., random(width/1.2), random(290, 355), 100., 100., random(20., 55.)) ); 
    }
  }
    
}//end

class Shp {
  float x;
  float y;
  float sz;
  
  float h;
  float s;
  float b;
  float al;
  
  float rnd_adj;
  
  Shp(float x_, float y_, float sz_, float h_, float s_, float b_, float al_) {
    x = x_;
    y = y_;
    sz = sz_;
    h = h_;
    s = s_;
    b = b_;
    al = al_;
    
  }
  
  void display(float rnd_fct) {
      rnd_adj = rnd_fct;
      pushMatrix();
        translate(width/2 + rnd_adj*50, height/2 + rnd_adj*50);
        rotate(random(-10,10));
        noFill();
 
        stroke(h,s,b,al);
        strokeWeight(0.75);
        ellipse(x, y, sz, sz); 
        println(x,y,sz,sz);
      popMatrix();
  }
  
  void fade() {
     al = al * 0.9;
     stroke(h,s,b,al);
     display(rnd_adj);
  }
  
}