void updateEnemies() {

  for (FBox enemy : enemies) {

    if (enemy.getName().equals("obstacle1")) {
      ((Obstacle) enemy).act();
    }
    if (enemy.getName().equals("obstacle2")) {
      ((Obstacle2) enemy).act();
    }
    if (enemy.getName().equals("obstacle3")) {
      ((Obstacle3) enemy).act();
    }
  }
  
  for (FPoly enemy : enemies2){
    if (enemy.getName().equals("obstacle4")) {
      ((Obstacle4) enemy).act();
    }
  }
  
  for (FCircle enemy : enemies3){
    if (enemy.getName().equals("obstacle5")) {
      ((Obstacle5) enemy).act();
    }
  }
  
}

class Obstacle extends FBox {

  int direction, speed;

  Obstacle() {
    super(gridSize, gridSize);
    this.setStaticBody(true);
    this.setGrabbable(false);
    this.setRotatable(true);
    this.setName("obstacle1");

    cObstacle = (int)random(0, 3);


    direction = 1;
    speed = 50;
  }

  void act() {
    //color array
    color[] colors = {
      red, orange, lavender
    };

    this.setFillColor(colors[cObstacle]);
    this.setStrokeColor(colors[cObstacle]);
    //this.setVelocity(speed * direction, this.getVelocityY());
    if (touching("player")) {
      if (cObstacle == cPlayer) {
        this.setSensor(true);
      } else {
        this.setSensor(false);
      }
    }
  }

  boolean touching(String thing) {
    ArrayList<FContact> contacts = this.getContacts();

    for (FContact c : contacts) {
      if (c.contains("obstacle1", thing)) {
        return true;
      }
    }
    return false;
  }
}


class Obstacle2 extends FBox {

  int direction, speed;

  Obstacle2() {
    super(gridSize, gridSize);
    this.setStaticBody(false);
    this.setGrabbable(false);
    this.setRotatable(false);
    this.setName("obstacle2");

    cObstacle2 = (int)random(0, 3);


    direction = 1;
    speed = 75;
  }

  void act() {
    //color array
    color[] colors = {
      red, orange, lavender
    };

    this.setFillColor(colors[cObstacle2]);
    this.setStrokeColor(colors[cObstacle2]);

    //this.setFillColor(lavender);
    //this.setStrokeColor(lavender);
    this.setVelocity(speed * direction, -16.5);
    if (touching("player")) {
      if (cObstacle2 == cPlayer) {
        this.setSensor(true);
      } else {
        this.setSensor(false);
        //player.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
      }
    }
    if(touching("walls")){
      direction *= -1;
      this.setPosition(getX() + direction, getY());      
    }
  }

  boolean touching(String thing) {
    ArrayList<FContact> contacts = this.getContacts();

    for (FContact c : contacts) {
      if (c.contains("obstacle2", thing)) {
        return true;
      }
    }
    return false;
  }
}


class Obstacle3 extends FBox {

  int direction, speed;

  Obstacle3() {
    super(gridSize * 3, gridSize);
    this.setStaticBody(true);
    this.setGrabbable(false);
    this.setName("obstacle3");
    cObstacle3 = (int)random(0, 3);
    direction = 1;
    speed = 0;
  }

  void act() {
    //color array
    color[] colors = {
      red, orange, lavender
    };

    this.setFillColor(colors[cObstacle3]);
    this.setStrokeColor(colors[cObstacle3]);
    this.setRotation(1);
    this.adjustRotation(speed);
    if(frameCount % 20 == 0){
    speed += 1;
      
    }
    if (touching("player")) {
      if (cObstacle3 == cPlayer) {
        this.setSensor(true);
      } else {
        this.setSensor(false);
      }
    }
  }

  boolean touching(String thing) {
    ArrayList<FContact> contacts = this.getContacts();

    for (FContact c : contacts) {
      if (c.contains("obstacle3", thing)) {
        return true;
      }
    }
    return false;
  }
}

class Obstacle4 extends FPoly {

  int direction, speed;

  Obstacle4() {
    this.setStaticBody(true);
    this.setGrabbable(false);
    this.setName("obstacle4");

    cObstacle4 = (int)random(0, 3);

    direction = 1;
    speed = 0;
  }

  void act() {
    //color array
    color[] colors = {
      red, orange, lavender
    };

    this.setNoFill();
    this.setStrokeWeight(8);
    this.setStrokeColor(colors[cObstacle4]);
    //this.setRotation(1);
    //this.adjustRotation(speed);
    //if(frameCount % 20 == 0){
    //speed += 1;
    //}
    
    if (touching("player")) {
      if (cObstacle4 == cPlayer) {
        this.setSensor(true);
      } else {
        this.setSensor(false);
      }
    }
  }

  boolean touching(String thing) {
    ArrayList<FContact> contacts = this.getContacts();

    for (FContact c : contacts) {
      if (c.contains("obstacle4", thing)) {
        return true;
      }
    }
    return false;
  }
}

class Obstacle5 extends FCircle {

  int direction, speed;

  Obstacle5() {
    super(gridSize * 2);
    this.setStaticBody(true);
    this.setGrabbable(false);
    this.setName("obstacle5");

    cObstacle5 = (int)random(0, 3);

    direction = 1;
    speed = 0;
  }

  void act() {
    //color array
    color[] colors = {
      red, orange, lavender
    };

    this.setNoFill();
    this.setStrokeWeight(8);
    this.setStrokeColor(colors[cObstacle5]);
    //this.setRotation(1);
    //this.adjustRotation(speed);
    //if(frameCount % 20 == 0){
    //speed += 1;
    //}
    
    if (touching("player")) {
      if (cObstacle5 == cPlayer) {
        this.setSensor(true);
      } else {
        this.setSensor(false);
      }
    }
  }

  boolean touching(String thing) {
    ArrayList<FContact> contacts = this.getContacts();

    for (FContact c : contacts) {
      if (c.contains("obstacle5", thing)) {
        return true;
      }
    }
    return false;
  }
}