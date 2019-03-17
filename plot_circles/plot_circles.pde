
import java.util.Collections;
import processing.pdf.*;

float base_r;
ArrayList<Circ> shps;
float num_shps;
boolean record;

void setup() {
  
    size(1200,1200);
    colorMode(HSB, 360, 100, 100, 100);
    background(200, 3, 100);
    
    base_r = width/3;
    num_shps = 9;
    shps = new ArrayList<Circ>();
    
     for (int shp = 0; shp < num_shps; shp++) {    
        Circ c = new Circ(37, base_r, shp);
        shps.add(c);
        println("Count: ", shps.size());
     } //shp
     //noLoop();
}//setup
      
void draw() {
  
  if (record) {
    beginRecord(PDF, String.format("C:/Users/Jason/Documents/Processing Projects/Output/plot_circs_%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second()));
  }   
  
  
    translate(width/2, height/2);
    for(int i = 0; i < shps.size(); i++) {
  
      Circ circ = shps.get(i);
      //circ.get_pts();
      
      color c_col;
      if( i % 2 == 0) {
         c_col = color(200, 100, 100);
      } else {
        c_col = color(360,100,100);
      }
      
      circ.draw_circ(c_col); 
                
    }//shps
    
    if (record) {
      endRecord();
      record = false;
    }

    
}//draw

void keyPressed() {
   if (key == 's') {
     record = true;
   }
}
