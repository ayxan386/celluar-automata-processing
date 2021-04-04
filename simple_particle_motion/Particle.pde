class Particle{
  private static final float elastic_coef = 0.9;
  private final float MAX_DIST = width*width + height*height;
  public PVector position;
  public PVector velocity;
  public PVector acc = new PVector(0,0);
  public int radius;
  public color c;
  public float mass;
  
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
    circle(position.x, position.y, radius * 2);
    stroke(3);
    //noFill();
    //circle(position.x, position.y, 2*radius);
    line(position.x, position.y, position.x, position.y + radius);
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
        float dist = PVector.dist(this.position, p.position);
        //println(String.format("dist: %.4f; rads: %d\n",dist, radius + p.radius));
        if(dist <= (radius + p.radius)){
          velocity.rotate(PI);
        }
      }
    }
  }
  
  void interactWithParticles(List<Particle> particles){
    for(Particle p: particles){
      if(p != this){
        float dist = this.position.dist(p.position);
        float forceMag = map(dist, 0, MAX_DIST, 1, -1);
        applyForce(p.position.copy().sub(position).limit(0.1).mult(forceMag));
      }
    }
  }
  
  void enableAttraction(List<Particle> particles, float G){
    for(Particle p: particles){
      if(p != this){
        float dist = this.position.dist(p.position) + 100;
        float forceMag = G * mass * p.mass / (dist*dist);
        applyForce(p.position.copy().sub(position).normalize().mult(forceMag));
      }
    }
  }
  
  void applyForce(PVector f){
    acc.add(f.div(mass));
  }
}
