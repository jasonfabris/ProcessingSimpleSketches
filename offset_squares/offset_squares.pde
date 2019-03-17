import processing.pdf.*;

float grid_size = 6;
float shift;
String fname;

void setup() {
  size(1000,1000);
  colorMode(HSB, 360, 100, 100, 100);
  shift = width/grid_size;
}

void draw() {
    fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/offset_squaresv1_%d%d%d%d%d.tif", year(), month(), day(), hour(), minute(), second());
    background(180,5,95);
    
    for(int x = 0; x < grid_size; x++) {
      for(int y = 0; y < grid_size; y++) {  
        
        float rect_size = 0.6 * (width/grid_size);
        
        pushMatrix();
          //println(shift*x + (rect_size), shift*y + (rect_size));
          translate(30,30);
          translate(shift*x + (rect_size/2), shift*y + (rect_size/2));   
      
          rectMode(CENTER);
      
          float ang = random(-PI/3, PI/3);
          
          pushMatrix();
            rotate(ang);
            noStroke();
            fill(40, 100, 100);
            rect(0,0,rect_size, rect_size);
          popMatrix();
          
          float ext = random(-PI/8, PI/8);
          rotate(ang + ext);
          noFill();
          strokeWeight(6);
          stroke(200 + (ext * 2), 100, 100);
          rect(0,0,rect_size, rect_size);
        popMatrix();
      }// y
    }//x
    
    save(fname);
    noLoop();
}
