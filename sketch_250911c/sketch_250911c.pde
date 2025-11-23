int x=0;
int centralx,centraly;
void setup()
{
  size(600,600);
  centralx=width/2;
  centraly=height/2;
  fill(255,255,255,50);
  //frameRate(10);
  stroke(255);
  background(0);
  noFill();
}

void draw()
{
  if(x>width)
  {
    x=0;
  }
  x+=random(10,30);
  stroke(noise(x)*255);
  circle(centralx+random(float(-centralx),float(centralx)),centraly+random(-centraly,centraly),x);
  
}
