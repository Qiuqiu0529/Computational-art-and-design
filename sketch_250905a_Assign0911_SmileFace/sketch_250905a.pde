void setup()
{
  strokeWeight(2); 
  noFill();
  background(240); 
  size(800,700);
  frameRate(8);
  
}

float faceX=200,faceY=240;
float faceW=400,faceH=350;

void draw()
{
  faceX=lerp(faceX,mouseX,0.5);
  faceY=lerp(faceY,mouseY,0.5);
  
  background(240); 
  noFill();
  stroke(0);
  rect(faceX-faceW/2,faceY-faceH/2+20,faceW,faceH); //face

  fill(0);
  //eyebrow
  line(faceX-50,faceY-50,faceX-100,faceY-60); 
  line(faceX+50,faceY-50,faceX+100,faceY-60); 

float size=random(20,25);
//eyes
circle(faceX-80,faceY+10,25+size); 
circle(faceX+80,faceY+10,25+size); 

//light in eyes
fill(255);
circle(faceX-85,faceY,size); 
circle(faceX+78,faceY,size);
  
ellipse(faceX-85,faceY+10,size-5,5); 
ellipse(faceX+78,faceY+10,size-5,5);

//mouth
int mouthtop=int(faceY)+100+int(random(-5,5));
noFill();
//line(faceX-50,mouthtop,faceX,mouthtop-10); 
//line(faceX-30,mouthtop+20,faceX-50,mouthtop); 
//line(faceX+50,mouthtop,faceX,mouthtop-10); 
//line(faceX+50,mouthtop,faceX,mouthtop+50); 
//line(faceX-50,mouthtop,faceX,mouthtop+50);
//arc(fa);
arc(faceX,mouthtop-40, 70, 80, QUARTER_PI-0.5,QUARTER_PI*3+0.5);

//red face
fill(227,38,54,120); 
noStroke();
int redsize=int(random(70,80));
ellipse(faceX-110,faceY+40,redsize,redsize/2); 
ellipse(faceX+120,faceY+40,redsize,redsize/2);
}
