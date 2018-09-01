
import processing.pdf.*;
String fname;
int star_count = 800;
int constell_count = round(random(16)) ;

void setup() {

  size(1200,1200);
  //fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/const_accident_%d%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());
  //beginRecord(PDF, fname);
}

void draw() {
  PVector[] star_locs = new PVector[star_count];

  for(int i = 0; i < star_count; i++) {
     star_locs[i] = new PVector(random(width),random(height)); 
  }

  background(0,0,20);
  for (int i = 0; i < star_count; i++) {
    //stroke(240,240,255);
    noStroke();
    fill(240, 240, 255, random(150));
    float star_size = random(8);
    ellipse(star_locs[i].x, star_locs[i].y, star_size, star_size);
  }

  for (int n = 0; n < constell_count; n++) {
    //select start star
    int idx = (int)random(star_count);
    float neighbour_count = random(3);
    
    //This is the star at the start of the constellation
    //float star_size = random(100);
    //ellipse(star_locs[idx].x, star_locs[idx].y,star_size, star_size);
  
    for(int j = 0; j < neighbour_count; j++) {
    
    //find a neighbour
    int neighbour = find_neighbour(idx, 200, star_locs, 5);
    //ellipse(star_locs[neighbour].x,star_locs[neighbour].y,50,50);
    
    for(int q = 0; q < star_count; q++) {
      // check distance
      println(star_locs[idx].dist(star_locs[q]));
      int n_idx = (int)random(star_count);
      strokeWeight(.5);
      stroke(240,240,255,200);
      //line(star_locs[idx].x, star_locs[idx].y, 
      //        star_locs[n_idx].x, star_locs[n_idx].y);
     }
  } //j
  
  } //n

  noLoop();
//endRecord();
//exit();
}

int find_neighbour(int star_num, float max_dist, PVector[] star_locs, int levels) {
    boolean found_one = false;
    float dist;
    int neighbour_idx = 0;
    
    while (found_one == false) {
         int n_idx = (int)random(star_count);
         println(n_idx);
          dist = star_locs[star_num].dist(star_locs[n_idx]);
          if(dist < max_dist) {
            neighbour_idx = n_idx;
            found_one = true;
          }
      }
      if(levels > 0) {
        levels = levels - 1;
        //draw line, recurse the function
        line(star_locs[star_num].x, star_locs[star_num].y, 
                star_locs[neighbour_idx].x, star_locs[neighbour_idx].y);
        find_neighbour(neighbour_idx, 200, star_locs, levels);
      }
      
      return neighbour_idx;
  } //find_neighbour