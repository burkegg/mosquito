class mosquito {

  PVector loc;
  PVector vel;
  PVector accel;
  PVector human;
  float maxForce, maxSpeed, theta, r, rad, t;
  PVector steer, oscillator;

  mosquito(float x, float y) {
    accel = new PVector (0, 0);
    vel = new PVector (0, 0);
    loc = new PVector (x, y);
    oscillator = new PVector(0, 0);
    r = 2;
    maxForce = 0.15;
    maxSpeed = 4;
    rad = 100;
  }


  void update() {
    vel.add(accel);
    vel.limit(maxSpeed);
    loc.add(vel);
    accel.mult(0);
  }

  void applyForce(PVector force) {
    accel.add(force);
  }

  void seek(human h) {

    //setting up random motion around the human
    theta = map(noise(t), 0, 1, -2*PI, 2*PI);
    t += .2;
    float x = rad*cos(theta);
    float y = rad*sin(theta);
    oscillator.set(x+h.hloc.x, y+h.hloc.y);
    //  ellipse(x+h.hloc.x, y+h.hloc.y, 5, 5);
    PVector desired = PVector.sub(oscillator, loc);
    float fMult = 1;
    maxSpeed = 6;
    if ((desired.mag() < 175)&&(mouseX==pmouseX)&&(mouseY == pmouseY)) {
      maxSpeed = map(desired.mag(), 0, 175, 0, 6);
      rad = 0;
    } else if (desired.mag() < 175) {
      fMult = -28;
    } else {
      maxSpeed = 4;
      rad = 160;
    }

    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer = PVector.sub(desired, vel);
    steer.limit(maxForce);
    applyForce(steer.mult(fMult));

    if (loc.x < 125) {
      PVector des = new PVector(maxSpeed, vel.y);
      steer = PVector.sub(des, vel);
      steer.limit(maxForce);
      applyForce(steer);
    }
  }


void display() {
  float theta = vel.heading() +PI/2;
  fill(0);
  stroke(0);
  pushMatrix();
  translate(loc.x, loc.y);
  rotate(theta);
  beginShape();
  vertex(0, -r*2);
  vertex(-r, r*2);
  vertex(r, r*2);
  endShape(CLOSE);
  popMatrix();
}
}