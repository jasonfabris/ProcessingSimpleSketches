import processing.pdf.*;

String fname; 

fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/grid_and_circ_%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());

int row_cnt = 22;
int col_cnt = 22;

float circ_scale = .4;
float rect_scale = .6;

float circ_offset_y;
float circ_offset_x;

//beginRecord(PDF, fname);

size(1200, 1200);
background(245,245,245);

float row_cell_size = width / row_cnt;
float col_cell_size = height / col_cnt;

rectMode(CENTER);
for(int i = 2; i < (row_cnt - 2); i++) {
   for(int j = 2; j < (col_cnt - 2); j++) {
       //rects
       noFill();
       strokeWeight(1);
       stroke(25, 155, 155);
       //fill(25, 155, 155, 75);
       String rect_type = "normal";
       float rect_offset_x = 0;
       float rect_offset_y = 0;
       
       if(abs(randomGaussian()) < 1.4) {
         //normal rectangle
         rect(i * row_cell_size  + row_cell_size/2, 
               j * col_cell_size  + col_cell_size/2, 
               row_cell_size * rect_scale, 
               col_cell_size * rect_scale);
       } else {
         //either a randomly-offset square or blank
         if(abs(randomGaussian()) > .25) {
         rect_offset_x = random(-row_cell_size / 3, row_cell_size / 3);
         rect_offset_y = random(-col_cell_size / 3, col_cell_size / 3);
         rect(i * row_cell_size  + row_cell_size/2 + rect_offset_x, 
               j * col_cell_size  + col_cell_size/2 + rect_offset_y, 
               row_cell_size * rect_scale, 
               col_cell_size * rect_scale);
         rect_type = "offset";
         } else { rect_type = "blank"; }
       }
       
       //circles
       noFill();
       strokeWeight(2);
       
       int circ_col_idx;
       
       if(random(1) > .5) {
         //two colours
           //stroke(random(100, 255), random(25, 55), random(0,40));
           stroke(150, 25, 0);
       } else {
           stroke(255,55,40);
       }
  
       circ_offset_x = (randomGaussian() * row_cell_size/8); //+ (row_cell_size/10));
       circ_offset_y = (randomGaussian() * col_cell_size/8); //+ (col_cell_size/10));
       //println(circ_offset_x, circ_offset_y);
       
       float circ_size_adj = random(-.05, .05);
       
       if(rect_type == "normal" && random(1) < .9) {
         ellipse(i * row_cell_size + row_cell_size/2 + circ_offset_x, 
                 j * col_cell_size + col_cell_size/2 + circ_offset_y, 
                 row_cell_size * (circ_scale + circ_size_adj), 
                 col_cell_size * (circ_scale + circ_size_adj));
       } else if(rect_type == "offset" && random(1) < .95) {
         ellipse(i * row_cell_size + row_cell_size/2 + circ_offset_x + rect_offset_x/2, 
                 j * col_cell_size + col_cell_size/2 + circ_offset_y + rect_offset_y/2, 
                 row_cell_size * (circ_scale + circ_size_adj), 
                 col_cell_size * (circ_scale + circ_size_adj));  
       } else if(rect_type == "blank" && random(1) < .75) {
         ellipse(i * row_cell_size + row_cell_size/2 + circ_offset_x/2, 
                 j * col_cell_size + col_cell_size/2 + circ_offset_y/2, 
                 row_cell_size * (circ_scale + circ_size_adj), 
                 col_cell_size * (circ_scale + circ_size_adj));
       }
   }
}

//endRecord();