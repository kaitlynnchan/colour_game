void loadWorld() {

  //init world
  Fisica.init(this);
  world = new FWorld(-1000, -1000, 10000, 10000);//-1000, -1000, 10000, 10000
  world.setGravity(0, 980);

  while (y < map.height) {
    color c = map.get(x, y);
    if (c == orange) makeCharacter();
    if (c == pale) makeStart();
    if (c == red) {
      Obstacle o = new Obstacle();
      o.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2); //x * gridSize + gridSize/2, random(0, 200) * gridSize + gridSize/2
      world.add(o);
      enemies.add(o);
    }
    if (c == blue) makeColorChanger();
    if (c == lavender) {
      Obstacle2 o = new Obstacle2();
      o.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
      world.add(o);
      enemies.add(o);
    }
    if (c == green) {
      Obstacle3 o = new Obstacle3();
      o.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
      world.add(o);
      enemies.add(o);
    }
    if (c == yellow) {
      Obstacle4 o = new Obstacle4();
      o.vertex(x * gridSize + gridSize/2, y * gridSize - gridSize);
      o.vertex(x * gridSize - gridSize*2 + gridSize/2, y * gridSize + gridSize*2);
      o.vertex(x * gridSize + gridSize*2 + gridSize/2, y * gridSize + gridSize*2);
      world.add(o);
      enemies2.add(o);
    }
    
    if (c == purple) {
      Obstacle5 o = new Obstacle5();
      o.setPosition(x * gridSize - gridSize/2, y * gridSize + gridSize);
      world.add(o);
      enemies3.add(o);
    }
    if (c == black) makeWalls();

    x++;
    if (x > map.width) {
      y++;
      x = 0;
    }
  }
}