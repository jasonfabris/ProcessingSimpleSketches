int row_cnt = 30;
int col_cnt = 30;

float circ_scale = .5;
float rect_scale = .6;

float circ_offset_y;
float circ_offset_x;

size(1000, 1000);
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
       if(abs(randomGaussian()) < 1.96) {
         rect(i * row_cell_size  + row_cell_size/2, 
               j * col_cell_size  + col_cell_size/2, 
               row_cell_size * rect_scale, 
               col_cell_size * rect_scale);
       } else {
         if(abs(randomGaussian()) > .41) {
         rect(i * row_cell_size  + row_cell_size/2 + random(-row_cell_size / 3, row_cell_size / 3), 
               j * col_cell_size  + col_cell_size/2 + random(-col_cell_size / 3, col_cell_size / 3), 
               row_cell_size * rect_scale, 
               col_cell_size * rect_scale);
         }
       }
       
       //circles
       noFill();
       strokeWeight(2);
       stroke(random(100, 255), random(25, 55), random(0,40));
  
       circ_offset_x = (randomGaussian() * 10); //+ (row_cell_size/10));
       circ_offset_y = (randomGaussian() * 10); //+ (col_cell_size/10));
       println(circ_offset_x, circ_offset_y);
       
       float circ_size_adj = random(-.05, .05);
       
       ellipse(i * row_cell_size + row_cell_size/2 + circ_offset_x, 
               j * col_cell_size + col_cell_size/2 + circ_offset_y, 
               row_cell_size * (circ_scale + circ_size_adj), 
               col_cell_size * (circ_scale + circ_size_adj));
   }
}