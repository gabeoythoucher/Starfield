class Particle
{  
  float rise,run;
  float X,Y;
  Particle(int s){
    X=350;
    Y=350;
    rise = speedrange(s);
    run = speedrange(s);
  }
  void splode(){
    X+=run;
    Y+=rise;
  }
  void show(){
    strokeWeight(3);
    stroke(100+4*(abs(rise)+abs(run)),100+4*(abs(rise)+abs(run)),255);
    //stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    line(X+7*run,Y+7*rise,X,Y);
  }
}
class OddballParticle //inherits from Particle
{
  //your code here
}//end of classes!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
float speedrange(int s){
  return (float)(Math.random()*(s*2)-s);
}

int amount = 500;
int spd = 10;
Particle[] bob = new Particle[amount];

void setup()
{
  size(700,700);
  for(int i = 0;i<amount;i++){
    bob[i]= new Particle(spd);
  }
}
void draw()
{
  background(0);
  for(int i = 0;i<amount;i++){
    bob[i].splode();
    bob[i].show();
    
    // Reset individual particles if they fly off-screen
    if(bob[i].X>750 || bob[i].X<-50 || bob[i].Y>750 || bob[i].Y<-50){
      bob[i].X = 350;
      bob[i].Y = 350;
      bob[i].rise = speedrange(spd);
      bob[i].run = speedrange(spd);
    }
  } 
  fill(0);
  noStroke();
  ellipse(350,350,5,5);
  //your code here
}

void mousePressed() {
  for(int i = 0; i < amount; i++) {
    bob[i].X = 350;
    bob[i].Y = 350;
    bob[i].rise = speedrange(spd);
    bob[i].run = speedrange(spd);
  }
}
