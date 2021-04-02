import java.util.*;

List<Particle> particles;

final int W = 1500;
final int H = 720;
final int K = 1;

void setup(){
  size(1500, 720);
  //frameRate(10);
  initRandomParticleArray(30);
}

void draw(){
  background(123,123,123,100);
  
  for(Particle part: particles){
    //part.applyForce(new PVector(0,0.1));
    part.collideWithParticles(particles);
    part.interactWithParticles(particles);
  }
  
  for(Particle part: particles){
    part.update();
    part.draw();
  }
}

void initRandomParticleArray(int len){
  particles = new ArrayList<Particle>();
  for(int i = 0; i < len; i++){
    Particle p1 = new Particle();
    p1.position = new PVector(random(width),random(height));
    //p1.position = PVector.random2D().mult(200);
    p1.velocity = PVector.random2D().mult(K);
    p1.radius = 20;
    p1.c = randomColor();
    particles.add(p1);
  } 
}

color randomColor(){
  return color(random(255), random(255), random(255));
}
