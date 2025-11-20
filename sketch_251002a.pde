PFont font;
int[] x;
int[] y;
float[] angleRotate;
int textnum=10;
void setup()
{
  size(600,600);
  fill(0);
  x=new int[textnum];
  y=new int[textnum];
  angleRotate=new float[textnum];
  for(int i=0;i<textnum;i++)
  {
    x[i]=int(random(width));
    y[i]=int(random(height));
    angleRotate[i]=random(1);
  }
  textSize(16);
  //font=createFont("LetterGothicStd.otf",128);
  //textFont(font);
 
  
}

void draw()
{
  background(255);
  
  line(0,mouseY,width,mouseY);
  line(mouseX,0,mouseX,height);
  text(str(mouseX)+","+str(mouseY), mouseX, mouseY);
  //for(int i=0;i<textnum;i++)
  //{
  //  pushMatrix();
  //  translate(x[i], y[i]);
  //  rotate(radians(angleRotate[i]));
  //textSize(map(y[i],0,height,20,10));
  //fill(map(y[i],0,height,250,70));
  //text("hello world", 0, 0);
  //popMatrix();
  
 
  //y[i]+=random(2,10);
  //angleRotate[i] += random(0.5,1);
  //if(y[i]>height) 
  //{
    
  //  y[i]=0;
  //}
  //}
  
 
}
