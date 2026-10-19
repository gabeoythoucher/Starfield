//your code here
Particle bob;
void setup()
{
  size(1000,1000);
  Particle[] bob = new Particle[100];
}
void draw()
{
  for(int i = 0;i<100;i++){
    bob[i]= new Particle();
  }
  background(255);
  bob.splode();
  bob.show();
  //your code here
}
class Particle
{  
  float rise,run;
  float X,Y;
  Particle(){
    X=500;
    Y=500;
    rise = (float)(Math.random()*51)-25;
    run = (float)(Math.random()*51)-25;
  }
  void splode(){
    X+=run;
    Y+=rise;
  }
  void show(){
    line(X-run,Y-rise,X,Y);
  }
  //your code here
}
class OddballParticle //inherits from Particle
{
  //your code here
}


