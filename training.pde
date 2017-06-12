class Point {
  float x;
  float y;
  int label;

  Point() {
    x = random(-width/2, width/2);
    y = random(-height/2, height/2);

    if (x >= y) {
      label = 1;
    } else {
      label = -1;
    }
  }

  void show() {
    stroke(0);
    if (label == 1) {
      fill(255);
    } else {
      fill(0);
    }
    ellipse(x, y, 32, 32 );
  }
}