OpenSimplexNoise noise;
import processing.pdf.*;

int[][] result;
float t, c;

float ease(float p) {
  return 3*p*p - 2*p*p*p;
}

float ease(float p, float g) {
  if (p < 0.5) 
    return 0.5 * pow(2*p, g);
  else
    return 1 - 0.5 * pow(2*(1 - p), g);
}

float mn = .5*sqrt(3), ia = atan(sqrt(.5));

void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popStyle();
  popMatrix();
}

void draw() {

  if (!recording) {
    t = mouseX*1.0/width;
    c = mouseY*1.0/height;
    if (mousePressed)
      println(c);
    draw_();
  } else {
    for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;

    c = 0;
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
      draw_();
      loadPixels();
      for (int i=0; i<pixels.length; i++) {
        result[i][0] += pixels[i] >> 16 & 0xff;
        result[i][1] += pixels[i] >> 8 & 0xff;
        result[i][2] += pixels[i] & 0xff;
      }
    }

    loadPixels();
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 | 
        int(result[i][0]*1.0/samplesPerFrame) << 16 | 
        int(result[i][1]*1.0/samplesPerFrame) << 8 | 
        int(result[i][2]*1.0/samplesPerFrame);
    updatePixels();

    saveFrame("fr###.png");
    println(frameCount,"/",numFrames);
    if (frameCount==numFrames)
      exit();
  }
}

//////////////////////////////////////////////////////////////////////////////

int samplesPerFrame = 4;
int numFrames = 60;        
float shutterAngle = .8;

boolean recording = false;

float R = 5.2;  //1.2
float L = 260;  //160
float scl = 0.0213;  //noise scale

float radius = 475;

class Star{
  float r = sqrt(random(1))*radius;
  float r1 = (randomGaussian()*radius)*2;
  float the = random(TWO_PI);
  float y = height/2 + r*sin(the);

  float x = width/2 + r*cos(the);
  
  
  void show(){
    float intensity = pow(map(dist(x,y,width/2,height/2),0,radius*1.025,1,0),.75);  //.575 is cool
    println(intensity);

    float xx = x + intensity*L*(float)noise.eval(scl*x,scl*y,R*cos(TWO_PI*t),R*sin(TWO_PI*t));
    float yy = y + intensity*L*(float)noise.eval(100+scl*x,scl*y,R*cos(TWO_PI*t),R*sin(TWO_PI*t));

    noStroke();
    fill(5, 5, 55, 150);
    //strokeWeight(1);
    //point(xx,yy);
    ellipse(xx,yy,2,2);
  }
}

void drawCurve(){
  int m = 250;  //number of point on circle
  stroke(0,5,50,10);
  strokeWeight(4);
  noFill();
  beginShape();
  for(int i=0;i<m;i++){
    float theta = i*TWO_PI/m;
    
    float y = height/2+radius*cos(theta);
    float x = width/2+radius*sin(theta);
    float intensity = pow(map(dist(x,y,width/2,height/2),0,radius,1,0),.18);
    println(intensity);
    float xx = x + intensity*L*(float)noise.eval(scl*x,scl*y,R*cos(TWO_PI*t),R*sin(TWO_PI*t));
    float yy = y + intensity*L*(float)noise.eval(100+scl*x,scl*y,R*cos(TWO_PI*t),R*sin(TWO_PI*t));
    
    //vertex(x,y);
    vertex(xx,yy);
  }
  endShape(CLOSE);
}

int n = 100000;

Star[] array = new Star[n];


void setup(){
  size(1200,960);
  
  result = new int[width*height][3];
  
  noise = new OpenSimplexNoise();
  
  for(int i=0;i<n;i++){
    array[i] = new Star();
  }
  
}

void draw_(){
  String fname; 
  fname = String.format("circ_%d%d%d%d%d.pdf", year(), month(), day(), hour(), minute(), second());
  
  background(255,255,255);
  beginRecord(PDF, fname);
  
  for(int i=0;i<n;i++){
    array[i].show();
  }
  
  stroke(0,50,5);
  strokeWeight(1);
  drawCurve();
}

void keyPressed() {
  endRecord();
  exit();
  //save(fname);
}