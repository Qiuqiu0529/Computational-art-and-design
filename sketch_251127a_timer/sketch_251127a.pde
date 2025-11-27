int selH = 0, selM = 1, selS = 0;
boolean playing = false;
int totalSeconds;
float hourAngle, minAngle, secAngle;
int lastSecond = -1;
int lastMinute =-1;
int lastHour=-1;

boolean timerFinished = false;
int startTime;

ArrayList<DigitParticle> particles = new ArrayList<DigitParticle>();
PFont font;

void setup() 
{
  size(800, 800);
  pixelDensity(1);
  smooth();
}

void draw() 
{
  background(255);
  if (!playing) 
  {
    drawTimeSelector();
  } 
  else 
  {
    drawClock();
    updateTimer();
    if(timerFinished) drawReturnButton();
    updateParticles();
  }
}

void drawTimeSelector() 
{
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("Timer", width/2, 100);
  textSize(30);
  text(selH + " h", width/2 - 100, height/2);
  text(selM + " m", width/2, height/2);
  text(selS + " s", width/2 + 100, height/2);

  rectMode(CENTER);
  fill(80);
  rect(width/2, height - 150, 200, 70, 12);
  fill(255);
  text("PLAY", width/2, height - 150);
  
  fill(0);
  text("Q/A change hours, W/S change minutes, E/D change seconds", width/2, height - 20);
}

void updateTimer()
{
  int elapsed = (millis() - startTime) / 1000;
  if(elapsed >= totalSeconds)
  {
    timerFinished = true;
  }
}
void drawReturnButton()
{
  resetMatrix();
  rectMode(CENTER);
  fill(0);
  rect(width/2, height - 80, 220, 60, 12);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(24);
  text("RETURN", width/2, height - 80);
}

void mousePressed() 
{
  if (!playing) 
  {
    if (mouseY > height - 200 && mouseY < height - 100)
    {
      playing = true;
      totalSeconds = selH * 3600 + selM * 60 + selS;
      startTime = millis();
    }
  }
  else
  {
     if (timerFinished && mouseY > height - 150 && mouseY < height - 80)
     {
      playing = false;
      timerFinished = false;
      particles.clear();
      lastSecond = -1;
      lastMinute = -1;
      lastHour = -1;
    }
  }
}

void keyPressed() 
{
  if (!playing) 
  {
    if (key == 'q') selH = (selH + 1) % 24;
    if (key == 'a') selH = (selH - 1 + 24) % 24;
    if (key == 'w') selM = (selM + 1) % 60;
    if (key == 's') selM = (selM - 1 + 60) % 60;
    if (key == 'e') selS = (selS + 1) % 60;
    if (key == 'd') selS = (selS - 1 + 60) % 60;
  }
}


void drawClock() 
{
  translate(width/2, height/2);
  stroke(0);
  noFill();
  strokeWeight(2);
  ellipse(0, 0, 400, 400);
  
  fill(0);
  textSize(20);
  for (int i = 1; i <= 12; i++) 
  {
    float a = map(i, 0, 12, 0, TWO_PI);
    float r = 180;
    float tx = cos(a - PI/2) * r;
    float ty = sin(a - PI/2) * r;
    textAlign(CENTER, CENTER);
    text(i, tx, ty);
  }
     
  int h = hour();
  int m = minute();
  int s = second();

  secAngle = map(s, 0, 60, 0, TWO_PI);
  minAngle = map(m + s/60.0, 0, 60, 0, TWO_PI);
  hourAngle = map((h % 12) + m/60.0, 0, 12, 0, TWO_PI);

  drawHand(secAngle, 160,2, #A5A5A5);
  drawHand(minAngle, 130,4, #7E7E7E);
  drawHand(hourAngle, 90,6, #363636);
  
  if(timerFinished)
  {
    return;
  }
  

  if (s != lastSecond && s % 5 == 0) 
  {
    int num = s / 5;
    if (num == 0) num = 12;
    float angle = map(num, 0, 12, 0, TWO_PI);
    spawnDigitAt(num, angle);
    lastSecond = s;
  }
  if (m != lastMinute && m % 5 == 0) 
  {
    int num = m / 5;
    if (num == 0) num = 12;
    float angle = map(num, 0, 12, 0, TWO_PI);
    spawnDigitAt(num, angle);
    lastMinute=m;
  }
  
  if(h!=lastHour)
  {
    int num = h%12;
    if (num == 0) num = 12;
    float angle = map(num, 0, 12, 0, TWO_PI);
    spawnDigitAt(num, angle);
    lastHour=h;
  }
}

void drawHand(float angle, float len, float weight, color c) 
{
  stroke(c);
  strokeWeight(weight);
  line(0, 0, cos(angle - PI/2) * len, sin(angle - PI/2) * len);
}

void spawnDigitAt(int num, float angle) 
{
  float r = 180;
  float tx = cos(angle - PI/2) * r;
  float ty = sin(angle - PI/2) * r;
  particles.add(new DigitParticle(str(num), tx, ty));
}

void updateParticles() 
{
  for (int i = particles.size()-1; i >=0; i--) 
  {
    DigitParticle p = particles.get(i);
    p.update();
    p.checkCollision(particles);
    p.display();
  }
}

class DigitParticle 
{
  PVector pos;
  PVector vel; 
  String val;
  float x, y;
  float size;
  float rot,rotSpeed;
  color c;
  boolean stopped = false;

  DigitParticle(String v, float x, float y) 
  {
    this.val = v;
    pos = new PVector(x, y);
    vel = new PVector(random(-1,1), random(0.5,2));
    this.x = x;
    this.y = y;
    size=32;
    rot = random(TWO_PI);
    rotSpeed = random(-0.08, 0.08);
    c = color(random(255), random(255), random(255));
  }

  void update() 
  {
    if (!stopped) 
    {
      vel.y += 0.03;
      vel.x *= 0.995;
      rotSpeed *= 0.99;
      pos.add(vel);
      rot += rotSpeed;
    }
  }

  void stop() 
  {
    stopped = true;
    vel.set(0, 0);
    rotSpeed = 0;
  }
  void checkCollision(ArrayList<DigitParticle> others)
  {
    if (stopped) return;
    if (pos.y + size/2 >= height/2)
    {
      pos.y = height/2 - size/2;
      vel.y *= -0.3;
      vel.x *= 0.9;
      if (abs(vel.y) < 0.3) stop();
    }
    for (DigitParticle o : others)
    {
      if (o == this || !o.stopped) continue;
      if (dist(pos.x, pos.y, o.pos.x, o.pos.y) < size)
      {
        if (pos.y < o.pos.y)
        {
          pos.y = o.pos.y - size * 0.9;
          vel.y *= -0.2;
          vel.x += random(-0.3, 0.3);
          rotSpeed += random(-0.05, 0.05);
          if (abs(vel.y) < 0.2) stop();
        }
       }
      }
   }

  void display() 
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rot);
    fill(c);
    textSize(size);
    textAlign(CENTER, CENTER);
    text(val, 0, 0);
    popMatrix();
  }
}
