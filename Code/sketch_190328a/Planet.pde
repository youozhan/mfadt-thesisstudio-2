class Planet {
  float theta;
  float diameter;
  float positionx;
  float positiony;
  float orbitspeed;
  
  color planetColor;
  
  float mDistance;
  float mDiameter;
  
  String label;

  Planet(float positionx_, float positiony_, float diameter_, float theta_, float orbitspeed_, float mDistance_, float mDiameter_, String label_) {
    positionx = positionx_;
    positiony = positiony_;
    diameter = diameter_;
    theta = theta_;
    orbitspeed = orbitspeed_;
    planetColor = color(232, 169, 63);
    mDistance = mDistance_;
    mDiameter = mDiameter_;
    label = label_;
  }

  void update(){
    theta += orbitspeed;
  }
  
  void display(){
    pushMatrix();
    rotate(theta);
    translate(positionx, positiony);
    fill(planetColor);
    
    // diameter 32
    textFont(f,14);
    fill(255);
    text(label, 0, 0);
    ellipse(0, 0, diameter, diameter);
    moon();
    popMatrix();
  }
  
  void moon(){
    pushMatrix();
    rotate(-theta*4);
    translate(mDistance, 0);
    fill(planetColor);
    ellipse(0, 0, mDiameter, mDiameter);
    popMatrix();
  }

}
