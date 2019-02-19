

float ang_vel = 1;
PVector old_pt;

void setup() {
    size(800,800);
    background(250);
}

void draw() {
  background(245);
    for(int i = 0; i < 20; i+= 1) {
       for(int j = 0; j < 20; j+= 1) {
         
         float x_ang = map(j, 0, 20, 0, 360);
         float y_ang = map(i, 0, 20, 0, 360);
       
        // println(i,j,"sin: ", sin(radians(y_ang + ang_vel)), "  cos: ", cos(radians(x_ang + ang_vel)));
         
         PVector fld = new PVector(cos(radians(x_ang * ang_vel)), sin(radians(y_ang * ang_vel)));
         fld.mult(200);
         
         
         pushMatrix();
             translate(width/2, height/2);
             rotate(radians(ang_vel));
             float r = map(fld.x, 0, 200, 0, 360);
             float g = map(fld.x, 0, 200, 0, 36);
             float b = map(fld.y, 0, 200, 0, 360);
             strokeWeight(6);
             //stroke(r, g, b, 250);
             noStroke();
             fill(r,g,b, 200);
             //line(0, 0, fld.x, fld.y);
             ellipse(fld.x, fld.y, 5, 5);
             
             for(int x = 0; x <10; x++) {
               ellipse(fld.x, fld.y, random(50), random(50));
             }
             
        //     println(fld.x, fld.y);
         popMatrix();
         old_pt = fld.copy();
       }
    }
    ang_vel += .01 * random(0,1);
    //println("AV: ", ang_vel);
}