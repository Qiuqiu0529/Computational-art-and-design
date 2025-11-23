// Solar system simulation using transformations

class Orb
{
  // Attributes
  protected int col;
  protected float size,speed,angle,distance;
  protected ArrayList<Orb> children;
  
  // Methods
  Orb(int col,float size,float speed,float distance)
  {
    this.col=col; // Set up the Orb
    this.size=size;
    this.speed=speed;
    angle=0;
    this.distance=distance;
    children=new ArrayList<Orb>();
  }
  // Add a child Orb
  public void addChild(Orb child)
  {
    children.add(child); // Append to the list
  }
  // Run the simulation
  public void step()
  {
    // Draw the orbit
    noFill();
    stroke(#555555,30);
    circle(0,0, distance*2);
    
    // Step the simulation
    angle=angle+speed;
    rotate(angle);
    translate(distance,0);
    
    // Draw the orb
    noStroke();
    fill(col);
    circle(0,0, size);
    
    // Draw the children
    for(int i=0; i<children.size(); i++)
    {
      pushMatrix(); // Save the transformation
      // Call the child
      children.get(i).step();
      popMatrix(); // Retrieve the old transformation
    }
  }
}

// Declare the Orbs
Orb sun, planet1,planet2, moon1,moon2,moon3;

void setup()
{
  size(600,600);
  background(0);
  
  // Create the sun, planets and moons
  sun=new Orb(#ffffff,100,0,0);
  
  planet1=new Orb(#00ff00,50,0.01,120);
  planet2=new Orb(#0000ff,40,-0.01,250);

  moon1=new Orb(#777777,10,0.02,40);
  moon2=new Orb(#777777,10,0.02,40);
  moon3=new Orb(#777777,10,-0.01,60);
  
  // Build the tree
  sun.addChild(planet1);
  sun.addChild(planet2);

  planet1.addChild(moon1);
  planet2.addChild(moon2);
  planet2.addChild(moon3);
}

void draw()
{
  //background(0);
  // Poor man's motion blur
  fill(0,40); // Translucent black
  rect(-1,-1, width+2,height+2);
  
  translate(width/2,height/2); // Center the origo
  
  sun.step(); // Run the simulation
}
