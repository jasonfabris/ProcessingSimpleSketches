
Mover[] movers = new Mover[100];

void setup() {
  
  size(1000,1000);
  
   for (int i = 0; i < movers.length; i++) {
     movers[i] = new Mover(random(width), random(height), random(60), (int)random(12));
   }
}

void draw() {
 background(255,255,255);
 PVector grav = new PVector(0, 0.25);
 PVector wigg = new PVector(randomGaussian()*1.25+3, 0);
 
 for (int i = 0; i < movers.length; i++) {
   movers[i].make_friends(movers.length);
 }
 
 for (int i = 0; i < movers.length; i++) {
   movers[i].apply_frc(grav);
   movers[i].apply_frc(wigg);
   movers[i].update_loc();
   movers[i].display();
   movers[i].check_edges();
   
   
   for(int j = 0; j < movers[i].friends.length; j++) {
     movers[i].connect_friend(movers[j]);
   }
 }
}