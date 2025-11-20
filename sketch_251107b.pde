size(600,600);

pixelDensity(1);
PImage p;
p=loadImage("http://www.kameli.net/~marq/cad/bubblebobble.png");
p.loadPixels();

loadPixels();
println(pixels.length);
for(int i=0;i<p.height;i++)
{
  for(int j=0;j<p.width;j++)
  {
    pixels[i*width+j]=p.pixels[i*p.width+j];
  }
}

updatePixels();
