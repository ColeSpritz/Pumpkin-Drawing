import org.openkinect.processing.*;
import org.openkinect.*;

KinectTracker tracker;
Kinect kinect;

void setup() {
  kinect = new Kinect(this);
  kinect.initDevice();
  size(640,480);
  background(0);
}

void draw() {
  tracker.track();
  stroke(255);
  int[]depth = kinect.getRawDepth();
  PVector v1 = tracker.getPos();
  if (depth < 550) {
    line( v1.x, v1.y);
  }
  
}

void stop() {
  tracker.quit();
  super.stop();
}

class KinectTracker {
  int kw = 640;
  int kh = 480;
  int threshold = 745;
  PVector loc;
  int[] depth;
  
  KinectTracker(){
    kinect.start();
    kinect.enableDepth(true);
    loc = new PVector(0,0);
  }
  void track() {
    depth = kinect.getRawDepth();
    if (depth == null) return;
    float sumX = 0;
    float sumY = 0;
    float count = 0;
    for(int x = 0; x < kw; x++){
      for(int y = 0; y < kh; y++){
        int offset = kw-x-1+y*kw;
        int rawDepth = depth[offset];
        if (rawDepth < threshold) {
          sumX += x; sumY += y; count++;
        }
      }
    }
    if (count != 0) {
      loc = new PVector(sumX/count,sumY/count);
    }
  }
  PVector getPos(){
    return loc;
  }
  
  void quit() {
    kinect.quit();
  }
  int getThreshold() {
    return threshold;
  }
  
  