class Particle{
 
  public PVector position;
  public PVector velocity;
  public int radius;
  public color c;
  
  public Particle(PVector p,PVector v,int r,color col){
    this.position = p;
    this.velocity = v;
    this.radius = r;
    this.c = col;
  }
  public Particle(){
  }
  
  void draw(){
    push();
    noStroke();
    fill(c);
    circle(position.x, position.y, radius);
    pop();
  }
  
  void update(){
   this.position.add(velocity);
  }
}