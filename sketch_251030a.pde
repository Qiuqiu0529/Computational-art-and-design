

void setup()
{
  IntList list=new IntList();
list.append(100);
list.append(100);
list.append(#FF0000);

list.append(500);
list.append(200);
list.append(#00FF00);

list.append(300);
list.append(500);
list.append(#0000FF);

list.append(200);
list.append(400);
list.append(#808080);
  size(600,600);
  
  for(int i=0;i<4;i++)
{
  fill(list.get(i*3+2));
  circle(list.get(i*3),list.get(i*3+1),30);
}

}
