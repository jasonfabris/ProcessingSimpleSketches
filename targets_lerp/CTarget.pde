
class CTarget {

 float xloc;
 float yloc;
 int size;
 int num;
 float start_gray;
  
  CTarget(float xval, float yval, int sz, int nm, float init_col) {
    xloc = xval;
    yloc = yval;
    size = sz;
    num = nm;
    init_col = start_gray;
  }
  
  void drawTarget() {
    float grayvalues = 255/num;
    float steps = size/num;
    for (int i = 0; i < num; i++) {
      fill(i*grayvalues + start_gray);
      ellipse(xloc, yloc, size - i*steps, size - i*steps);
    }
  }

  void update_pos(float new_x, float new_y) {
    xloc = new_x;
    yloc = new_y;
  }

}