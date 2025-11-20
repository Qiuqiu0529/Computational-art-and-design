// Transformation homework, add your own code

void setup()
{
  size(600,600);
}

void draw()
{
  background(0);
  fill(255,0,0);
  noStroke();

  // *** Modify anything only between these lines ***
  
  // 1st arrow
  pushMatrix();
  translate(width/2,height/2);
  rotate(PI/2);
  arrow();
  popMatrix();
  
  // 2nd arrow
  pushMatrix();
  translate((width/4)*3,(height/3));
  scale(3,3);
  arrow();
  popMatrix();

  // 3rd arrow
  pushMatrix();
  translate((width/6),(height/6)*5);
  scale(2,2);
  rotate(PI);
  arrow();
  popMatrix();
  
  // *** Modify end ***
}

// Draw an upward arrow at 0,0
void arrow()
{
  rect(-20,0, 40,50);
  triangle(0,-50, 40, 0, -40,0);
}
