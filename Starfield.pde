class Particle
{  
  float rise,run;
  float X,Y;
  Particle(int s){
    X=500;
    Y=500;
    rise = (float)(Math.random()*speedrange(s))-s;
    run = (float)(Math.random()*speedrange(s))-s;
  }
  void splode(){
    X+=run;
    Y+=rise;
  }
  void show(){
    stroke(128,128,255);
    line(X-run,Y-rise,X,Y);
  }
}
class OddballParticle //inherits from Particle
{
  //your code here
}//end of classes!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
float speedrange(int s){
  return (float)(Math.random()*(s*2+1)-s);
}

int amount = 1000;
int spd = 10;
Particle[] bob = new Particle[amount];

void setup()
{
  size(1000,1000);
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
    if(bob[i].X>1050 || bob[i].X<-50 || bob[i].Y>1050 || bob[i].Y<-50){
      bob[i].X = 500;
      bob[i].Y = 500;
      bob[i].rise = (float)(Math.random()*21)-spd;
      bob[i].run = (float)(Math.random()*21)-spd;
    }
  } 
  fill(0);
  stroke(0);
  ellipse(500,500,10,10);
  //your code here
}
