import processing.pdf.*;
String fname; 

fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/growing_v3_%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());

beginRecord(PDF, fname);
size(1200,1200);
background(255);
strokeWeight(3);
smooth();

float start_radius=15;
int centX = width/2;
int centY = height/2;

//centre of circle
PVector plt_cent = new PVector();
plt_cent.set(centX, centY);

int step_size = 5;
int num_pts_init = 360 / step_size;
float nval = 0.03;

stroke(0,30,0);
strokeWeight(3);
noFill();


PVector[] init_pts = new PVector[num_pts_init];
//println(init_pts);
//println(num_pts_init);

//initial circle
for(int i = 0; i < num_pts_init; i++) {
  //println(i);
  float ang = step_size * i;
  float rad = radians(ang);
  float jiggle = noise(nval) * (start_radius/2);
  //println(init_pts[i]);
  //println(centX + ((start_radius+jiggle) * cos(rad)));
    init_pts[i] = new PVector();
    init_pts[i].set(centX + ((start_radius+jiggle) * cos(rad)), centY + ((start_radius+jiggle) * sin(rad)));
    point(init_pts[i].x,init_pts[i].y);
  nval += 0.08;  
}

beginShape();
for(int i = 0; i < num_pts_init; i++) {
  vertex(init_pts[i].x, init_pts[i].y);
}
endShape(CLOSE);

// subsequent circles
int num_circles = 35;

PVector circles[][] = new PVector[num_pts_init][num_circles];
PVector curr_circ[] = new PVector[num_pts_init];

//set current circle to first circle
arrayCopy(init_pts, curr_circ);
//println(init_pts[2].x, " : ", curr_circ[2].x);

//int y = 0;
for(int y = 0; y < num_circles; y++) {
  int num_pts = num_pts_init; // start with same pts as inner circle -- change this - bigger circles should have more points
  for(int x = 0; x < num_pts; x++) {
    //float jiggle = 0;
    int base_step = 7;  //distance circles are apart
    
    float ang = step_size * x;
    float rad = radians(ang);
    float jiggle = noise(nval) * (start_radius/10) * base_step;
    
    circles[x][y] = new PVector();   //new array of circle points (x) circle (y)
    
    //find radius of current point
    float dist = (curr_circ[x].dist(plt_cent));
    
    circles[x][y].set(centX + ((dist+jiggle+base_step) * cos(rad)), centY + ((dist+jiggle+base_step) * sin(rad)));
    //point(circles[x][y].x,circles[x][y].y);
    nval += 200.08;
    
    curr_circ[x].set(circles[x][y].x, circles[x][y].y);
  }
  
   //connect points     
      beginShape();
      
      color c1 = color(random(255),random(255),random(255));
      stroke(c1);
      vertex(curr_circ[0].x, curr_circ[0].y);
      for(int i = 1; i < num_pts_init; i++) {
        strokeWeight(random(4));
        color c2 = c1 + (int)(randomGaussian() * 5);
        stroke(c2);
        curveVertex(curr_circ[i].x, curr_circ[i].y);
        c1 = c2;
      }
      endShape(CLOSE);

}

//void keyPressed() {
  //save("test1.png");
  endRecord();
  exit();
//}

//


//ellipse(centX,centY,radius*2,radius*2);

//stroke(20,50,70);
//float x,y;
//float lastx = centX + (start_radius * cos(0));
//float lasty = centY + (start_radius * sin(0));
//float nval = random(10);

//for(float radius=start_radius; radius < (width/2-10); radius+=10) { 
//  for(float ang = 0; ang <= 360; ang += 5) {
//    float rad = radians(ang);
//    float jiggle = noise(nval) * (radius/10);
//    x = centX + ((radius+jiggle) * cos(rad));
//    y = centY + ((radius+jiggle) * sin(rad));
//    point(x,y);
//    line(lastx,lasty,x,y);
//    lastx = x;
//    lasty = y;
//    stroke(20);
//    nval += 0.8;
//  }
//}