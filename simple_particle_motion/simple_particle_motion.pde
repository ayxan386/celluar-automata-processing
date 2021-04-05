import java.util.*;
import controlP5.*;

List<Particle> particles;

final int W = 1500;
final int H = 720;
final int K = 1;
float G = 0.43;

ControlP5 cp5;

void setup() {
  size(1500, 720);
  //frameRate(5);
  //initRandomParticleArray(30);
  cp5 = new ControlP5(this);
  cp5.addSlider("G value")
    .setPosition(100, 15)
    .setRange(0, 1)
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
    part.update();
    part.draw();
  }
  //noLoop();
}

void initCustomerPartilces() {
  particles = new ArrayList<Particle>();
  Particle p1 = getMParticle(1000, 50);
  p1.position = new PVector(500, 200);
  particles.add(p1);
  
  p1 = getMParticle(1000, 50);
  p1.position = new PVector(width - 55, height - 55);
  particles.add(p1);
  p1 = getMParticle(1000, 50);
  p1.position = new PVector(55, height - 55);
  particles.add(p1);
  
  for (int i = 0; i < 10; i++) {
    p1 = getMParticle(10, 5);
    p1.velocity = PVector.random2D().mult(2);
    p1.position = new PVector(random(width), random(height));
    //p1.position = new PVector(400, 400);
    particles.add(p1);
  }
}



void slider(float theColor) {
  println("a slider event. setting background to "+theColor);
}
