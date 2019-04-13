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
  
  void display(float index){
    pushMatrix();
    rotate(theta);
    translate(distance*cos(PI/3*index), distance*sin(PI/3*index));
    fill(moonColor);
    ellipse(0, 0, diameter, diameter);
    popMatrix();
  }
}
