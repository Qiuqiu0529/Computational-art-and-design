void setup()
{
  background(255);
  float arr[]={0.5,2.3,1.1,7.0};
  float empty[]={};
  println(largest(7,2,5));
  println(largest(-1,10,0));
  println(average(arr));
  println(average(empty));
  size(800,400);
  //recurse(10);
 // bubble(width/2,height/2,100);
 
  squares(0,0,height);
}
float angle=0;

void draw()
{
  
  //smileface
  //fill(255,0,0);
  //rect(200,200,200,200);
  //if(mousePressed)
  //{
  //  if(inside(200,200,400,400))
  //  {
  //  exit();
  //}
  //}
  
  //if(mousePressed)
  //{
  //  smilely(mouseX,mouseY);
  //}
  
  
  //branch(width/2,height,100);
  
  //angle+=0.02;
  //angle%=3.18;
  //bubble(width/2,height/2,200);
}


void squares(int x,int y,float sLength)
{
  int count = int(height / sLength);
  for(int i=0;i<count;i++)
  {
    rect(x,y+i*sLength,sLength,sLength);
  }
  
  if(sLength>5)
  {
    squares(int(x+sLength),y,sLength/2);
    
  }
}

void bubble(int x,int y,int diameter)
{
  circle(x,y,diameter);
  if(diameter>10)
  {
    bubble(int(x+diameter*cos(angle)),int(y+diameter*sin(angle)),diameter/2);
    bubble(int(x+diameter*cos(angle+2)),int(y+diameter*sin(angle+2)),diameter/2);
    bubble(int(x+diameter*cos(angle+4)),int(y+diameter*sin(angle+4)),diameter/2);
    //bubble(int(x+diameter*cos(angle+6)),int(y+diameter*sin(angle+6)),diameter/2);
    //bubble(int(x-diameter*cos(angle)),y,diameter/2);
    //bubble(x,y+diameter,diameter/2);
    //bubble(x,y-diameter,diameter/2);
  }
}

void recurse(int iteration)
{
  if(iteration>1) recurse(iteration-1);
  println(iteration);
}



boolean inside(int left,int top,int right,int bottom)
{
  return mouseX<=right&&mouseX>=left&&mouseY<=bottom&&mouseY>=top;
}

int largest(int a, int b,int c)
{
  return a>b?(a>c?a:c):(b>c?b:c);
}

float average(float[] a)
{
  if(a.length<=0) return 0;
  float sum=0;
  for(int i=0;i<a.length;i++)
  {
    sum+=a[i];
  }
  return sum/a.length;
}

void branch(int x,int y,int spread)
{
  stroke(mouseX%255,mouseY%255,mouseX%255,70);
  strokeWeight(map(spread,0,100,1,4));
  line(x,y,x-spread,y-100);
  line(x,y,x+spread,y-100);
  
  if(y>0)
  {
    branch(x-spread,y-100,spread/2);
    branch(x+spread,y-100,spread/2);
  }
}

void smilely(int x,int y)
{
  fill(255);
  circle(x,y,50);
  fill(0);
  circle(x-10,y-10,10);
  circle(x+10,y-10,10);
  noFill();
  arc(x,y+10, 20, 10, QUARTER_PI-0.5,QUARTER_PI*3+0.5);
}

boolean contains(int arr[],int value)
{
  for(int i=0;i<arr.length;i++)
  {
    if(arr[i]==value) return true;
  }
  
  return false;
}
