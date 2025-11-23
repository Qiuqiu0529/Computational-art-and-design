int data[]={100,100,#FF0000,
500,200,#00FF00,
300,500,#0000FF,
200,400,#808080};
void setup()
{
  size(600,600);


for(int i=0;i<4;i++)
{
  fill(data[i*3+2]);
  circle(data[i*3],data[i*3+1],100);
}
}
