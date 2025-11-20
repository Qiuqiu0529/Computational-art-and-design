
void setup()
{
size(800,800);
}

void draw()
{
  background(255);
  line(width/2,height/2,mouseX,mouseY);
  line(width/2,height/2,mouseX,height/2);
  //line(mouseX,height/2,mouseX,mouseY);
  
  //println(distance(width/2,height/2,mouseX,mouseY));
  println(angle(width/2,height/2,mouseX,mouseY));
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
