import processing.video.*;

Capture cam;
PImage map;

void setup() {
  size(600, 450);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
    map=loadImage("zebra.png");
    map.loadPixels();
    scale(-1,1);
    
  }      
}

void draw() {
  //pushMatrix();
  
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  //filter(BLUR,5);
  //filter(THRESHOLD,0.53);
  
  loadPixels();
  //for(int y=0;y<height;y++)
  //{
  //  for(int i=0;i<width/2;i++)
  //{
  //  int temp=pixels[y*pixelWidth+i];
  //  pixels[y*pixelWidth+i]=pixels[y*pixelWidth+width-i-1];
  //  //pixels[y*pixelWidth+width-i-1]=temp;
  //}
  //}
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
  pixels[i]=map.pixels[gray]|0xff66ccff;
}

//for(int y=0;y<height;y++)
//{
//for(int i=0;i<width;i+=3)
//{
//   int temp=pixels[y*pixelWidth+i];
//  pixels[y*pixelWidth+i]=pixels[y*pixelWidth+width-i-1];
//  //pixels[y*pixelWidth+width-i-1]=temp;
//}
//}


  
  updatePixels();
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
  //popMatrix();
}
