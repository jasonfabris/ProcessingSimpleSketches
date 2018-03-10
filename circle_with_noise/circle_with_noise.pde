
//ins <- seq(as.Date("2001-01-01"), as.Date("2017-06-30"), "days")
//xx <- seq(as.Date("2003-01-01"), as.Date("2018-06-30"), "days")

//a <- as.numeric(format(ins, "%d%m"))
//b <- as.numeric(format(ins, "%Y%m"))

//c <- as.numeric(format(xx, "%d%m"))
//d <- as.numeric(format(xx, "%y"))

//c <- a + rnorm(length(a), mean=12, sd=15)
//d <- b + rnorm(length(b), mean=15, sd=5)
//e <- b + rnorm(length(b), mean=5, sd=6)

size(1000,1000);

float[] x = new float[173334];
float[] a = new float[173334];
float[] b = new float[173334];

float radius = 100;
int centX = width/2;
int centY = height/2;

for(int i = 0; i < 173334; i += 1) {
  x[i] = .015 * i - 1300;
}

for(int i = 0; i <= 5500; i += 1) {
  a[i] = (i + 10000) + ((randomGaussian() * 6) + 5);
}

for(int i = 0; i <= 5500; i += 1) {
  b[i] = (i + 10000) + ((randomGaussian() * 5) + 15);
}

for(int i = 0; i <= 5500; i += 1) {
  point(centX + radius * radians(cos(a[i]/x[i])), centY + radius * sin(b[i]/x[i]));
}

//plot(cos(e/x), sin(d/x), axes=FALSE, col=rgb(20, 32, 75, 35, max=255))