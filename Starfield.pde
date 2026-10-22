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
    strokeWeight(3);
    stroke(100+4*(abs(rise)+abs(run)),100+4*(abs(rise)+abs(run)),255);
    //stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    line(X+7*run,Y+7*rise,X,Y);
    //line(X,Y,X,Y);
  }
}
class OddballParticle //inherits from Particle
{
  //your code here
}//end of classes!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
float speedrange(int s){
  return (float)(Math.random()*(s*2)-s);
}

int amount = 250;
int spd = 7;
float w = 1;
Particle[] bob = new Particle[amount];

void setup()
{
  size(2550,1430);
  for(int i = 0;i<amount;i++){
    bob[i]= new Particle(spd);
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
  fill(0);
  noStroke();
  ellipse(width/2,height/2,5,5);
  noFill();
  stroke(255);
  //ellipse(width/2,height/2,w+200,w+200);
  ellipse(width/2,height/2,w,w);
  //your code here
}

void mousePressed() {
  for(int i = 0; i < amount; i++) {
    bob[i].X = width/2;
    bob[i].Y = height/2;
    bob[i].rise = speedrange(spd);
    bob[i].run = speedrange(spd);
  }
}
