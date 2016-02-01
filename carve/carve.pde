import org.openkinect.freenect.*;
import org.openkinect.processing.*;
import java.util.*;

KinectTracker tracker;
Kinect kinect;
PImage startScreen;
PImage pumpkin;
int count;
boolean drawMode;

boolean withinPumpkin(PVector point) {
  //Estimation of pumpkin dimensions:
  //ellipse(285, 280, 390, 375);
  return (pow((point.x-285),2)/pow(195,2)) + (pow((point.y-280),2)/pow(187.5,2)) <= 1;
}

void setup() {
  size(640, 480);
  fullScreen();
  kinect = new Kinect(this);
  tracker = new KinectTracker();
  startScreen = loadImage("instructions.jpg");
  drawMode = false;
  pumpkin = loadImage("pumpkin.jpg");
  background(startScreen);
  count = 1;
}

void draw() {  
  tracker.track();
  PVector v1 = tracker.getPos();
  PVector v2 = tracker.getPrevPos();
  
  if (drawMode) {
    if ((v1.x > 580) && (v1.y < 60)) {
      String filename = "pumpkin-"+count+".jpg";
      save(filename);
      count++;
      drawMode = false;
      background(startScreen);
    } else if (!withinPumpkin(v1)) {
      noFill();
      stroke(0);
      strokeWeight(1);
      ellipse(v1.x, v1.y, 5, 5);
    } else if (PVector.dist(v1,v2) < 40) {
      stroke(255, 255, 0);
      strokeWeight(7);
      line(v1.x, v1.y, v2.x, v2.y);
    } 
  } else {
    noFill();
    stroke(0);
    strokeWeight(1);
    ellipse(v1.x, v1.y, 5, 5);
    if (v1.x > 140 && v1.x < 500 && v1.y > 360) {
      drawMode = true;
      background(pumpkin);
    }
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