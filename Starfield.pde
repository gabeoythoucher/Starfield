class ring
{
  float r;
  ring(){
    r=1;
  }
  void spand(){
    r*= 1.05;
    if(r>sqrt(width*width+height*height)){
      r=1;
    }
  }
  void show(){
    noFill();
    blendMode(BLEND);
    strokeWeight(r/10);
    stroke(128,128,128);
    ellipse(width/2,height/2,r,r);
  }
}
class Particle
{  
  float rise,run;
  float X,Y;
  Particle(int s){
    X=width/2;
    Y=height/2;
    rise = speedrange(s);
    run = speedrange(s);
  }
  void splode(){
    X+=run;
    Y+=rise;
  }
  void show(){
    blendMode(SCREEN);
    strokeWeight(3);
    stroke(100+4*(abs(rise)+abs(run)),100+4*(abs(rise)+abs(run)),255);
    //stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    line(X+7*run,Y+7*rise,X,Y);
    //line(X,Y,X,Y);
  }
}

// 1. ADDED: OddballParticle class extending Particle
class OddballParticle extends Particle 
{
  OddballParticle(int s){
    super(s); // Calls the Particle constructor to set X and Y to center
    // Make it look separate by moving it at a fixed, distinct pace
    rise = (float)(Math.random() * 4 - 2);
    run = (float)(Math.random() * 4 - 2);
  }
  
  void splode(){
    X += run + (float)(Math.random() * 10 - 5);
    Y += rise + (float)(Math.random() * 10 - 5);
  }
  
  void show(){
    blendMode(BLEND);
    stroke(255, 0, 0); 
    strokeWeight(3);
    line(X, Y, X-run,Y-rise);
  }
}
float speedrange(int s){
  return (float)(Math.random()*(s*2)-s);
}

int amount = 250;
int spd = 7;
float w = 1;
Particle[] bob = new Particle[amount];
ring[] dave = new ring[3];
void setup()
{
  size(1200,700);
  bob[0]= new OddballParticle(spd);
  for(int i = 1;i<amount;i++){
    bob[i]= new Particle(spd);
  }
  for(int i = 0;i<dave.length;i++){
    dave[i]= new ring();
  }
}
void draw()
{
  background(0);
  for(int i = 0;i<amount;i++){
    bob[i].rise*=1.03;
    bob[i].run *=1.03;
    bob[i].splode();
    bob[i].show();
    
    // Reset individual particles if they fly off-screen
    if(bob[i].X>width+spd || bob[i].X<-50 || bob[i].Y>height+spd || bob[i].Y<-50){
      bob[i].X = width/2;
      bob[i].Y = height/2;
      bob[i].rise = speedrange(spd);
      bob[i].run = speedrange(spd);
    }
  } 
  w*=1.05;
  if(w>sqrt(width*width+height*height)){
    w=1;
  }
  for(int i = 0; i<dave.length;i++){
    if(frameCount>i*(sqrt(width*width+height*height)/2)){
      dave[i].spand();
      dave[i].show();
    }
  }
}

void mousePressed() {
  for(int i = 0; i < amount; i++) {
    bob[i].X = width/2;
    bob[i].Y = height/2;
    bob[i].rise = speedrange(spd);
    bob[i].run = speedrange(spd);
  }
}
