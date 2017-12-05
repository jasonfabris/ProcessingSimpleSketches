import processing.pdf.*;

int start_w;
int end_w;

void setup() {
  size(1500,1100);
  beginRecord(PDF, "samp1.pdf");
  
  background(235,240,245);
  strokeWeight(2);
  stroke(21,150,20,10);
  fill(200,30,20,12);
  frameRate(5);
  start_w = width / 6 + 20;
  end_w = (width - 80) / 3; 
  
}

void draw() {
  float radc;
  float x;
  float y;
  
  radc = 205;
  
  //translate(width/6,height/2);
  translate(start_w,height/2);

  for (int num = 0; num <= 2; num++) {
    float rad_adj;
    rad_adj = randomGaussian() * (radc/5) + 2;
    
    for(int n = 0; n < 5; n++) {
      translate(randomGaussian() + n + (end_w/100), randomGaussian() * n + 2);  
        for(int i = 0; i <= 360; i+=5) {
          
          //float rad_adj;   //this used to be here
          rad_adj = rad_adj + randomGaussian() * (n/2) + n;
          
          x = (radc + rad_adj) * sin(radians(i));
          y = (radc - rad_adj) * cos(radians(i));
          
          //point(x,y);
          //noFill();
          noStroke();
          ellipse(x,y,10,10);
        }   
    } //n
    //translate(width/3,0);
    translate(end_w,0);
  } //num
  
}

void keyPressed() {
 //saveFrame("rand_circ_03.tif"); 
 endRecord();
 exit();
}

////x <- seq(-1650,1650, by=0.02)

////a <- seq(1000,5000, by=rpois(300,2))
////xx <- seq(0,1999, by=rpois(300,3))

////c <- a + rnorm(length(a), mean=10, sd=15)
////d <- a + rnorm(length(a), mean=5, sd=5)

////#plot(sin(c*(log(x)*3)), cos(d*x), axes=FALSE, col=rgb(0, 125, 255, 75, max=255))
////plot(sin(a/x), cos(c*x), axes=FALSE, col=rgb(50, 100, 10, 75, max=255))
////#plot(sin(c*x), sqrt(cos(d*2/x)), axes=FALSE, col=rgb(100, 100, 70, 75, max=255))
////plot(sqrt(sin(c%/%x)), cos(rnorm(length(d), mean=d, sd=d/2)/x), axes=FALSE, col=rgb(25, 115, 65, 85, max=255), cex=16.5, pch=1)