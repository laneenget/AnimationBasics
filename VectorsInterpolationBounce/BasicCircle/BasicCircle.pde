//Processing Basics
//CSCI 5611 Example - Basic Circle
// Stephen J. Guy <sjguy@umn.edu>

float pos_x, pos_y, r; //Current circle position and radius

int strokeWidth = 2;
void setup(){ //Automatically called by processing at start
  size(640,480);
  surface.setTitle("Basic 2D Circle [CSCI 5611 Example]");
  pos_x = 200; pos_y = 200; r = 50;
  strokeWeight(strokeWidth); //Draw thicker lines 
}

float time = 0;
void update(float dt){ //update based on how much time as past
  time += dt;
}

void draw(){ //Automatically called by processing each frame
  update(1.0/frameRate);
  background(255); //Grey background
  stroke(0,0,0);
  fill(10,120,10);
  circle(pos_x, pos_y,r*2); //Question: Why is it radius*2 ?
}
