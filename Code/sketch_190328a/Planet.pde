class Planet {
  float theta;
  float diameter;
  float positionx;
  float positiony;
  float orbitspeed;

  color planetColor;

  float mooncount;
  //float mDistance;
  //float mDiameter;

  String label;
  Moon[] moons;

  Planet(float positionx_, float positiony_, float diameter_, float theta_, float orbitspeed_, int mooncount_, float[] mdistance, float[] mdiameter, String label_) {
    positionx = positionx_;
    positiony = positiony_;
    diameter = diameter_;
    theta = theta_;
    orbitspeed = orbitspeed_;
    planetColor = color(232, 169, 63);
    mooncount = mooncount_;

    moons = new Moon[mooncount_];
    for (int i=0; i<mooncount_; i++) {
      moons[i] =new Moon(-theta_*4, orbitspeed_, mdistance[i], mdiameter[i]);
      //moons[i] =new Moon(0, 24+2*i, 12);
    }

    //mDistance = mDistance_;
    //mDiameter = mDiameter_;
    label = label_;
  }

  void update() {
    theta += orbitspeed;

    for (Moon m : moons) {
      //m.update();
      m.theta = - theta*4;
    }
  }

  void display() {
    pushMatrix();
    rotate(theta);
    translate(positionx, positiony);

    // diameter 32
    fill(planetColor);
    ellipse(0, 0, diameter, diameter);
    textFont(f, 10);
    fill(255);
    text(label, 0, 0);

    //moon();
    //for (Moon m : moons) {
    //  m.display();
    //}

    for (int i=0; i<moons.length; i++){
      moons[i].display(i);
    }
    
    popMatrix();
  }
}
