int num_movers = 30;
int num_friends = 3;
Mover[] movers = new Mover[num_movers];

String f_name = String.format("C:/Users/Jason/Documents/Processing Projects/Output/falling_balls_%d%d%d%d%d.png", year(), month(), day(), hour(), minute(), second());

void setup() {
  
  size(1500,1500);
  
   for (int i = 0; i < movers.length; i++) {
     movers[i] = new Mover(random(width), random(0, height/2), random(20), (int)random(num_friends));
   }
   
   // if this stays in setup, friends only get made once
    for (int i = 0; i < movers.length; i++) {
     movers[i].make_friends(i, movers.length);
    }
}

void draw() {
 //background(255,255,255);
 PVector grav = new PVector(0, 0.25);
 PVector wigg = new PVector(randomGaussian()*5, random(-.05,.025));
 
 //for (int i = 0; i < movers.length; i++) {
 //  movers[i].make_friends(movers.length);
 //}
 
 for (int i = 0; i < movers.length; i++) {
   movers[i].make_friends(i, movers.length);  //makes new friends every time is this is inside draw
   
   movers[i].apply_frc(grav);  // put this back
   movers[i].apply_frc(wigg);  // this too
   //movers[i].update_loc();
   //movers[i].display();
   movers[i].check_edges();
   
   
   for(int j = 0; j < movers[i].friends.length; j++) {
     if(movers[i] != movers[j]) {
       movers[i].connect_friend(movers[j]);
       PVector attr = movers[j].attract(movers[i]);
       movers[i].apply_frc(attr);
     }//if
   }
   movers[i].update_loc();
   movers[i].display();
   
 }
}

void keyPressed() {
   if (key == 's') {
     save(f_name);
   } 
}