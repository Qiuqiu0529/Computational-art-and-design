int ypos;
float radius;
float minradius=40,maxradius=60;
int lastmouseX,lastmouseY;
void setup()
{
  size(600,400);
  ypos=0;
  noStroke();
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
    //if(mouseX<200)
    //{
    //  fill(#0A0606);
    //}
    //else if(mouseX<400)
    //{
      
    //  fill(#F7D83C);
    //}
    //else
    //{fill(#D32929);
    //}
    if(mouseX<220&&mouseX>180||(mouseY>150&&mouseY<220))
    {
      fill(#1676F0);
    }
    else
    {
      fill(#F7FBFF);
    }
    circle(mouseX,mouseY,radius);
  }
}
