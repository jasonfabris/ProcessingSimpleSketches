
float cradius = 200;
float x;
float y;
float tn;

float trans_inc = 0;

void setup() {
  size(1600,800);
  background(215,225,255);
  translate(width/2,height/2);
}

void draw() {
  
  background(215,225,255);
  translate(width/2+trans_inc, height/2+trans_inc);
  
  for(float i = 1; i <= 360; i+=2) {
      x = sin(radians(i)) * cradius;
      y = cos(radians(i)) * cradius;
      
      tn = tan(radians(i)) * cradius;
     
      point(x,y);
      
      line(x,y,tn,tn);
      //print(x,y, ": ",tn," ");
  }
  delay(200);
  trans_inc +=5;
}