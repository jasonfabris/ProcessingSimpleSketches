
size(800,800);

int star_count = 300;
int constell_count = 3;

PVector[] star_locs = new PVector[star_count];

for(int i = 0; i < star_count; i++) {
 star_locs[i] = new PVector(random(width),random(height)); 
}

background(0,0,0);

for (int i = 0; i < star_count; i++) {
  stroke(250,250,255);
  float star_size = random(3);
  ellipse(star_locs[i].x, star_locs[i].y, star_size, star_size);
}

for (int n = 0; n < constell_count; n++) {
  //select start star
  int idx = (int)random(star_count);
  float neighbour_count = random(2);
  ellipse(star_locs[idx].x, star_locs[idx].y,15,15);
  
  for(int j = 0; j < neighbour_count; j++) {
    
    int n_idx = (int)random(star_count);
    line(star_locs[idx].x, star_locs[idx].y, 
            star_locs[n_idx].x, star_locs[n_idx].y);
  }
  
  //
}