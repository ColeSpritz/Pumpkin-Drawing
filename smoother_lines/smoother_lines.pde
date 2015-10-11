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
  background(255);
}

ArrayList<Line> lines;

void draw() {
  tracker.track();

  PVector v1 = tracker.getPos();
  PVector v2 = tracker.getPrevPos();

  Line newLine = new Line(v1, v2);
  newLine.drawLine();
    
  ///WE ADDED THIS
  

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