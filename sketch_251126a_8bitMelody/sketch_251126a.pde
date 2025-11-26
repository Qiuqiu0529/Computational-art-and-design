import ddf.minim.*;

Minim minim;
AudioOutput out;
final int FREQUENCY=48000;
float leftdata[];
float rightdata[];

float melody[] = 
{
  659.25, 523.25, 587.33, 659.25,
  784.00, 659.25, 587.33, 523.25,
  587.33, 659.25, 523.25, 440.00,
  392.00, 440.00, 523.25, 0
};

int durations[] = 
{
  200,200,200,200,
  300,200,200,400,
  200,200,200,300,
  300,300,600,400
};

int noteIndex = 0;
int lastTime = 0;

class Synth implements AudioSignal
{
  protected float volume,lVol,rVol,panning,frequency;
  protected int count;
  protected float leftdata[],rightdata[];
  
  Synth()
  {
    volume=1;
    panning=0.5;
    frequency=0;
    count=0;
    lVol=1;
    rVol=1;
  }
  public void SetFrequency(float val)
  {
    frequency=val;
  }
  public void SetPanning(float val)
  {
    panning=val;
    lVol=cos(panning*PI/2);
    rVol=sin(panning*PI/2);
  }
  public void setVolume(float volumen)
  {
    volume=volumen;
  }
  public void setLVolume(float volumen)
  {
    lVol=volumen;
  }
  public void setRVolume(float volumen)
  {
    rVol=volumen;
  }
  
  public void generate(float left[],float right[])
  { 
    for(int i=0;i<left.length;i++,count++)
    {
      left[i]=right[i]=oscSaw(frequency*count/FREQUENCY);
      
      left[i]*=volume*lVol;
      right[i]*=volume*rVol;
      if(i<leftdata.length)
      {
        leftdata[i]=left[i];
        rightdata[i]=right[i];
      }
    }
    
  }
  
  void generate(float samples[])
  {
    
  }
  
  public void visualize(float left[],float right[])
  {
    leftdata=left;
    rightdata=right;
    
  }
  
  float oscSin(float t)
  {
    t=t%1;
    return sin(t*2*PI);
  }
  
  float square(float t)
  {
    t=t%1;
    return t<0.5?1:-1;
  }
  float saw(float t)
  {
    t=t%1;
    return t*2-1;
  }
  
  float oscSaw(float t)
  {
    t=t%1;
    if(t<0.5)
    return t;
    return 1-t;
  }
}
Synth s;

float[] left=new float[100];
float[] right=new float[100];

void setup()
{
  frameRate(10);
size(800,600);
leftdata=new float[width];
rightdata=new float[width];

minim=new Minim(this);
out=minim.getLineOut(Minim.STEREO,2048,FREQUENCY,16);
s=new Synth();
s.visualize(leftdata,rightdata);
s.SetFrequency(392);
out.addSignal(s);
}
void draw()
{
  background(0);
  if(millis()-lastTime>durations[noteIndex])
  {
     s.SetFrequency(melody[noteIndex]);
     noteIndex +=1;
     noteIndex%=melody.length;
     lastTime=millis();
  }
  //s.generate(left,right);
  s.SetPanning(float(mouseX)/float(width));
  s.setVolume(float(mouseY)/float(height));
  noStroke();
  for(int i=0;i<leftdata.length;i++)
    {
      circle(i,150-leftdata[i]*200,2);
      circle(i,450-rightdata[i]*200,2);
    }
}
float notes[]={130.81,138.59,146.83,155.56,164.81,174.61,185,196,207.65,220,233.08,246.94};
char keys[]={'q','2','w','3','e','r','5','t','6','y','7','u'};
void keyPressed()
{
  for (int i = 0; i < keys.length; i++)
  {
    if (key == keys[i])
    {
      s.SetFrequency(notes[i]);
      return;
    }
  }
}

void keyReleased()
{
  s.SetFrequency(0);
}
