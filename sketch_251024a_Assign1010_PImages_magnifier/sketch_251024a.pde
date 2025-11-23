PImage img;
float zoom = 2.0;
float lensSize = 150;

void setup() {
  pixelDensity(1);

  size(800, 600);
  img = loadImage("cell.jpg");
  img.resize(width, height);
  noStroke();
}

void draw() {
  background(255);
  image(img, 0, 0);

  float mx = mouseX;
  float my = mouseY;

  float sampleSize = lensSize / zoom;
  float sx = constrain(mx - sampleSize/2, 0, img.width - sampleSize);
  float sy = constrain(my - sampleSize/2, 0, img.height - sampleSize);

  PImage zoomPart = img.get(int(sx), int(sy), int(sampleSize), int(sampleSize));
  
  push();
  noStroke();
  fill(0, 80);
  ellipse(mx + 4, my + 4, lensSize * 1.05, lensSize * 1.05);
  pop();

  push();
  zoomPart.resize(int(lensSize), int(lensSize));
  
  PGraphics mask = createGraphics(int(lensSize), int(lensSize));
  mask.beginDraw();
  mask.noStroke();
  mask.ellipse(lensSize/2, lensSize/2, lensSize, lensSize);
  mask.endDraw();
  zoomPart.mask(mask);

  imageMode(CENTER);
  image(zoomPart, mx, my);
  pop();

  noFill();
  stroke(255, 180);
  strokeWeight(3);
  ellipse(mx, my, lensSize, lensSize);
 
}
