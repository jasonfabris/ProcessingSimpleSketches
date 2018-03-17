
size(1000,1000);

int h = height;
int w = width;


//pick a direction to divide by
String split_dir = "";

if(random(1) > 0.5) {
  split_dir = "v"; }
 else {
   split_dir = "h"; }
 
//pick a point to split on
int split_point;
if(split_dir == "v") {
  split_point = round(random(w)); }
  else {
    split_point = round(random(h)); }

rect(0,0,split_point, w);