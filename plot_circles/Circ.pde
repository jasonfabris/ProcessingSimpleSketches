

class Circ {

  
ArrayList<PVector> pts_list;
float x;
float y;
float r;
float base_rad;
  
  
  public Circ(int _num_pts, float _base_radius, int scale_fact) {
    base_rad = _base_radius;
    pts_list = new ArrayList<PVector>();
    int a_start = (int)random(360);
    int a_end = a_start + 360;
    for(int a = a_start; a < a_end; a += (360/_num_pts)) {
      println(a);
      r = base_rad + (randomGaussian() * (5 * (0.5+scale_fact)) + (base_r/10));
          float angle = radians(a + random(-2, 2));
           x = cos(angle) * r;
           y = sin(angle) * r;
           PVector pt = new PVector(x,y);
           pts_list.add(pt);
        } 
        //Collections.shuffle(pts_list);
   } //constructor
   
   ArrayList<PVector> get_pts() {
     println("First: ", pts_list.get(2).x, pts_list.get(2).y); 
     return(pts_list); 
   }
   
   void draw_circ(color _c) {
    noFill(); 
    stroke(_c);
    //println("shp", i);
    pushMatrix();
      beginShape();
        for (PVector p : pts_list) {
          //ellipse(p.x, p.y, i*2, i*2);
          curveVertex(p.x, p.y); //println(i, p.x, p.y);
        }
      endShape(CLOSE);
    popMatrix();
   }
   
   
   
   
}//Circ
