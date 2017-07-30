// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float nval;
  PVector orig;

  Mover() {
    position = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 10;
    nval = 0.01;
  }

  void update() {
    
    orig = position;
    
    acceleration = PVector.random2D();
    //acceleration.add(nval, nval);
    acceleration.mult(randomGaussian()/2);
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
    
    nval += .15;
  }

  void display() {
    stroke(100);
    strokeWeight(2);
    fill(155,155,75,20);
    //ellipse(position.x, position.y, 2, 2);
    rect(orig.x,orig.y,position.x, position.y);
  }

  void checkEdges() {

    if (position.x > width) {
      position.x = 0;
    } 
    else if (position.x < 0) {
      position.x = width;
    }

    if (position.y > height) {
      position.y = 0;
    } 
    else if (position.y < 0) {
      position.y = height;
    }
  }
}