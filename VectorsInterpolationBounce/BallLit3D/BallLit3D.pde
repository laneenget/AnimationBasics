float position = 200; float radius = 80;

//Setup is called once
void setup() { 
  size(600, 600, P3D); noStroke(); //600x600 3D win
} 

//Draw is called every frame
void draw() {
  background(255,255,255);  //White background
  fill(0,200,100);          //Green material
  specular(120, 120, 180);  //Setup lights… 
  ambientLight(90,90,90);   //More light…
  lightSpecular(255,255,255); shininess(20);  //More light…
  directionalLight(200, 200, 200, -1, 1, -1); //More light…
  translate(300,position); sphere(radius);   //Draw sphere
}
