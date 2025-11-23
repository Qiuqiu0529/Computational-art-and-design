color test;
void setup()
{
  size(600,600);
  frameRate(4);
}
int framecount;
void draw()
{ 
  if(random(10)>4)
  {
    test=color(255,0,0);
  }
  else
  {
    test=color(255,255,255);
  }
  fill(test);
  rect(100,100,200,200);
  
}
  
 
 
 
