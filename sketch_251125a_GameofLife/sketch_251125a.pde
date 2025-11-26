int cellSize=10;
int row=0,col=0;
int interval=20;
boolean pause=false;

color exist=#66CCFF;
color die=#FFFFFF;

boolean[][] cells;
boolean[][] preCells;

void setup()
{
  size(800,600);
  background(0); 
  noStroke();
  row=height/cellSize;
  col=width/cellSize;
  cells=new  boolean[col][row];
  preCells=new boolean[col][row];
  
  for(int i=0;i<col;i++)
  {
    for(int j=0;j<row;j++)
    {
      cells[i][j]=random(100)>50?false:true;
    }
  }
  
}

void draw()
{
  for(int i=0;i<col;i++)
  {
    for(int j=0;j<row;j++)
    {
      if(cells[i][j])
      {
         fill(exist);
      }
      else
      {
        fill(die);
      }
      rect(i*cellSize,j*cellSize,cellSize,cellSize);
    }
  }
  if(!pause)
  {
    if (frameCount % interval == 0) 
    {
      for(int i=0;i<col;i++)
      {
        for(int j=0;j<row;j++)
        {
            preCells[i][j]=cells[i][j];
        }
      }
      
      for(int i=0;i<col;i++)
      {
        for(int j=0;j<row;j++)
        {
           int count=0;
           for(int m=i-1;m<=i+1&&m>=0&&m<col;m++)
           {
             for(int n=j-1;n<=j+1&&n>=0&&n<row;n++)
             {
               if(m==i&&n==j)
                 continue;
               if(preCells[m][n])
                 count++;
             }
           }
           if(preCells[i][j])
           {
             if(count<2||count>3)
             cells[i][j]=false;
           }
           else
           {
             if(count==3)
             {
               cells[i][j]=true;
             }
           }
        }
      }
      
     }
  }
}

void mousePressed()
{
  if(pause)
  {
    int posX=mouseX/cellSize;
    int posY=mouseY/cellSize;
    posX=constrain(posX, 0, col-1);
    posY=constrain(posY, 0, row-1);
    if(cells[posX][posY])
      {
        cells[posX][posY]=false;
         fill(die);
      }
      else
      {
        cells[posX][posY]=true;
        fill(exist);
      }
      rect(posX*cellSize,posY*cellSize,cellSize,cellSize);
  }
}

void keyPressed()
{
  if(key==' ')
  pause=!pause;
  
  
}
