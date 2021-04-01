import java.util.*;

List<Particle> particles;

final int W = 640;
final int H = 480;
final int K = 3;

void setup(){
  size(640, 480);
  
  initRandomParticleArray(10);
}

void draw(){
  background(123,123,123,100);
  for(Particle part: particles){
    part.draw();
    part.update();
  }
}

void initRandomParticleArray(int len){
  particles = new ArrayList<Particle>();
  for(int i = 0; i < len; i++){
    Particle p1 = new Particle();
    p1.position = new PVector(200,200);
    p1.velocity = PVector.random2D().mult(K);
    p1.radius = 8;
    p1.c = randomColor();
    particles.add(p1);
  } 
}

color randomColor(){
  return color(random(255), random(255), random(255));
}
