

OscAttr osc1;
String fname;

void setup() {

   colorMode(HSB, 360, 100, 100, 100);
   size(1500,1500);
   fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/interference_circle_%d%d%d%d%d.tif", year(), month(), day(), hour(), minute(), second());

   osc1 = new OscAttr(width * .8);
      
   background(275,25, 80);
  
}

void draw() {
 // background(335, 95, 50);
  osc1.display();  
}

  void keyPressed() {
     if(key == 's') {
        save(fname);
        println(fname);
     }
  }
