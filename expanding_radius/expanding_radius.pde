import processing.pdf.*;
  String fname = "";
  
  int n = 2;
  
  
void setup() {
 
   size(2000,2000);
  
  fname = String.format("C:/Users/Jason/Documents/Processing Projects/Output/exp_rad_%d%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());
  beginRecord(PDF, fname);

 
  noFill();
  background(255,255,255);
  frameRate(10);

}

void draw() {
  
  PVector loc;
  
  loc = new PVector();
  
  //play around with different values in the random here
  loc.x = width/2 + randomGaussian()*(n/2)*(n/4)+8;
  loc.y = height/2 + randomGaussian()* 2 + 5;
    
    
  int num = int(random(n));
  
  for(int i = 0; i<= num; i++) {
    strokeWeight(random(5)/4);
    stroke(random(20), random(12)*n, random(80),10);  //40, 12*n, 80
    ellipse(loc.x , loc.y , n/2 * (randomGaussian() * sqrt(n/20) + (width/50)), n/2 * (randomGaussian() * sqrt(n) + (height/60)));
    
  }
  
 /*  
  for(int i = 0; i<= num; i++) {
    strokeWeight(random(4)/4);
    stroke(random(10)*n, random(50), random(80));
    ellipse(loc.x + randomGaussian()+10 , loc.y + randomGaussian()+10 , n/2 * (randomGaussian() * sqrt(n) + (width/30)), n/2 * (randomGaussian() * sqrt(n) + (height/30)));
    
  }
 */
 
  //try n + random 5 or something instead of width/5
  if(n >= width/30) {
    n = 2;
  } else {
    n = n + int(random(width/250));
  }
}

void keyPressed() {
  saveFrame();
  endRecord();
  exit();

}