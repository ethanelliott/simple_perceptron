Perceptron brain;

Point[] points = new Point[200];

int trainingIndex = 0;

class UserPoint {
  float x;
  float y;
  UserPoint(float _x, float _y) {
    x = _x;
    y = _y;
  }
  void change(float _x, float _y) {
    x = _x;
    y = _y;
  }
  void show() {
    fill(0, 0, 255);
    noStroke();
    ellipse(x, y, 20, 20);
  }
}

UserPoint up;

void setup() {
  size(800, 800);
  frameRate(60);
  brain = new Perceptron();
  
  up = new UserPoint(0,0);

  for (int i = 0; i < points.length; i++) {
    points[i] = new Point();
  }
}

void mousePressed() {
  float pX = mouseX - (width/2);
  float pY = mouseY - (height/2);
  up.change(pX, pY);
  float[] inputs = {up.x, up.y};
  int clickGuess = brain.guess(inputs);
  println(clickGuess);
}

void draw() {
  background(255);
  stroke(0);
  translate(width/2, height/2);
  line(-width/2, -height/2, width/2, height/2);
  float fLineSlope = brain.weights[0] / brain.weights[1];
  float fLine1 = fLineSlope * (width/2);
  float fLine2 = fLineSlope * (-width/2);
  stroke(255, 0, 0);
  line(-width/2, fLine1, width/2, fLine2);
  for (Point pt : points) {
    pt.show();
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    int guess = brain.guess(inputs);
    if (guess == target) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    noStroke();
    ellipse(pt.x, pt.y, 16, 16);
    Point training = points[trainingIndex];
    float[] trainingInputs = {training.x, training.y};
    int trainingTarget = training.label;
    brain.train(trainingInputs, trainingTarget);
    trainingIndex++;
    if (trainingIndex == points.length) {
      trainingIndex = 0;
    }
  }
  up.show();
}