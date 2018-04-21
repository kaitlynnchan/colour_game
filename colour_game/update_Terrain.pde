void updateTerrain() {
}

void makeStart() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.setFillColor(pale);
  b.setStrokeColor(pale);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("start");
  world.add(b);
}

void makeColorChanger(){
  FCircle b = new FCircle(gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(colorBall);
  b.setStatic(true);
  b.setRotatable(true);
  b.setGrabbable(false);
  b.setSensor(true);
  b.setName("color changer");
  world.add(b);
}

void makeWalls(){
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.setFillColor(black);
  b.setStrokeColor(black);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("walls");
  world.add(b);
}