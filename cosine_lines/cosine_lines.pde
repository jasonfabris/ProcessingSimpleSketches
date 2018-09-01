
int gap_max = abs(round(randomGaussian() * 2 + 5));
int loop_count;
int r1 = 20;
int g1 = 60;
int b1 = 50;
int a1 = 15;

void setup() {
  size(1600,1600);
  
  background(245);
  strokeWeight(30);
  stroke(r1,g1,b1,15);
}

void draw() {

  
if (loop_count < 3) {  
  for(int i = 0; i < width; i += 1) {
    
    int gap = (int) random(gap_max);
    float angle = random(30);
    
    float y = sin(radians(angle)) * cos(radians(angle));
    
    float bot_x = i + (i * y);
    
    strokeWeight(max(randomGaussian()*8+10, 2));
    line(i + gap, 0, bot_x, height);
    
    i = i + gap; 
    rotate(PI/3);
  }
}
loop_count += 1;

stroke(a1,b1 + random(20) * loop_count,g1 + random(20)*loop_count,15);
}