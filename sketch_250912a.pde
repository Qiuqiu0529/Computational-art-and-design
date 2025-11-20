int ypos;
float radius;
float minradius=5,maxradius=30;
int lastmouseX,lastmouseY;
void setup()
{
  size(600,600);
  ypos=0;
  noStroke();
  fill(#BDE3C3);
  background(255);
  radius=minradius;
}

void draw()
{
  //if(ypos>=height)
  //{
  //  ypos=0;
  //  fill(#BDE3C3);
  //}
  //if(ypos>=height/2)
  //{
  //  fill(#F5D2D2);
  //}
  //background(255);
  //circle(width/2,ypos,100);
  //ypos+=10;
  if(mouseX==lastmouseX||mouseY==lastmouseY)
  {
    radius+=0.5;
    if(radius>maxradius)
    {
      radius=minradius;
      circle(mouseX+maxradius,mouseY,random(5,maxradius/2));
      circle(mouseX-maxradius,mouseY,random(5,maxradius/2));
      circle(mouseX,mouseY-maxradius,random(5,maxradius)/2);
      circle(mouseX,mouseY+maxradius,random(5,maxradius/2));
    }
  }
  else
  {
    radius=minradius;
  }
  lastmouseX=mouseX;
  lastmouseY=mouseY;
  
  if(mousePressed)
  {
    circle(mouseX,mouseY,radius);
  }
}
