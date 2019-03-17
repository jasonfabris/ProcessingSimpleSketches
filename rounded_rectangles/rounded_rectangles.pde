
size(1600,1600);

rectMode(CENTER);  // Set rectMode to CENTER
colorMode(HSB, 360, 100, 100, 100);

background(175, 100, 100);


noFill();  // Set fill to gray

int num_recs = 50;
int off_x = 5;
int off_y = -5;


float gap_size = (width * 0.9) / num_recs;

for (int i = 0; i < num_recs; i ++) {
  
  pushMatrix();
    translate(width/2, height/2);
    strokeWeight(sqrt(i/5));
    stroke(33, 100, 100, 100);
    println(i*50);
    rect(0, 0, (i + 1) * gap_size, (i + 1) * gap_size, (width * 0.99)/i);
   popMatrix();
   
   pushMatrix();
    translate(width/2 + off_x, height/2 + off_y);
    strokeWeight(sqrt(i/5));
    stroke(33, 100, 100, 100);
    rect(0, 0, (i + 1) * gap_size, (i + 1) * gap_size, (width * 0.99)/i);
   popMatrix();
   
} //i
