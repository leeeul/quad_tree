int phaseLimit = 8;

class QT {
  int phase;
  PVector axis;
  PVector size;
  ArrayList<PVector> targets;  

  QT t1; //NW
  QT t2; //NE
  QT t3; //SE
  QT t4; //SW

  QT() {
    phase = 1;
    axis = new PVector(width/2, height/2);
    size = new PVector(width, height);
    targets=(ArrayList<PVector>)points.clone();
  }

  QT(int phase_, PVector axis_, PVector size_, ArrayList<PVector> targets_) {
    phase = phase_;
    axis = axis_;
    size = size_;
    targets = searchTarget(axis, size, targets_);
  }

  ArrayList<PVector> searchTarget(PVector axis_, PVector size_, ArrayList<PVector> targets_) {
    ArrayList<PVector> temp=new ArrayList<PVector>();

    for (int i=targets_.size()-1; i>=0; i--) {
      PVector vec = targets_.get(i);

      if ((axis_.x-size_.x/2)<=vec.x && (axis.x+size_.x/2)>vec.x) {
        if ((axis_.y-size_.y/2)<=vec.y && (axis.y+size_.y/2)>vec.y) {
          temp.add(vec);
          targets_.remove(targets_.get(i));
          //println("remove!");
        }
      } else {
        //println("pass");
        continue;
      }
    }

    return temp;
  }

  void spawn() {
    if (phase<phaseLimit) {
             //QT(int phase_, PVector axis_, PVector size_, ArrayList<PVector> targets_)
      t1 = new QT(phase+1, PVector.add(axis, new PVector(-size.x/4, -size.y/4)), PVector.mult(size, .5), targets);
      t2 = new QT(phase+1, PVector.add(axis, new PVector(size.x/4, -size.y/4)), PVector.mult(size, .5), targets);
      t3 = new QT(phase+1, PVector.add(axis, new PVector(size.x/4, size.y/4)), PVector.mult(size, .5), targets);
      t4 = new QT(phase+1, PVector.add(axis, new PVector(-size.x/4, size.y/4)), PVector.mult(size, .5), targets);
      
      t1.run();
      t2.run();
      t3.run();
      t4.run();
    }else{
      drawRect();
    }
  }

  void run() {
    if (targets.size()>0) {
      spawn();
    } else {
      drawRect();
    }
  }

  void drawRect() {
    rectMode(CENTER);
    fill(255);
    strokeWeight(1);
    stroke(0);
    rect(axis.x, axis.y, size.x, size.y);
  }
}