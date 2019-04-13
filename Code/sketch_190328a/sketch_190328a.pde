// learningprocessing.com Exp 14-16: Simple solar system

// Angle of rotation around sun and planets
float theta = 0;
color bgcolor = 53;
Planet[] planets;
JSONObject json;

PFont f;

void setup() {
  fullScreen();
  //size(800, 600);
  
  f = loadFont("Courier-24.vlw");
  loadData();
  
}

void draw() {
  background(bgcolor);
  noStroke();
  
  textFont(f,22);
  fill(255);
  text("Hidden Space", 70, height-80);
  textFont(f,16);
  text("Simulating The Solar System of Watching Videos", 70, height-60);

  // Translate to center of window to draw the sun.
  translate(width/2, height/2);
  
  textFont(f,14);
  //fill(255);
  text("Ad Revenue", -42, -12);
  textFont(f,18);
  text("$20.4 billion (2018)", -104, 12);
  circularSystem();
  
  for(Planet p:planets){
    p.update();
    p.display();
  }
}

void loadData(){
  json = loadJSONObject("data.json");
  JSONArray planetData = json.getJSONArray("planets");
  
  planets = new Planet[planetData.size()];
  
  for (int i=0; i<planetData.size(); i++){
    JSONObject planet = planetData.getJSONObject(i);
    JSONObject position = planet.getJSONObject("position");
    float x = position.getFloat("x");
    float y = position.getFloat("y");
    
    float diameter = planet.getFloat("diameter");
    float orbitspeed = planet.getFloat("orbitspeed");
    int mooncount = planet.getInt("mooncount");
    
    float[] moondistance = new float[mooncount];
    float[] moondiameter = new float[mooncount];
    
    for (int j=0; j<mooncount; j++){
      moondistance[j] = 24 + 3*j;
      moondiameter[j] = 6;
    }
    
    String label = planet.getString("label");
    
    planets[i] = new Planet(x, y, diameter, 0, orbitspeed, mooncount, moondistance, moondiameter, label);
  }
}

void circularSystem() {
  fill(255, 20);
  ellipse(0, 0, 64, 64);
  stroke(255, 40);
  noFill();
  fibonacci(144);
  fibonacci(377);
  fibonacci(610);
  fibonacci(987);
}

void fibonacci(int rad) {
  ellipse(0, 0, rad, rad);
}
