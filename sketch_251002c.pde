int countX,countY;
final int gridSize=40;
int prex,prey;
void setup()
{
  
  stroke(255);
  size(600,600);
  countX=width/gridSize;
  countY=height/gridSize;
  strokeWeight(12);
  
}

void draw()
{
  if(mouseX==prex&&mouseY==prey) return;
  prex=mouseX;
  prey=mouseY;
  
  background(145,230,247);
  
  for(int i=0;i<countX;i++)
  {
    for(int j=0;j<countY;j++)
    {
      if(random(10)+map(mouseX,0,width,-9,5)>4)
      {
        line(i*gridSize,j*gridSize,(i+1)*gridSize,(j+1)*gridSize);
      }
      else
      {
        line((i+1)*gridSize,j*gridSize,i*gridSize,(j+1)*gridSize);
      }
    }
  }
}
