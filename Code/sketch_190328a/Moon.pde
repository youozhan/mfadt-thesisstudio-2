class Moon {
  float theta;
  float orbitspeed;
  float diameter;
  float distance;

  color moonColor;

  Moon(float theta_, float orbitspeed_, float distance_, float diameter_) {
    theta = theta_;
    orbitspeed = orbitspeed_;
    distance = distance_;
    diameter = diameter_;
    moonColor = color(232, 169, 63);
  }
  
  void update(){
    //theta -= 0.012;
  }
  
  void display(){
    pushMatrix();
    rotate(theta);
    translate(distance, 0);
    fill(moonColor);
    ellipse(0, 0, diameter, diameter);
    popMatrix();
  }
}
