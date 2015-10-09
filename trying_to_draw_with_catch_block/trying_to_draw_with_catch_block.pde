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


void setup() {
  size(640, 520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

ArrayList<PVector> pVectors;

void draw() {
  background(0);

  // Run the tracking analysis
  tracker.track();

 try {
   
    PVector v1 = tracker.getPos();
    PVector v2 = tracker.getLerpedPos();
    
    //if (v1 != null && v2 != null) {
      pVectors.add(v1);
      pVectors.add(v2);

    
    ///WE ADDED THIS
      stroke(255);
      for (int i = 0; i < pVectors.size(); i++) {
        line(pVectors.get(i).x, pVectors.get(i).y, pVectors.get(i+1).x, pVectors.get(i+1).y);
      }
    } catch (NullPointerException e) {
    }

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