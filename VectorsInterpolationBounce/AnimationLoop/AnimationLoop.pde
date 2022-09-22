static int numParticles = 30;
Vec2 pos[] = new Vec2[numParticles];
Vec2 vel[] = new Vec2[numParticles];

void setup() { //Automatically called by Processing at start-up
  size(640,480);
  surface.setTitle("Animation Loop [CSCI 5611 Example]");
  for (int i = 0; i < numParticles; i++){
    pos[i] = new Vec2(200+random(300),200+random(200));
    vel[i] = new Vec2(0.0,40+random(20));
  }
}

float time = 0, endTime = 5;
void update(float dt) { //update based on how much time has passed
  for (int i = 0; i < numParticles; i++) {
    pos[i].add(vel[i].times(dt));
    if (pos[i].y > floor - r){
      pos[i].y = floor - r;
      vel[i].y *= -0.8;
    }
  }
}

void draw() { //Automatically called by processing each frame
  update(1.0/frameRate);
  background(255); //White background
  stroke(0,0,0);
  fill(10,120,10);
  for (int i = 0; i < numParticles; i++) {
    circle(pos[i].x, pos[i].y, r*2);
  }
}
