//Random walk guy

class Walker {
 
  float xpos;
  float ypos;
  int direction;
  int last_direction;
  float start_time;
  
  Walker(float startx, float starty) {
    xpos = startx;
    ypos = starty;
    start_time=0;
  }
  
  //pick a perlin dir to go next
  void get_direction() {
    float noiseval = noise(start_time);
    
    //increase direction by 1, decrease by one, or stay the same
    float chg = map(noiseval,0,1,-1,1);
    
    direction = direction + round(chg);
    if(direction > 3) {
      max(direction -= random(1,3), 0);
    } else if (direction < 0) {
      min(direction += random(1,3),3);
    }
    
    start_time += 0.1;
    print(" Nval: ", noiseval, " :: ", chg, " D", direction, " ");
  }
  
  //pick a direction to go next
  void get_direction_simp() {
    direction = int(random(4));
       
    if(direction == 0 & random(1)<0.3) {
      if(last_direction == 3 & random(1)<0.65) {
        direction = min(direction - 1, 0);   
      } else {      
        direction = 3;
      }
    }
    //print(direction);
    last_direction = direction;
  }
  
  //go to new spot
  void stroll(int distance) {
    
    //print ("D", direction,": ");
    
    float beg_x = xpos;
    float beg_y = ypos;
    
    float end_x = constrain(xpos, 0, width);
    float end_y = constrain(ypos, 0, height);
    
    switch(direction) {
      case 0:
        end_x = xpos + distance;
        break;
      case 1:
        end_y = ypos + distance;
        break;
      case 2:
        end_x = xpos - distance;
        break;
      case 3: 
        end_y = ypos - distance;
        break;
    }
    //print(" Bx:", beg_x, " By:", beg_y, " Ex:", end_x, " Ey:", end_y);
  
    line(beg_x, beg_y, end_x, end_y);
    //print(" ::", beg_x, end_x, ":: ");
    xpos = end_x;
    ypos = end_y;    
  }
  
  }
  
  
 