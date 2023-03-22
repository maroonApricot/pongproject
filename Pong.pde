/*
 * In this tab, you must write code in:
 *
 * showScores()
 * updateScores()
 *
 * Note: The ball does not actually get created until the SPACE key is hit.
 * See the Keypresses tab for construction of the ball.
 */

// Some useful debugging tools
int debuggingCounter = 0;
final int DEBUGGING_TICKS = 100; // how often status report is shown in console
boolean testingMode = false;  // toggle to true to implement testing conditions

// Create "global" variables
Ball ball;
Paddle computer;
Player player;
enum GAME_STATE { IN_PLAY, NO_PLAY, BEFORE_GAME, GAME_OVER };
GAME_STATE state = GAME_STATE.BEFORE_GAME;  // Keeps track of state of game
PVector NO_MOVE = new PVector(0.0, 0.0); // THERE IS AN ISSUE WITH THIS CODE.
PFont font;
PFont gameOverFont;
float origBallVectorMag; // NEW

// Determine the game length
final int POINTS_NEEDED_TO_WIN = 1;

// Set the initial game speed (probably not needed)
final int INIT_GAME_SPEED = 2;
int gameSpeed = INIT_GAME_SPEED;

// Processing first runs this setup() method; akin to main() in Java
void setup() {
  size(1024, 768);
  ellipseMode(RADIUS);
  
  if (testingMode) { // testing conditions for paddles
    computer = new Paddle(75, 0, 8, 3 * height / 10, NO_MOVE, color(#000000));
    player = new Player(-75, 0, 8, height/5, noMove(), color(#000000));
  } else { // paddles for normal play
    computer = new Paddle(width/2 - 100, 0, 9, height/5, new PVector(0, 3), color(#000000)); // original computer
    player = new Player(-width/2 + 100, 0, 9, height/5, NO_MOVE, color(#000000));
  }

  // Settings for scoring
  font = createFont("Courier", height / 10);
  gameOverFont = createFont("Courier", height / 8);
  textAlign(CENTER, CENTER);  // Specify center of where text should be printed
}

// Processing puts the main draw() method in a sort of infinite loop until the program is quit.
void draw() {
  background(#ffffff);

  debuggingCounter = (debuggingCounter + 1) % DEBUGGING_TICKS;
  if (debuggingCounter == 0) {
    printState();
    System.out.println(ball);
    System.out.println("computer: " + computer);
    System.out.println("player: " + player);
  }
  
  showScores();  
  moveObjects();
  drawObjects();
}

// All objects move according to their ______ instance field.
public void moveObjects() {
  // The ball shouldn't move unless it is in play
  if (state == GAME_STATE.IN_PLAY) ball.move();
  computer.move();
  player.move();
}


// the draw() methods control how and where the objects appear in the window.
public void drawObjects() {
  // Don't draw a ball until a game has started
  if (state != GAME_STATE.BEFORE_GAME) ball.draw();
  computer.draw();
  player.draw();
}

// TODO: showScores()
public void showScores() {
  // Make sure the scores are correct
  updateScores();
  
  // show scores instead of "hi"
  textFont(font);
  text(player.getScore(), 200, 50); 
  text(computer.getScore(), width - 200, 50); 
  
  // Display "GAME OVER" if the game is over
  // (Changing the game state to indicate that the game is over is handled in
  // updateScores() below.
  // Here, you just need to check the game state and display text
  
  // YOUR_CODE_HERE
  if (state == GAME_STATE.GAME_OVER){
      text("GAME OVER", 500, 350);
  }
}

// TODO: updateScores()
public void updateScores() {
  // If the ball is not in play, there is no score to update, so just return
  if (state != GAME_STATE.IN_PLAY) return;
  
  // If the ball is in play, then check to see if it has hit a wall.
  // If so, then:
  // 1. Stop the ball (think vector)
  // 2. Change the state of the game so the ball is no longer in play
  // 3. Figure out who scored and give that side a point.
  // 4. Check to see if the game is over; if so, change the game state accordingly
  if (ball.intersectsVertical()) { // point scored
    // YOUR_CODE_HERE
    // 1.
    
    // 2.
    
    // 3.
    
    // 4.
    
    // Increase game speed
    gameSpeed++;
  }
}

// Prints the state of the game to the console.
void printState() {
  switch(state) {
    case IN_PLAY: System.out.println("IN PLAY"); break;
    case NO_PLAY: System.out.println("NO PLAY"); break;
    case BEFORE_GAME: System.out.println("BEFORE GAME"); break;
    case GAME_OVER: System.out.println("GAME OVER"); break;
    default: System.out.println("UNKNOWN"); break;
  }
}