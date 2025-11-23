void setup()
{
  size(500,500);
  //noStroke();
  //for(int i=0;i<10;++i)
  //{
  //  circle(i*50+25,height/2,50);
  //}
  
  //for(int i=0;i<10;++i)
  //{
  //  if(i<1||i>8)
  //  {
  //    fill(#F01B37);
  //  }
  //  else
  //  fill(#1FB264);
  //  circle(i*50+25,height/2+100,50);
  //}
  //int x=1;
  //while(x<10)
  //{
  //  circle(x*50+25,height/2,50);
  //  x+=2;
  //}
  //fill(255);
  //while(x<5)
  //{
  //  circle(x*50+25,height/2,50);
  //  x++;
  //}
  //fill(#F01B37);
  //while(x<8)
  //{
  //  circle(x*50+25,height/2,50);
  //  x++;
  //}
  //fill(255);
  //while(x<10)
  //{
  //  circle(x*50+25,height/2,50);
  //  x++;
  //}
}


void draw()
{
  for(int i=0;i<10;i++)
  {
    for(int j=0;j<10;j++)
    {
      if(i==mouseX/50&&j==mouseY/50)
      {
        fill(#F01B37);
      }
      else
      {
        fill(255);
      }
      
      rect(i*50,j*50,40,40);
    }
  }
  
  
}
