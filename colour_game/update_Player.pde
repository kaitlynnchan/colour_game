void updatePlayer() {

  if (spacekey == false) {
  }

  if (spacekey == true) {
    player.setVelocity(player.getVelocityX(), -250);
  }

  player.setVelocity(dx, player.getVelocityY());

  //contacting array
  ArrayList<FContact> contacts;
  contacts = player.getContacts();
  jumping = false;
  for (FContact c : contacts) {
    if (c.contains("player", "color changer")) {
      FBody a = c.getBody1();
      FBody b = c.getBody2();
      if (a == player) {
        cPlayer = (int)random(0, 3);
        player.setFillColor(colorsPlayer[cPlayer]);
        world.remove(b);
      } else {
        cPlayer = (int)random(0, 3);
        player.setFillColor(colorsPlayer[cPlayer]);
        world.remove(a);
      }
    }

  }
}

//color array
color[] colorsPlayer = {
  red, orange, lavender
};

void makeCharacter() {
  player = new FCircle(gridSize);
  player.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  player.setFillColor(colorsPlayer[cPlayer]);
  player.setStrokeColor(black);
  player.setStatic(false );
  player.setGrabbable(false);
  player.setRotatable(false);
  player.setName("player");
  world.add(player);
}