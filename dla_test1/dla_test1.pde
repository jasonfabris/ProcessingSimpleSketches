int grid_size = 200;
float max_iter = 100000; //00000;
int n_walkers = 2;

size(1100,1100);
background(255,250,258);
float cell_w = width/grid_size;
float cell_h = height/grid_size;

//for (float cw = 0 + cell_w/2; cw < width; cw+=cell_w) {
//  for (float ch = 0+cell_h/2; ch < height; ch+= cell_h) {
//    circle(cw, ch, 10);
//  }
//}


int[] x_step = {-1, 0 , 1, 0};  //directions for random walk
int[] y_step = {0, -1 , 0, 1};

int[] dx = {-1, 0, 1, 0, -1, 1, 1, -1};  //neighbours to check for sticking
int[] dy = {0, -1, 0, 1, -1, -1, 1, 1};

int[][] grid = new int[grid_size][grid_size];  //the grid
int[][] grid_ghost = new int[grid_size+2][grid_size+2];  //the grid with ghosts

//println("Length: ", grid.length);

int[] x = new int[n_walkers];  //what grid cell is walker in?
int[] y = new int[n_walkers];
int[] status = new int[n_walkers];  //1 equals mobile walker

for(int i = 0; i < n_walkers; i++) {
  x[i] = (int)random(grid.length);  //randomly put walkers in grid
  y[i] = (int)random(grid.length);  

  grid[x[i]][y[i]] = 1;  
  status[i] = 1;
}

grid[grid_size/2][grid_size/2] = 2;  //sticky node seed cell
//println("centre:", grid_size/2);

//int onecnt = 0;
//  int zercnt = 0;
//for (int xc = 0; xc < grid_size; xc++) {
  
//  for (int yc = 0; yc < grid_size; yc++) {
//    if(grid[xc][yc] == 1) {
//        onecnt += 1;
//    } else {
//        zercnt +=1;
//    }
//  }
//}
//println(onecnt, " : ", zercnt);

int iteration = 0;
int n_glued = 0;

while(n_glued < n_walkers & iteration < max_iter) {
  for(int i = 0; i < n_walkers; i++) {
    
    if (status[i] == 1) {
      int ii = (int)random(0, 4);
      int x_new = x[i] + x_step[ii];  //when mobile, add a random direction to x and y
      int y_new = y[i] + y_step[ii];
      x_new = (grid_size + x_new) % grid_size;
      y_new = (grid_size + y_new) % grid_size;
      
      grid[x_new][y_new] = 1;
      grid[x[i]][y[i]] = 0;

      x[i] = x_new;
      y[i] = y_new;

      ellipse(x[i]*cell_w, y[i]*cell_h, 20, 20);  
      for (int n = 0; n < 8; n++) {  //check neighbours for stickiness
        //println("cell: ", x[i],y[i], " Cell val: ", grid[x[i]][y[i]], " Dir: ", dx[n], dy[n], " Diff: ", x[i]+dx[n], y[i]+dy[n] );
        //println(x[i]+1+dx[n], y[i]+1+dy[n]);
        if (grid_ghost[x[i]+1+dx[n]][y[i]+1+dy[n]] == 2) {
          grid[x[i]][y[i]] = 2;
          status[i] = 2;
          n_glued += 1;
          println("HIT");
        }
      }//for check sticky
    }//if
    iteration +=1;
    println(iteration);
  }//while

for(int i = 0; i < n_walkers; i++) {
   
   if(status[i] == 2) {
     circle(x[i] * cell_w, y[i] * cell_h,3);
   }
}


}//eof
