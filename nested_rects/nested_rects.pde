
ArrayList<Rect_Split> rects = new ArrayList<Rect_Split>();

void setup() {
  size(1000,1000);
  frameRate(5);
  background(255,250,255);  
}

void draw() {
  //background(225,200,225);  
  int x = int(random(width/2));
  int y = int(random(height/2));
  
  int a = x + int(random(width));
  int b = y + int(random(height));
  
  a = min(a, width);
  b = min(b, height);
  
  color c = color(25,225,25,10);
  rects.clear();
  
  Rect_Split r = new Rect_Split(x,y,a,b,c);
  //rects.add(r);
   println("orig: x", x, "y", y, "a", a, "b", b);
  println("init size:",rects.size()); 
  //r.draw_rect();
  println("rects - size 1:", rects.size());
  r.split_rect(rects);
  
  println("rects - size 2:", rects.size());
  
  if(rects.size() > 1) {
    for(int i = 0; i < rects.size(); i++) {
      println("Loop:", i, rects.size());
      Rect_Split n = rects.get(i);
      println(n.tl.x);
      n.draw_rect();
      n.points_rec(17, .2);
      //rects.remove(i);
    }
  }

}