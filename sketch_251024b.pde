void setup()
{
  size(600,600);
  noStroke();
  fill(0);
  String rows[]=loadStrings("http://www.kameli.net/~marq/cad/mystery.txt");
 
  for(int i=0;i<rows.length;i++)
  {
    String parts[];
    parts=split(rows[i],",");
    circle(int(parts[0]),int(parts[1]),2);
  }
  
}
