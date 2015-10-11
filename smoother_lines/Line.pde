class Line {
  float x1;
  float y1;
  float x2;
  float y2;
  
  Line(PVector v1, PVector v2) {
    x1 = v1.x;
    y1 = v1.y;
    x2 = v2.x;
    y2 = v2.y;
  }
  
  void drawLine() {
    line(this.x1, this.y1, this.x2, this.y2);
  }
}