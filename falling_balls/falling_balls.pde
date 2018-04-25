
Mover[] movers = new Mover[12];

void setup() {
  
  size(1000,1000);
  
   for (int i = 0; i < movers.length; i++) {
     movers[i] = new Mover(random(width), random(height), random(40), (int)random(10));
   }
   
   // if this stays in setup, friends only get made once
    for (int i = 0; i < movers.length; i++) {
     movers[i].make_friends(i, movers.length);
    }
}

void draw() {
 background(255,255,255);
 PVector grav = new PVector(0, 0.25);
 PVector wigg = new PVector(randomGaussian()*2, random(-.01,.025));
 
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