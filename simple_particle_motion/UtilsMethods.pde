void initRandomParticleArray(int len) {
  particles = new ArrayList<Particle>();
  for (int i = 0; i < len; i++) {
    Particle p1 = new Particle();
    p1.position = new PVector(random(width), random(height));
    //p1.position = PVector.random2D().mult(200);
    p1.velocity = PVector.random2D().mult(K);
    p1.c = randomColor();
    p1.mass = random(20) + 15;
    p1.radius = (int)p1.mass;

    if (i == 0) {
      p1.position = new PVector(width/2, height/2);
      p1.radius = 50;
      p1.c = color(255, 0, 0);
      p1.mass = 10000;
    }

    particles.add(p1);
  }
}


Particle getMParticle(float mass, int r) {
  Particle p1 = new Particle();
  p1.position = new PVector(random(width), random(height));
  p1.velocity = PVector.random2D().mult(K/10);
  p1.c = randomColor();
  p1.mass = mass;
  p1.radius = r;
  return p1;
}

color randomColor() {
  return color(random(255), random(255), random(255));
}
