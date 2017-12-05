
int gridsize = 5;
int xoffset = (width / gridsize) / 2;
int yoffset = (height / gridsize) / 2;
int sz = 25;
background(240,240,240);

size(2000,1250);
  for(int x = 0; x < gridsize; x+=1) {
    for(int y = 0; y < gridsize; y+=1) {
      
      int cx1 = xoffset + (width / gridsize) * x;
      int cy1 = yoffset + (height / gridsize) * y;  
      
      strokeWeight(5);
      //stroke(0,0,0,200);
      stroke(180, 50, 95, 70);
      for(int i = 0; i < 360; i += 18) {
        float dx = sin(radians(i)) * (randomGaussian() * 2.25 + sz + 5);
        float dy = cos(radians(i)) * (randomGaussian() * 5.66 + sz + 5);
        point(cx1 + dx, cy1 + dy);
      }
      
      
      //stroke(10, 30, 95, 40);
      noStroke();
      fill(40, 20, 95, 20);
      //noFill();
      ellipse(cx1 + (randomGaussian() * (xoffset / 5)), cy1 + (randomGaussian() * (yoffset / 5)), sz*2.5, sz*2.5);     
      //println(cx1, " : ", cy1);
      
      strokeWeight(2);
      stroke(180, 50, 35, 10);
      //noFill();
      fill(10, 30, 95, 10);
      pushMatrix();
        translate(cx1, cy1);
        for(int n = 0; n < 2200; n++) {
          //noStroke();
          float tmpx = sin(randomGaussian()*n) * xoffset;
          float tmpy;
          if(random(1) > .5) {
            tmpy = sin((cos(randomGaussian()*n + random(2)))) * yoffset;
          // use this if you don't want the gap between grids
          } else {
            tmpy = cos(randomGaussian()*n + random(2)) * yoffset;
          }
          
          ellipse(tmpx, tmpy, 5, 5);
          //point(sin(randomGaussian()/n)*3, cos(pow(randomGaussian()*n,1.5)));
          println("x: ", tmpx, " y: ", tmpy);
        }
      popMatrix();
    }
  }
  
  save("test.tif"); 
  