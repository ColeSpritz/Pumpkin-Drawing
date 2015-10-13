import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import java.util.*;

// The kinect stuff is happening in another class
KinectTracker tracker;
Kinect kinect;
PImage pumpkin;
int count;

boolean withinPumpkin(PVector point) {
  return (pow((point.x-285),2)/pow(195,2)) + (pow((point.y-280),2)/pow(187.5,2)) <= 1;
}

void setup() {
  size(640, 480);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  pumpkin = loadImage("pumpkin.jpg");
  background(pumpkin);
  count = 1;
}

void draw() {
  //DONE button
  beginShape();
    vertex(580, 0);
    vertex(640, 0);
    vertex(640, 20);
    vertex(580, 20);
  endShape(CLOSE);
  
  //Estimation of pumpkin dimensions:
  //ellipse(285, 280, 390, 375);
  
  tracker.track();

  PVector v1 = tracker.getPos();
  PVector v2 = tracker.getPrevPos();
  
  if ((v1.x > 580) && (v1.y < 20)) {
    String filename = "pumpkin-"+count+".jpg";
    save(filename);
    count++;
    background(pumpkin);
    delay(500);
  } else if (withinPumpkin(v1) && PVector.dist(v1,v2) < 20) {
    stroke(255, 255, 0);
    strokeWeight(7);
    line(v1.x, v1.y, v2.x, v2.y);
  }
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