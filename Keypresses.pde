// In this tab, DO NOT CHANGE ANY CODE
//
// UP and DOWN arrow keys are used to move the player's paddle
// SPACE is used to put a new ball in play
//
// In Processing, when a key is pressed, the keyPressed() method is automatically
// called (if one exists).

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      player.setVerticalSpeed(-gameSpeed);
    } else if (keyCode == DOWN) {
      player.setVerticalSpeed(gameSpeed);
    } else if ((keyCode == LEFT) || (keyCode == RIGHT)) {
      player.setVector(NO_MOVE);
    }
  } else if (key == ' ') {
    if (state != GAME_STATE.IN_PLAY) {
      if (state == GAME_STATE.GAME_OVER) {
        computer.setScore(0);
        player.setScore(0);
        gameSpeed = INIT_GAME_SPEED;
      }
      if (testingMode) {
        ball = new Ball(0, 
                        0, 
                        10, 
                        initializeBallVector(5), 
                        color(#ffffff));
      } else {
        ball = new Ball(0, 
                        random(-height/2 + 100, 
                        height/2 - 100), 
                        10, 
                        initializeBallVector((float) Math.pow(-1,computer.getScore() + player.getScore())), 
                        color(#ffffff));
      }
      state = GAME_STATE.IN_PLAY;
    } else if (Math.round(Math.abs(ball.getVector().mag())) != 1) {
      // save original ball vector
      origBallVectorMag = ball.getVector().mag();
      // slow ball to speed 1 (in the same direction)
      ball.getVector().normalize();
    } else {
      // return ball to original speed (in the same direction)
      ball.getVector().setMag(origBallVectorMag);
    }
  }
}
