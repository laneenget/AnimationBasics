//Mouse Follow
//CSCI 5611 Mouse Following with Vec2 [Starter]
//Instructor: Stephen J. Guy <sjguy@umn.edu>


//Here is what you should discuss & try to code as a group:
//  **1. Initially, the code shows a dark red circle with a purple-ish outline.
//     Change the program to draw a red circle with a black outline instead.
//  **2. Find the Processing.org reference pages for the circle command. 
//     Why am I multiplying the radius by 2? (Note: these reference pages are 
//     very useful, be sure to check them out for general Processing help.)
//  **3. Change the background color to be white instead green.
//  **4. Have the ball follow the user's mouse. You should do this by setting
//      dir to be the vector pointing from the ball's current position (pos)
//      to the mouse's current position (mousePos).
//  **5. Try to get some keyboard input working:  
//        -When the user presses the 'd' key, double the speed the ball moves. 
//        -When the user presses the 'h' key, half the speed the ball moves. 
//  6. The simple approach is Step 4 will leave the ball jittering when it
//     reaches the mouse. Find a strategy to fix the jitter so the ball stops
//     completely when it is nicely centered on the mouse.
//  **7. Currently, the variable 'speed' doesn't have a well defined unit and its
//     effect depends on the framerate. Fix this by using dt in the update function
//     to make sure the speed value means "pixels per second". Set the speed to
//     100 pixels per second. Make sure the ball takes about 6.4 seconds to make
//     it 640 pixels across the screen.
     
//As a challenge:
//  1. Give the ball a maximum acceleration (i.e. limit how fast it's velocity can change).
//  2. Draw an image (sprite) instead of a circle. Try to orient it in the direction of travel.


int strokeWidth = 2;
void setup(){
  size(640,480);
  surface.setTitle("Mouse Following [CSCI 5611 Example]");
  
  //Initial circle position
  pos = new Vec2(200,200);
  r = 50;
  
  vel = new Vec2(0.0,0.0); //intial velocity
  
  strokeWeight(strokeWidth); //Draw thicker lines 
}

Vec2 pos; //Circle position
Vec2 vel; //Circle velocity
float r;  //Circle radius

float speed = 4;

void update(float dt){
  Vec2 mousePos = new Vec2(mouseX, mouseY);
  Vec2 dir = new Vec2(mousePos.x-pos.x,mousePos.y-pos.y); //Should be vector pointing from pos to MousePos
  if (dir.length() > 0) dir.normalize();
  if (speed*dt > dir.length()) {
    pos.x = mouseX;
    pos.y = mouseY;
    vel.x = 0.0;
    vel.y = 0.0;
  } else {
    vel = dir.times(speed+100*dt);
    pos.add(vel);
  }
}

void draw(){
  update(1/frameRate);
  background(255,255,255); //White background
  stroke(23,32,42); //black
  fill(255,0,0); //red
  circle(pos.x, pos.y,r*2); //Question: Why is it radius*2 ?
                            //Answer: The circle function takes the width and height
                            //of the circle as the third parameter, so it needs the
                            //diameter of the circle instead of the radius
}

void keyPressed(){
  if (key == 'd'){
    println("Doubling ball speed");
    speed *= 2;
  }
  if (key == 'h'){
    println("Halving ball speed");
    speed *= 0.5;
  }
  println("Speed is now:",speed);
}




//Begin the Vec2 Library
//Normally I would put this in a differen tab, but having it here allows you to
// copy and paste a single file for shared editing and for submission

public class Vec2 {
  public float x, y;
  
  public Vec2(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  public String toString(){
    return "(" + x+ "," + y +")";
  }
  
  public float length(){
    return sqrt(x*x+y*y);
  }
  
  public float lengthSqr(){
    return x*x+y*y;
  }
  
  public Vec2 plus(Vec2 rhs){
    return new Vec2(x+rhs.x, y+rhs.y);
  }
  
  public void add(Vec2 rhs){
    x += rhs.x;
    y += rhs.y;
  }
  
  public Vec2 minus(Vec2 rhs){
    return new Vec2(x-rhs.x, y-rhs.y);
  }
  
  public void subtract(Vec2 rhs){
    x -= rhs.x;
    y -= rhs.y;
  }
  
  public Vec2 times(float rhs){
    return new Vec2(x*rhs, y*rhs);
  }
  
  public void mul(float rhs){
    x *= rhs;
    y *= rhs;
  }
  
  public void clampToLength(float maxL){
    float magnitude = sqrt(x*x + y*y);
    if (magnitude > maxL){
      x *= maxL/magnitude;
      y *= maxL/magnitude;
    }
  }
  
  public void setToLength(float newL){
    float magnitude = sqrt(x*x + y*y);
    x *= newL/magnitude;
    y *= newL/magnitude;
  }
  
  public void normalize(){
    float magnitude = sqrt(x*x + y*y);
    x /= magnitude;
    y /= magnitude;
  }
  
  public Vec2 normalized(){
    float magnitude = sqrt(x*x + y*y);
    return new Vec2(x/magnitude, y/magnitude);
  }
  
  public float distanceTo(Vec2 rhs){
    float dx = rhs.x - x;
    float dy = rhs.y - y;
    return sqrt(dx*dx + dy*dy);
  }
}

Vec2 interpolate(Vec2 a, Vec2 b, float t){
  return a.plus((b.minus(a)).times(t));
}

float interpolate(float a, float b, float t){
  return a + ((b-a)*t);
}

float dot(Vec2 a, Vec2 b){
  return a.x*b.x + a.y*b.y;
}

Vec2 projAB(Vec2 a, Vec2 b){
  return b.times(a.x*b.x + a.y*b.y);
}
