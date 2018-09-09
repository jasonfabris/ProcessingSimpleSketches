import processing.pdf.*;

int count;
float n1; //noise
float n2;
float x_off = 0.02;
float y_off = 0.02;

void setup() {
  size(1200,1200, PDF, "C:/Users/Jason/Documents/Processing Projects/Output/circ_scratch1.pdf");
  count = width * 20; //000;  USE 100 for vertex shapes
  background(250);
  n1 = 0;
  n2 = 5000;
}

void draw() {
  background(250);
    for (int i = 0; i < count; i++) {
       float x = random(1) * width;
       float y = random(1) * height;
       println("O: ", x, y);
       x = x + noise(n1, n2) * 50;
       y = y + noise(n2, n1) * 50;
       println("N: ", x, y);
       float val = get_val(x, y, i);
       //val = val * noise(n) * 5;
       
       pushMatrix();
         translate(x,y);
         display(val, x, y);
        popMatrix();
     n1 += x_off;
     n2 += y_off;
    }
    //noLoop();
    //saveFrame("C:/Users/Jason/Documents/Processing Projects/Output/circ_######.png");
    PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer

    // When finished drawing, quit and save the file
    if (frameCount == 20) {
      exit();
    } else {
      pdf.nextPage();  // Tell it to go to the next page 
    }
}

float get_val(float x, float y, float i) {
  //return (sin(x * .01) + sin(y * .01)) * TWO_PI;
  float scl = (5 * randomGaussian() + 75);
  
  if(i % 20 == 0) {
    return (tan((x + scl) * .01) + sin((y + scl) * .01)) * TWO_PI;
  } else {
    return (cos((x ) * .01) + tan((y ) * .01)) * TWO_PI;
  }
}

void display(float val, float x, float y) {
  rotate(val);
  //noFill();
  //strokeWeight(.5);
  //stroke(map(x, 0, width, 100, 255), random(0, 55), map(y, 0, height, 0, 255), map(val, 0, 360, 25, 50));
  //noStroke();
  //noStroke will just be circles (good)
  float grey_val = random(50,150);
  stroke(grey_val, grey_val, grey_val ,random(15,50));
  fill(map(x, 0, width, 100, 255), random(0, 55), map(y, 0, height, 0, 255), map(val, 0, 360, 1, 30));
  beginShape();
    vertex(0,0);
    vertex((randomGaussian() * 30 + 30), (randomGaussian() * 30 + 30));
  endShape(CLOSE);
  ellipse(0,0, map(val, 0, 360, 5, 20), map(val, 0, 360, 5, 20));
}