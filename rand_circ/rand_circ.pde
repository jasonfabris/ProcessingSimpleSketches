

void setup() {
  size(1200,1200);
  background(225,225,215);
  strokeWeight(2);
  stroke(100,200,100,20);
}

void draw() {
  float radc;
  float x;
  float y;
  
  radc = 300;
  
  translate(width/2,height/2);
  
  for(int n = 0; n < 4; n++) {
    translate(randomGaussian()* 5, randomGaussian()*5);  
      for(int i = 0; i <= 360; i+=3) {
        float rad_adj;
        
        rad_adj = randomGaussian() * (radc/5);
        x = (radc + rad_adj) * sin(radians(i));
        y = (radc - rad_adj) * cos(radians(i));
        
        //point(x,y);
        noFill();
        ellipse(x,y,5,5);
      }
  }
}

//x <- seq(-1650,1650, by=0.02)

//a <- seq(1000,5000, by=rpois(300,2))
//xx <- seq(0,1999, by=rpois(300,3))

//c <- a + rnorm(length(a), mean=10, sd=15)
//d <- a + rnorm(length(a), mean=5, sd=5)

//#plot(sin(c*(log(x)*3)), cos(d*x), axes=FALSE, col=rgb(0, 125, 255, 75, max=255))
//plot(sin(a/x), cos(c*x), axes=FALSE, col=rgb(50, 100, 10, 75, max=255))
//#plot(sin(c*x), sqrt(cos(d*2/x)), axes=FALSE, col=rgb(100, 100, 70, 75, max=255))
//plot(sqrt(sin(c%/%x)), cos(rnorm(length(d), mean=d, sd=d/2)/x), axes=FALSE, col=rgb(25, 115, 65, 85, max=255), cex=16.5, pch=1)