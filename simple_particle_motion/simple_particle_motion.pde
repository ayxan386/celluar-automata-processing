import java.util.*;
import controlP5.*;

List<Particle> particles;

final int W = 1500;
final int H = 720;
final int K = 1;
float G = 9e-5;

ControlP5 cp5;

void setup() {
  size(1500, 720);
  //frameRate(10);
  //initRandomParticleArray(30);
  cp5 = new ControlP5(this);
  cp5.addSlider("G value")
    .setPosition(100, 15)
    .setRange(0, 0.01)
    .setWidth(900)
    .setValue(G)
    .addCallback(new CallbackListener() {
    public void controlEvent(CallbackEvent e) {
      G = (float)e.getController().getValue();
    }
  }
  );
  initCustomerPartilces();
  background(123, 123, 123, 100);
}

void draw() {
  background(123,123,123,100);

  for (Particle part : particles) {
    //part.applyForce(new PVector(0,0.1));
    part.collideWithParticles(particles);
    //part.interactWithParticles(particles);
    part.enableAttraction(particles, G);
  }

  for (Particle part : particles) {
    if (part.mass < 100) {
      part.update();
    }
    part.draw();
  }
  noLoop();
}

void initCustomerPartilces() {
  particles = new ArrayList<Particle>();
  Particle p1 = getMParticle(10000000, 100);
  p1.position = new PVector(width/2 - 120, height/2 + 10);
  p1.velocity = PVector.random2D().mult(K/100);
  particles.add(p1);
  
  p1 = getMParticle(10000000, 100);
  p1.position = new PVector(width/2 + 120, height/2 - 10);
  particles.add(p1);
  p1 = getMParticle(10000000, 100);
  p1.position = new PVector(width/2, height/2 - 150);
  particles.add(p1);
  
  for (int i = 0; i < 4; i++) {
    p1 = getMParticle(10, 10);
    p1.velocity = new PVector(0,random(1));
    p1.position = new PVector(width/2 + random(50), height/2 + random(50));
    particles.add(p1);
  }
}



void slider(float theColor) {
  println("a slider event. setting background to "+theColor);
}
