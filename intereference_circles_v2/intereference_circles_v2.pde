
import processing.pdf.*;

beginRecord(PDF, "C:/Users/D212/Documents/sketchbook/interference_pattern1.pdf");

size(1200,1200);
colorMode(HSB, 360, 100, 100, 100);

float num_blobs = 12;


float step_size = 30;
float num_circs = (width * .55) / step_size;

float cent_x = 0;
float cent_y = 0;

color b = color(0, 100, 25);
color l = color(360, 100, 100);

background(b);

//build array of centres
    int r = int(num_blobs/2);
    int c = int(num_blobs/2);
    
    ArrayList<PVector> centres = new ArrayList<PVector>();    
        
    for(int cx = 0; cx < r; cx++) {
            cent_x = width/2 + map(cx, 0, r-1, -100, 100);
        for(int cy = 0; cy < c; cy++) {
            cent_y = width/2 + map(cy, 0, c-1, -100, 100);
            println(cx, cy, map(cx, 0, r-1, -100, 100),  map(cy, 0, c-1, -100, 100), cent_x, cent_y);
            centres.add(new PVector(cent_x, cent_y));
        }
    }
    //    println(cent_x, cent_y);
    

//draw circles

for(int i = 0; i < centres.size(); i++) {
    println(i, centres.get(i).x, centres.get(i).y);
    PVector cent = centres.get(i);
    pushMatrix();
        translate(cent.x, cent.y);
        for (int n = 0; n < num_circs; n++) {
          stroke(l);
          strokeWeight(0.5);
          noFill();
          ellipse(0, 0, n * step_size, n * step_size);
        }
     popMatrix();
    
}

endRecord();