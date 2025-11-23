//float a=0;

void setup()
{
size(800,800);
pushMatrix();
translate(200,200);
rotate(PI/4);
scale(2,1);
background(255);
rect(0,0,50,50);
popMatrix();

rect(0,0,50,50);
}

//void draw()
//{
//  final float RADIUS=200;
  
//  float x=cos(a*3)*RADIUS;
//  float y=sin(a)*RADIUS;
  
//  noStroke();
//  fill(#8AC9F0);
//  circle(width/2+x,height/2+y,20);
  
//  a+=0.04;
//}
