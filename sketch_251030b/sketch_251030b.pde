// Who earns the most in Finland?
import java.util.Collections;
import java.util.ArrayList;
import java.util.*;

class Job implements Comparable<Job>
{
  protected String title,sector;
  protected int salary;
  
  Job(String title,int salary,String sector)
  {
    this.title=title; // Solve name conflict with "this"
    this.salary=salary;
    this.sector=sector;
  }
  public String toString() // For printing object data
  {
    return title+" "+str(salary)+" "+sector;
  }
  public int getSalary() // Return the salary
  {
    return salary;
  }
  public int compareTo(Job other)
  {
    if(salary<other.getSalary())
    return -1;
    else if(salary==other.getSalary())
    return 0;
    return 1;
  }
}

// Load the data in
String rows[]=loadStrings("http://www.kameli.net/~marq/cad/salaries.tsv");

ArrayList<Job> jobs=new ArrayList(); // Array for holding the jobs

// Create the jobs out of data rows
for(int i=0; i<rows.length; i++)
{
  String data[]=split(rows[i],"\t"); // Split by tab
  if(int(data[1])>0)
  {
    jobs.add(new Job(data[0],int(data[1]),data[2]));
  }
  
}

Collections.sort(jobs);

//for(int i=0; i<10; i++) // Go through the jobs
//{
//  println(jobs.get(i));
//}

for(int i=jobs.size()-1;i>jobs.size()-11;i--)
{
  println(jobs.get(i));
}
