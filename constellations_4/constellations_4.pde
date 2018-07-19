
import processing.pdf.*;
String fname;
String[] star_names;
PVector[] star_locs;

int star_count = round(randomGaussian() * 1400 + 4100);
int constell_count = round(randomGaussian() + 12) ;


void setup() {

  size(1600,1600);
  frameRate(0.5);
  //fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/const_accident_%d%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());
  //beginRecord(PDF, fname);

  //    println("There are " + star_names.length + " lines.");
  //    printArray(star_names);
  star_names = loadStrings("star_names.txt");
}

void draw() {

  star_locs = new PVector[star_count];

  //generate star field
  for(int i = 0; i < star_count; i++) {
     star_locs[i] = new PVector(random(width),random(height)); 
  }

  //draw stars
  background(0,0,20);
  for (int i = 0; i < star_count; i++) {
    //stroke(240,240,255);
    noStroke();
    fill(240, 240, 255, random(150));
    float star_size = random(8);
    ellipse(star_locs[i].x, star_locs[i].y, star_size, star_size);
    
  }

  //generate constallations
  for (int n = 0; n < constell_count; n++) {
    
    //select start star and get properties
    int start_idx = get_start_star(); 
    float max_distance = 125;
    
    //generate constellation
    int constel_size = round(randomGaussian()+7);
    int[] constel = new int[constel_size];
    
    //add first star to constellation
        constel[0] = start_idx;
    //build the rest
    constel = make_constellation(start_idx, max_distance, star_locs, constel_size - 1, constel);
    draw_constellation(constel, star_locs);
    
    //for(int v = 0; v < constel.length; v++) {
    //  print(constel[v], " - ");
    //}
  } //n

//  noLoop();
//endRecord();
//exit();
}

// --------------------

int[] make_constellation(int star_num, float max_dist, PVector[] star_locs, int remaining_size, int[] constel_stars) {
    //for(int v = 0; v < constel_stars.length; v++) {
    //  println("Constel stars: ", constel_stars[v]);
    //}
    int current_star = star_num;
    int current_constel_slot = constel_stars.length - remaining_size - 1;
    //println(current_constel_slot, ":slot ", constel_stars.length, ":size ", remaining_size, ":remain");
    
    boolean found_one = false;
    float dist;
    int neighbour_idx = 0; 
    //println(constel_stars.length, remaining_size);
    
    
      if(remaining_size < constel_stars.length - 2 && random(1) < 0.5) { // after the first start, there is a chance we go back to a prev star in the constellation
          while (found_one == false) {
            int prior_star_idx = constel_stars[(int)random(current_constel_slot-1)+1];          
            neighbour_idx = prior_star_idx;  
            found_one = true;
            constel_stars[current_constel_slot] = prior_star_idx;
           }
        //  println("prev:: neigh-dx: ", neighbour_idx, star_locs[neighbour_idx], " orig-dx: ", star_num, star_locs[star_num]); 
        } else {
          while (found_one == false) {
            int n_idx = (int)random(star_count);
            dist = star_locs[star_num].dist(star_locs[n_idx]);
            if(dist < max_dist && dist > (max_dist / 5)) {
              neighbour_idx = n_idx;
              found_one = true;
              constel_stars[current_constel_slot] = neighbour_idx;}
            }
         // println("new:: neigh-dx: ", neighbour_idx, star_locs[neighbour_idx], " orig-dx: ", star_num, star_locs[star_num]);
        }
      
      if(remaining_size > 0) {
        remaining_size = remaining_size - 1;  
        constel_stars = make_constellation(neighbour_idx, max_dist, star_locs, remaining_size, constel_stars);
      }   
      return constel_stars;
  } //find_neighbour


// --------------------

PVector[] make_constellation_old(int star_num, float max_dist, PVector[] star_locs, int remaining_size, PVector[] constel_stars) {
    //for(int v = 0; v < constel_stars.length; v++) {
    //  println("Constel stars: ", constel_stars[v]);
    //}
    int current_star = star_num;
    int current_constel_slot = constel_stars.length - remaining_size - 1;
    //println(current_constel_slot, ":slot ", constel_stars.length, ":size ", remaining_size, ":remain");
    
    boolean found_one = false;
    float dist;
    int neighbour_idx = 0; 
    //println(constel_stars.length, remaining_size);
    
    
      if(remaining_size < constel_stars.length - 2 && random(1) < 0.1) { // after the first start, there is a chance we go back to a prev star in the constellation
          while (found_one == false) {
            int prior_star_idx = (int)random(current_constel_slot-1)+1;          
            neighbour_idx = star_num; //prior_star_idx;  
            found_one = true;
            constel_stars[current_constel_slot] = new PVector();
            constel_stars[current_constel_slot].x = constel_stars[prior_star_idx].x;
            constel_stars[current_constel_slot].y = constel_stars[prior_star_idx].y;
          }
          //println("previous ", neighbour_idx, " idx ", constel_stars, " orig ", star_locs[star_num]);
        } else {
          while (found_one == false) {
            int n_idx = (int)random(star_count);
            dist = star_locs[star_num].dist(star_locs[n_idx]);
            if(dist < max_dist && dist > (max_dist / 5)) {
              neighbour_idx = n_idx;
              found_one = true;
              constel_stars[current_constel_slot] = new PVector();
              constel_stars[current_constel_slot].x = star_locs[neighbour_idx].x;
              constel_stars[current_constel_slot].y = star_locs[neighbour_idx].y;
            }
          }
          //println("new ", neighbour_idx, " idx ", star_locs[neighbour_idx], " orig ", star_locs[star_num]);
        }
      
      if(remaining_size > 0) {
        remaining_size = remaining_size - 1;  
        constel_stars = make_constellation_old(neighbour_idx, max_dist, star_locs, remaining_size, constel_stars);
      }   
      return constel_stars;
  } //find_neighbour
  
  void draw_constellation(int[] stars, PVector[] star_locs) { 
    
    //from 2nd to end, draw from current to previous
    for(int i = 1; i < stars.length; i++) {
        strokeWeight(2);
        stroke(240,240,255,100);
        line(star_locs[stars[i]].x, star_locs[stars[i]].y, 
                star_locs[stars[i-1]].x, star_locs[stars[i-1]].y);
    } //i
    
    //enhance the stars
    for(int i = 0; i < stars.length; i++) {
      noStroke();
      fill(240, 240, 255, 255);
      ellipse(star_locs[stars[i]].x, star_locs[stars[i]].y, 10, 10);
      if(random(1) < .2) {    
      //label some stars
        String star_name = star_names[(int)random(star_names.length)];
        text(star_name, star_locs[stars[i]].x + 8, star_locs[stars[i]].y +8);
      }
    }
    
  }
  
  int get_start_star() {
    boolean found_one = false;
    int start_star = 0;
    while (found_one == false) {
      println("star count: ", star_count);
      start_star = (int)random(star_count);
      println("start_rnd: ", start_star);
      if(star_locs[start_star].x > width / 25 && 
            star_locs[start_star].x < width - width/25 && 
            star_locs[start_star].y > height / 25 && 
            star_locs[start_star].y < height - height/25) 
           {
            found_one = true;
           }
    } //while
     println("start: ", start_star);
     return start_star;
  }
  
  //TODO: ---fixed Why sometimes really long lines?
  //space out constellations
  //name constellations
  //name sky
  //variable numbers of stars?
  
  
  