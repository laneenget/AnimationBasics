//Simulation-Driven Animation
//CSCI 5611 Example - Bouncing Balls
// Stephen J. Guy <sjguy@umn.edu>

static int numParticles = 60;

float r = 5;
//Inital positions and velocities of masses
Vec2 pos[] = new Vec2[numParticles];
Vec2 vel[] = new Vec2[numParticles];

Vec2 spherePos = new Vec2(300,400);
float sphereRadius = 60;

void setup(){
  size(640,480);
  surface.setTitle("Falling Balls [CSCI 5611 Example]");
  
  //Initial boid positions and velocities
  for (int i = 0; i < numParticles; i++){
    pos[i] = new Vec2(200+random(300),100+random(200));
    vel[i] = new Vec2(random(40),100+random(20)); 
  }
  
  strokeWeight(2); //Draw thicker lines 
}

void update(float dt){
  for (int i = 0; i <  numParticles; i++){
    pos[i].add(vel[i].times(dt));
    if (pos[i].y > height - r){
      pos[i].y = height - r;
      vel[i].y *= -0.8;
    }
    if (pos[i].y < r){
      pos[i].y = r;
      vel[i].y *= -0.8;
    }
    if (pos[i].x > width - r){
      pos[i].x = width - r;
      vel[i].x *= -0.8;
    }
    if (pos[i].x < r){
      pos[i].x = r;
      vel[i].x *= -0.8;
    }
    
    if (pos[i].distanceTo(spherePos) < (sphereRadius+r)){
      //TODO: Code to bounce the balls off of a sphere goes here...
      //Find sphere normal at point of contact
      //Move along the normal be to no longer colliding with the sphere
      //Compute the bounce equation
    }
  }
}


void draw(){
  update(1.0/frameRate);
  
  background(255); //White background
  stroke(0,0,0);
  fill(10,120,10);
  for (int i = 0; i < numParticles; i++){
    circle(pos[i].x, pos[i].y, r*2); 
  }
  
  fill(180,60,40);
  circle(spherePos.x, spherePos.y, sphereRadius*2);
}
