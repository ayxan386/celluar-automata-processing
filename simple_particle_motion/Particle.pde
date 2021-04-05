class Particle{
  private static final float elastic_coef = 0.9;
  private final float MAX_DIST = width*width + height*height;
  private static final float eps = 0.6;
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
    //line(position.x, position.y, position.x + velocity.x * 15, position.y + velocity.y * 15);
    pop();
  }
  
  void update(){
   this.velocity.add(acc);
   acc.mult(0);
   if(velocity.mag() < 0.01)return;
   this.position.add(velocity);
   if(position.x + radius > W || position.x - radius < 0){
     velocity.x = -elastic_coef * velocity.x;
   }
   if(position.y  + radius > H || position.y - radius< 0){
     velocity.y = -elastic_coef * velocity.y;
   }
  }
  
  void collideWithParticles(List<Particle> particles){
    float S = 40;
    for(Particle p: particles){
      if(p != this){
        float dist = PVector.dist(this.position, p.position);
        //println(String.format("dist: %.4f; rads: %d\n",dist, radius + p.radius));
        if(dist <= (radius + p.radius) * 1.1){
          PVector dir = velocity.copy().rotate(-PI).normalize();
          PVector totalMomentum = velocity.copy().mult(mass).add(p.velocity.copy().mult(p.mass));
          float mag = totalMomentum.mag() * eps;
          dir.mult(mag);
          //stroke(c);
          //strokeWeight(2);
          //line(position.x, position.y, position.x + dir.x * S, position.y + dir.y * S);
          velocity = dir.div(mass);
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
    float S = 400;
    for(Particle p: particles){
      if(p != this){
        float dist = this.position.dist(p.position) + 100;
        float forceMag = G * mass * p.mass / (dist*dist);
        PVector force = p.position.copy().sub(position).normalize().mult(forceMag);
        applyForce(force);
        //stroke(255, 0, 0);
        //strokeWeight(2);
        //line(position.x, position.y, position.x + force.x * S, position.y + force.y * S);
      }
    }
  }
  
  void applyForce(PVector f){
    acc.add(f.div(mass));
  }
}
