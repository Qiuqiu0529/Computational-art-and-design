float radius=40;
ArrayList<TraceEye> traceeyes=new ArrayList();
void setup()
{
size(800,800);

for(int i=0;i<10;i++)
{
  TraceEye temp=new TraceEye(random(width),random(height),random(20,50),random(0.5,2));
  traceeyes.add(temp);
}
}

class TraceEye
{
  float x0,y0;
  float radius;
  float speed;
  float targetx,targety;
  float targetxran,targetyran;
  TraceEye(float initx,float inity,float initradius,float initSpeed)
  {
    x0=initx;
    y0=inity;
    radius=initradius;
    speed=initSpeed;
    targetxran=random(-50,50);
    targetyran=random(-50,50);
  }
  
  public void display()
  {
    circle(x0,y0,radius);
    targetx=mouseX+targetxran;
    targety=mouseY+targetyran;
  
  float dx=targetx-x0;
  float dy=targety-y0;
  float distance1=dist(targetx,targety,x0,y0);
  if(distance1!=0)
  {
    float dxnorm,dynorm;
    dxnorm=dx/distance1;
    dynorm=dy/distance1;
    x0+=dxnorm*speed;
    y0+=dynorm*speed;
    
    line(x0,y0,x0+dxnorm*50,y0+dynorm*50);
    circle(x0+radius/4*dxnorm,y0+radius/4*dynorm,radius/2);
    
  }
  }
}

void draw()
{
  background(255);
  for(int i=0;i<10;i++)
{
  
  traceeyes.get(i).display();
}
  
  
}


float distance(float x1,float y1,float x2,float y2)
{
  return sqrt((x1-x2)*(x1-x2)
  +(y1-y2)*(y1-y2));
}

float angle(float x1,float y1,float x2,float y2)
{
  float dx=x2-x1;
  float dy=y2-y1;
  
  return atan2(dy,dx);
}
