float x, y, Vx;
PVector human;
ArrayList <mosquito> swarm;
human h1;

void setup() {
  size(1500, 1000);
  Vx = 1;
  h1 = new human();
  swarm = new ArrayList<mosquito>();
}

void draw() {

  background(255);
  fill(0);

  h1.humyDisplay(mouseX, mouseY);

  for  (int i = 0; i< swarm.size(); i++) {
    mosquito m = swarm.get(i);
    
    m.update();
    m.display();
    m.seek(h1);
  }
}

void keyPressed() {
  swarm.add(new mosquito(random(0, width), random(0, height)));
}