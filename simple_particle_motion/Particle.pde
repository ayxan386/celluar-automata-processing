class Particle{
  private static final float elastic_coef = 0.9;
  public PVector position;
  public PVector velocity;
  public PVector acc = new PVector(0,0);
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
    ellipseMode(CENTER);
    noStroke();
    fill(c);
    circle(position.x, position.y, radius);
    stroke(3);
    noFill();
    circle(position.x, position.y, 2*radius);
    pop();
  }
  
  void update(){
   this.velocity.add(acc);
   this.position.add(velocity);
   if(position.x + radius > W || position.x - radius < 0){
     velocity.x = -elastic_coef * velocity.x;
   }
   if(position.y  + radius > H || position.y - radius< 0){
     velocity.y = -elastic_coef * velocity.y;
   }
   acc.mult(0);
  }
  
  void collideWithParticles(List<Particle> particles){
    for(Particle p: particles){
      if(p != this){
        float dist = this.position.dist(p.position);
        if(dist <= radius){
          //PVector c = this.velocity.copy();
          //this.velocity.sub(p.velocity);
          //p.velocity.sub(c);
          velocity.rotate(-PI);
          //p.velocity.rotate(-PI);
        }
      }
    }
  }
  
  void applyForce(PVector f){
    acc.add(f);
  }
}
