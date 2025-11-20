class Bubble {
  float angle, distance, speed, size;
  color col;
  
  Bubble(float d) {
    distance = d;
    angle = random(TWO_PI);
    speed = random(0.005, 0.03);
    size = random(5, 10);
    col = color(178, 196, 245, random(80,150));
  }
  
  void step() {
    pushMatrix();
    rotate(angle);
    translate(distance, 0);
    noStroke();
    fill(col);
    circle(0, 0, size);
    popMatrix();
    
    angle += speed;
    distance += random(-0.2,0.2);
    
  }
}

ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
float t = 0;

void setup() {
  size(600, 600);
  noStroke();
  for (int i = 0; i < 30; i++) 
  {
    bubbles.add(new Bubble(random(100, 250)));
  }
}

void draw() {
  fill(0, 30);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  t += 0.02;
  
  float floatY = sin(t*2) * 10;
  translate(0, floatY);
  
  pushMatrix();
  scale(1.2 + sin(t)*0.05); // gentle breathing
  drawJellyfish();
  popMatrix();

 pushMatrix();
 rotate(3);
 translate(200,200+floatY);
 scale(0.5,0.5);
 drawJellyfish();
 popMatrix();
  
  
}

void drawJellyfish() {
  
  stroke(130, 73, 240, 80);
  strokeWeight(1.5);
  noFill();
  
  for (int i = -4; i <= 4; i++) {
    
    pushMatrix();
    rotate(PI/12*i);
    beginShape();
    for (int y = 0; y < 180; y += 10) {
      float x = sin(t + y*0.05 + i)*20*i/5.0;
      vertex(x, y+60);
    }
    endShape();
    popMatrix();
  }
  
  noStroke();
  for (int i=0; i<5; i++) {
    fill(180,180+i, 255, 2);
    ellipse(0, 20, 210 - i, 90 - i/2);
  }
  
  for (int i=0; i<100; i++) {
    fill(150, 100+i, 255, 10);
    ellipse(0, 0, 200 - i, 120 - i/2);
  }
  
  for (Bubble b : bubbles) {
    pushMatrix();
    b.step();
    popMatrix();
  }
  
  
  
 
}
