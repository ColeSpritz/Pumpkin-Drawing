// Daniel Shiffman
// Tracking the average location beyond a given depth threshold
// Thanks to Dan O'Sullivan

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import java.util.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;
<<<<<<< HEAD
=======

>>>>>>> 5c3eea97efcf1adaaf9e4816641a145b308f44b6

void setup() {
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  background(0);
  fill(0,130,0);
  rect(180,50,200,200);
  beginShape();
  fill(255,130,0);
  vertex(random(100,150),random(50,100));
  fill(255,130,0);
  vertex(random(50,100),random(100,150));
  fill(255,130,0);
  vertex(random(0,50),random(175,225));
   fill(255,130,0);
  vertex(random(0,50),random(300,350));
   fill(255,130,0);
  vertex(random(15,65),random(375,425));
   fill(255,130,0);
  vertex(random(75,125),random(425,475));
   fill(255,130,0);
  vertex(random(355,405),random(435,485));
   fill(255,130,0);
  vertex(random(525,575),random(400,450));
   fill(255,130,0);
  vertex(random(555,605),random(275,325));
   fill(255,130,0);
  vertex(random(575,625),random(175,225));
   fill(255,130,0);
     vertex(random(525,575),random(125,150));
   fill(255,130,0);
  vertex(random(375,425),random(75,125));
   fill(255,130,0);
  vertex(random(225,275),random(105,155));
  endShape();
  
}

void draw() {
  tracker.track();

  PVector v1 = tracker.getPos();
  PVector v2 = tracker.getLerpedPos();
    
  ///WE ADDED THIS
  stroke(255, 255, 0);
  line(v1.x, v1.y, v2.x, v2.y);

  // Display some info
  int t = tracker.getThreshold();
  fill(0);
  text("threshold: " + t + "    " +  "framerate: " + int(frameRate) + "    " + 
    "UP increase threshold, DOWN decrease threshold", 10, 500);
}

// Adjust the threshold with key presses
void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}