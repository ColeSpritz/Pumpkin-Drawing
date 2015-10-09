import processing.opengl.*;
void setup()
{
  size(800, 600, OPENGL);
  noStroke();
}

void draw()
{
  background(0,0,0);
  fill(255, 130, 0);
  
  lights();
  
  pushMatrix();
  translate(width/2, height/2);
  rotateY(radians(frameCount/2));
  sphereDetail(6,20);
  sphere(150);
  popMatrix();

  
}