
class Rect_Split {

  PVector tl = new PVector();
  PVector br = new PVector();
  float w = 0;
  float h = 0;
  color c;
  
  //bias towards splitting vertically
  float vbias = .8; 
   
Rect_Split(float x1, float y1, float x2, float y2, color c1) {
  tl.x = x1;
  tl.y = y1;
  br.x = x2;
  br.y = y2;
  c = c1;
  
  w = br.x - tl.x;
  h = br.y - tl.y;
  println("w",w,"h",h);
}

//simple draw 
void draw_rect() {
  noStroke();
  fill(c);
  rect(tl.x,tl.y,w,h);
  println("simp: ",tl.x,tl.y, w, h, c);
}

//fill with points
//gap is space between, prob is chance a point appears
void points_rec(int gap, float prob) {
  //int size = (int)(w*h);
  //int[] points = new int[size];

  //for(int i = 0; i < size; i += gap) {
  //  if(random(1) < prob) {
      
  //  }
  // }
  noStroke();
  fill(25,25,255,10);
  fill(c);
  //println("C:",tl.x,w,tl.y,h,gap);
  for(float x = tl.x; x < (tl.x + w); x += gap) {
    for(float y = tl.y; y < (tl.y + h); y += gap) {
      //println(x,y);
      if(random(1) < prob) {
        ellipse(x,y,5.0,5.0);
      }
    }
  }
  
}

//split into two random rects
ArrayList split_rect(ArrayList<Rect_Split> rects) {
 
  //ArrayList<Rect_Split> rects = new ArrayList<Rect_Split>();
  
  PVector new_tl1 = new PVector();
  PVector new_br1 = new PVector();
  float new_w1 = 0;
  float new_h1 = 0;
  
  PVector new_tl2 = new PVector();
  PVector new_br2 = new PVector();
  float new_w2 = 0;
  float new_h2 = 0;
  
  Rect_Split new_r1;
  Rect_Split new_r2;
  
  println("orig-split", tl.x, tl.y, w, h);
  
 if (random(1) < vbias) {
   //split vertically 
   int split_pt = round(random(w));
   
   new_tl1.x = tl.x;
   new_tl1.y = tl.y;
   new_tl2.x = tl.x + split_pt;
   new_tl2.y = tl.y;
   new_br1.x = br.x - (w - split_pt);
   new_br1.y = br.y;
   new_br2.x = br.x;
   new_br2.y = br.y;
   
   new_w1 = new_br1.x - new_tl1.x;
   new_h1 = new_br1.y - new_tl1.y;
      
   println("vsplit", "tl1:", new_tl1.x, new_tl1.y, "br1:", new_br1.x, new_br1.y, new_w1, new_h1);
   println("vsplit", "tl2:", new_tl2.x, new_tl2.y, "br2:", new_br2.x, new_br2.y, new_w1, new_h1);
 } else {
   //split horizontally
   int split_pt = round(random(h));
   new_tl1.x = tl.x;
   new_tl1.y = tl.y;
   new_tl2.x = tl.x;
   new_tl2.y = tl.y + split_pt;
   new_br1.x = br.x;
   new_br1.y = br.y - (h - split_pt);
   new_br2.x = br.x;
   new_br2.y = br.y;   
   new_w1 = new_br1.x - new_tl1.x;
   new_h1 = new_br1.y - new_tl1.y;
   println("hsplit", "tl1:", new_tl1.x, new_tl1.y, "br1:", new_br1.x, new_br1.y, new_w1, new_h1);
   println("hsplit", "tl2:", new_tl2.x, new_tl2.y, "br2:", new_br2.x, new_br2.y, new_w1, new_h1);
 }
 
   new_r1  = new Rect_Split(new_tl1.x, new_tl1.y, new_br1.x, new_br1.y, color(255,0,55,5));
   new_r2 =  new Rect_Split(new_tl2.x, new_tl2.y, new_br2.x, new_br2.y, color(0,55,255,5));
 rects.add(new_r1);
 rects.add(new_r2);
 println("Post-split-size:", rects.size());
 //new_r1.draw_rect();
 //rect(new_tl1.x, new_tl1.y, new_w1, new_h1);
 //rect(new_r1.tl.x, new_r1.tl1.y, new_r1.br.x, new_r1.br.y);
 //println("n:",new_tl1.x,new_tl1.y,new_w1,new_h1);
 
 //exit condition
 if(new_w1 > 25 & new_h1 > 25) {
   split_rect(rects);
 } else {
   
 }
 return rects;
}

}//class