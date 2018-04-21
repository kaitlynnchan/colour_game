void drawIntro(){
  fill(white);
  ellipse(width/2, height/2, 100, 100);
  textSize(28);
  fill(black);
  text("Play", width/2 - 23, height/2 + 9);
  
}

void drawPlaying(){
  
  
  
}

void drawGameover(){
  textSize(28);
  fill(white);
  rect(width/2 - 55, height/2 + 25, 138, 35);
  fill(black);
  text("Play Again", width/2 - 50, height/2 + 50);
}