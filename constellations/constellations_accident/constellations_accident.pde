import processing.pdf.*;

size(1200,1200);

String fname;
fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/const_accident_%d%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());

beginRecord(PDF, fname);

int star_count = 600;
int constell_count = (int)random(17);

PVector[] star_locs = new PVector[star_count];

for(int i = 0; i < star_count; i++) {
 star_locs[i] = new PVector(random(width),random(height)); 
}

background(0,0,20);

for (int i = 0; i < star_count; i++) {
  stroke(240,240,255);
  float star_size = random(5);
  ellipse(star_locs[i].x, star_locs[i].y, star_size, star_size);
}

for (int n = 0; n < constell_count; n++) {
  //select start star
  int idx = (int)random(star_count);
  float neighbour_count = random(2);
  ellipse(star_locs[idx].x, star_locs[idx].y,random(15),random(15));
  
  for(int j = 0; j < neighbour_count; j++) {
    
    for(int q = 0; q < star_count; q++) {
    // check distance
    println(star_locs[idx].dist(star_locs[q]));
    int n_idx = (int)random(star_count);
    strokeWeight(.5);
    stroke(240,240,255,200);
    line(star_locs[idx].x, star_locs[idx].y, 
            star_locs[n_idx].x, star_locs[n_idx].y);
    }
  }
  
  //
}

endRecord();
exit();