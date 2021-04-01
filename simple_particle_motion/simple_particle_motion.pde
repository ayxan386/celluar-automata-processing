Particle p = new Particle();

final int W = 400;
final int H = 400;

void setup(){
  size(400, 400);
  background(123);
  
  p.position = new PVector(200,200);
  p.velocity = PVector.random2D().mult(2);
  p.radius = 5;
  p.c = color(0,0,255);
}

void draw(){
  p.draw();
  p.update();
}
