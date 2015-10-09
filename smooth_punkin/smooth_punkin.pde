void setup() {
  size(640,480,P2D);
  noStroke();
  smooth();
}
 
void draw() {
  background(0);
  beginShape();
  fill(255,130,0);
  curveVertex(random(100,150),random(50,100));
  fill(255,130,0);
  curveVertex(random(50,100),random(100,150));
  fill(255,130,0);
  curveVertex(random(0,50),random(175,225));
   fill(255,130,0);
  curveVertex(random(0,50),random(300,350));
   fill(255,130,0);
  curveVertex(random(15,65),random(375,425));
   fill(255,130,0);
  curveVertex(random(75,125),random(425,475));
   fill(255,130,0);
  curveVertex(random(355,405),random(435,485));
   fill(255,130,0);
  curveVertex(random(525,575),random(400,450));
   fill(255,130,0);
  curveVertex(random(555,605),random(275,325));
   fill(255,130,0);
  curveVertex(random(575,625),random(175,225));
   fill(255,130,0);
  curveVertex(random(525,575),random(125,150));
   fill(255,130,0);
  curveVertex(random(375,425),random(75,125));
   fill(255,130,0);
  curveVertex(random(225,275),random(105,155));
  endShape();
  noLoop();
}