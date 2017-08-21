

void setup() {
  
 size(900,900); 
}

void draw() {
  background(240);
  stroke(240,40,0);
  for(int i=0; i<360; i+=1) {
    line(height/2, width/2, height/2 + cos(radians(i))*400, width/2 + sin(radians(i^2))*399);
    print(i, ": ", sin(i), cos(i), "   ");
  }
  //translate(22,0);
}