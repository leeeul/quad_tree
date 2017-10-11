ArrayList<PVector> points=new ArrayList<PVector>();

QT qt;
void setup() {
  size(700, 700);

  //for (int i=0; i<100; i++) {
  //  points.add(new PVector(random(width), random(height)));
  //}
  points.add(new PVector(0, 0));
}

void draw() {
  points.get(0).set(mouseX, mouseY);

  qt=new QT();
  qt.run();

  for (int i=0; i<points.size(); i++) {
    ellipse(points.get(i).x, points.get(i).y, 10, 10);
  }

  //println(frameRate);
}

void mousePressed() {
  points.add(new PVector(mouseX, mouseY));
}