size(1000,1000);
background(255);
strokeWeight(3);
smooth();

float start_radius=200;
int centX = width/2;
int centY = height/2;

stroke(0,30);
noFill();

//ellipse(centX,centY,radius*2,radius*2);

stroke(20,50,70);
float x,y;
float lastx = centX + (start_radius * cos(0));
float lasty = centY + (start_radius * sin(0));
float nval = random(10);

for(float radius=start_radius; radius < (width/2-10); radius+=10) { 
  for(float ang = 0; ang <= 360; ang += 5) {
    float rad = radians(ang);
    float jiggle = noise(nval) * (radius/10);
    x = centX + ((radius+jiggle) * cos(rad));
    y = centY + ((radius+jiggle) * sin(rad));
    point(x,y);
    line(lastx,lasty,x,y);
    lastx = x;
    lasty = y;
    stroke(20);
    nval += 0.2;
  }
}