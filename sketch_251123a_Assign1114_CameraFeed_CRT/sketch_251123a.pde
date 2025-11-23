import processing.video.*;

Capture cam;
PImage map;

void setup() {
  size(600, 450);

pixelDensity(1);
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

  }
}
  void draw() {
  if (cam.available() == true) 
  {
    cam.read();
  }
  image(cam, 0, 0); 
  
  loadPixels();
  for (int y = 0; y < height; y++) 
  {
    for (int x = 0; x < width; x++) 
    {
      color c = pixels[x + y * width];

      float r = red(c);
      float g = green(c);
      float b = blue(c);
      r = r * 1.1;
      b = b * 0.9;
      
      float gray = (r + g + b) / 3;
      r = lerp(r, gray, 0.2);
      g = lerp(g, gray, 0.2);
      b = lerp(b, gray, 0.2);

      float n = noise(x * 0.1, y * 0.1, frameCount * 0.05) * 30 - 15;
      r += n;
      g += n;
      b += n;

      if (y % 3 == 0) {
        r *= 0.7;
        g *= 0.7;
        b *= 0.7;
      }
      
      float dx = x - width/2;
      float dy = y - height/2;
      float dist = sqrt(dx*dx + dy*dy);
      float vignette = map(dist, 0, width/1.2, 1, 0.4);
      r *= vignette;
      g *= vignette;
      b *= vignette;

      pixels[x + y * width] = color(r, g, b);
    }
  }

  updatePixels();
}
