
import java.util.*;

class Actor implements Comparable<Actor>
{
  String name;
  Actor(String name)
  {
    this.name=name;
  }
  public int compareTo(Actor other)
  {
   
    return name.compareTo(other.name);
  }
  
}


String rows[]=loadStrings("http://www.kameli.net/~marq/cad/names.txt");
ArrayList<Actor> actors=new ArrayList();
for(int i=0; i<rows.length; i++)
{
  actors.add(new Actor(rows[i]));
}
Collections.sort(actors);

for(int i=0;i<rows.length;i++)
println(actors.get(i).name);
