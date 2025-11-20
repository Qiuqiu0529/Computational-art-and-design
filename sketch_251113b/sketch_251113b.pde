size(420,600);
pixelDensity(1);
PImage map;
map=loadImage("zebra.png");
map.loadPixels();

loadPixels();

for(int i=0;i<pixels.length;i++)
{
  int p=pixels[i];
  int r,g,b;
  r=p>>16&0xff;
  g=p>>8&0xff;
  b=p&0xff;
  
  int gray=r+g+b;
  gray/=3;
  
  
  //r=b=g;
 //if(r+g+b>255)
 //r=g=b=255;
 //else
 //r=g=b=0;
 //r/=2;
 //b/=2;
 //g/=2;
 
  //pixels[i]=0xff000000 |r<<16| g<<8 |b;
  int x = constrain(gray, 0, map.width - 1);
  pixels[i]=map.pixels[x];

  
}
updatePixels();
