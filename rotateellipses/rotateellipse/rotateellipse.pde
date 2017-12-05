float radius = 300;
float x = 0;
float y = 0;

void setup() {
  size(1200,1200);
  background(100,210,215);
  strokeWeight(2);
  stroke(50,70,100,20);
  frameRate(1);
 
}

void draw() {
//background(250,250,215);
translate(height/2, width/2);
  // TURN OFF THIS LOOP FOR MINIMAL
  for (int n=0; n<20; n++) {
    for (int i=0; i <= 360; i +=8) { 
      x = sin(radians(i)) * radius;
      y = cos(radians(i)) * radius;
      noFill();
      stroke(50+randomGaussian()*10,70+randomGaussian()*5,100+randomGaussian()*2+10,20);
      ellipse(x,y, x+5, y+5);
      //print(x, " : ", y, " ");
    }   
   
    translate(randomGaussian()*10,randomGaussian()*10);
  }
}

void keyPressed() {
 saveFrame("rot_ellipse"); 
}