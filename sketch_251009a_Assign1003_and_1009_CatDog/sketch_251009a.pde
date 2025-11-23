Cat cat1;
Cat cat2;
Dog dog;

void setup() {
  size(800, 600);
  cat1 = new Cat(100, 300, color(#ED788D),1);
  cat2 = new Cat(600, 300, color(#78ADED),2.5);
  dog=new Dog(300, 300, color(#78ADED),2.5);
}

void draw() {
  background(240);

  cat1.update(mouseX, mouseY);
  cat2.update(mouseX, mouseY);
  dog.update(mouseX, mouseY);

  cat1.display();
  cat2.display();
  dog.display();
}


class Cat {
  float x, y,speed;
  color c;

  Cat(float x_, float y_, color c_,float speed_) {
    x = x_;
    y = y_;
    c = c_;
    speed=speed_;
  }

  void update(float targetX, float targetY) {
    
    float dx = targetX - x;
    float dy = targetY - y;
    float dist = sqrt(dx*dx + dy*dy);
    if (dist > 2) {
      x += dx / dist * speed;
      y += dy / dist * speed;
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);

    float angle = atan2(mouseY - y, mouseX - x);
    rotate(angle);

    noStroke();
    
    fill(c);
  triangle(-40, -30, -20, -80, 0, -30);
  triangle(0, -30, 20, -80, 40, -30);

  fill(#F5C08F);
  ellipse(0, 0, 100, 100);

  fill(0);
  ellipse(-20, -10, 10, 12);
  ellipse(20, -10, 10, 12); 
  fill(255);
  
  ellipse(-22, -10, 3, 3);
  ellipse(18, -10, 3, 3); 

  fill(c);
  triangle(-5, 5, 5, 5, 0, 12); 

  stroke(0);
  strokeWeight(1);
  line(0, 12, 0, 20);        
  line(0, 20, -5, 25);  
  line(0, 20, 5, 25);      

    popMatrix();
  }
}

class Dog extends Cat
{
  float size=100;
  Dog(float x_, float y_, color c_,float speed_)
  {
    super(x_,y_,c_,speed_);
  }
  void update(float targetX, float targetY) {
    
    float dx = targetX - x;
    float dy = targetY - y;
    float dist = sqrt(dx*dx + dy*dy);
    if (dist < 300) {
      x -= dx / dist * speed;
      y -= dy / dist * speed;
    }
    if(x<0)
    {
    x=0;
  }
  if(y<0)
  y=0;
  if(x>width)x=width;
  if(y>height)y=height;
  }

  void display() {
    pushMatrix();
    translate(x, y);

    float angle = atan2(mouseY - y, mouseX - x);
    rotate(-angle);

    noStroke();
    
    

  fill(#D2A679);
  ellipse(0, 0, 110, 100);

  fill(0);
  ellipse(-20, -10, 13, 12);
  ellipse(20, -10, 13, 12); 
  fill(255);
  
  ellipse(-22, -12, 3, 3);
  ellipse(18, -12, 3, 3); 

  fill(c);
  ellipse(0, 5, 15, 10); 
  
  fill(c);
  ellipse(-50, -10, 30, 50);
  ellipse(50, -10, 30, 50);

  stroke(0);
  strokeWeight(1.5);
  line(0, 12, 0, 28);        
  line(0, 28, -8, 20);  
  line(0, 28, 8, 20);  
  
  
  

    popMatrix();
  }
}
