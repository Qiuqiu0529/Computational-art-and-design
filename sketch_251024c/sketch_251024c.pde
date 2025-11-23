IntList coords=new IntList();
int target=0;

void setup()
{
  size(800,800);
  fill(255);
}

void draw()
{
  background(0);
  
  if(mousePressed)
  {
    while(coords.size()>target)
    {
      coords.remove(coords.size()-1);
    }
    coords.append(mouseX);
    coords.append(mouseY);
    target=coords.size();
  }
  
  for(int i=0;i<target;i+=2)
  {
    circle(coords.get(i),coords.get(i+1),20);
  }
}

void keyPressed()
{
  if(key=='u'||key=='U')
  {
    if(target>0)
    {
      target-=2;
    }
  }
  if(key=='r'||key=='R')
  {
    if(target<coords.size())
    target+=2;
  }
}
