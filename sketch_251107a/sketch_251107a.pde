float t=0;
void setup()
{
size(600,600);
pixelDensity(1);
frameRate(4);
}

void draw()
{
  t+=0.2;
  //background(255);
  loadPixels();
  for(int i=0;i<pixels.length;i++)
  {
    pixels[i]=#000000;
  }
  //putPixel(mouseX,mouseY,#ff0000);
  //rectangle(0,0,mouseX,mouseY,#ff0000);
  test(#66ccff);
  updatePixels();
}
void test(int col)
{
  for (int i =0; i <= width; i+=10) 
  {
    drawrect(i,int(random(height)),col);
    //putPixel(i,int(random(height)),col);
  }
}

void drawrect(int x,int y,int col)
{
  float temp=sin(t)*20/5.0+5;
  for(int i=x-int(temp);i<x+int(temp);i++)
  {
    for(int j=y-int(temp);j<y+int(temp);j++)
    {
      putPixel(i,j,int(random(col-100,col+80)));
    }
    
  }
}

void putPixel(int x,int y,int col)
{
  if(x<0||y<0||x>=width||y>=height)return;
  
  pixels[x+y*width]=col;
}

void rectangle(int left,int top,int right,int buttom,int col)
{
  for(int i=top;i<buttom;i++)
  {
    for(int j=left;j<right;j++)
    {
       putPixel(j,i,col);
    }
  }
}
