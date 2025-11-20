// Make five circles follow the mouse

// Five positions for storing the old mouse values
int xcoord[] = {0,0,0,0,0},
    ycoord[] = {0,0,0,0,0};
int index=0;
    
void setup()
{
  size(600,600);
}

void draw()
{
  background(255,255,255);  
  fill(0,0,0);
  
  for(int i=0;i<xcoord.length;i++)
  {
    ellipse(xcoord[i],ycoord[i],40,40);
  }
  
  // Store the mouse coordinates in the array
  xcoord[index]=mouseX;
  ycoord[index]=mouseY;
  
  // Increase index, revert to 0 from 5
  index=index+1;
  if(index>=xcoord.length)
  {
    index=0;
  }
}
