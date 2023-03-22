// In this tab, DO NOT CHANGE ANY CODE

class Paddle {
  private float x;  // x-coordinate of left edge of paddle
  private float y;  // y-coordinate of center of paddle
  private float w;  // width of paddle (x direction)
  private float h;  // height of paddle (y direction)
  private PVector vector;
  private color fillColor;
  private int score = 0;

  public Paddle(float x, float y, float w, float h, PVector vector, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    setVector(vector);
    this.fillColor = c;
  }

  public float getX() { return x; }
  public float getY() { return y; }
  public float getWidth() { return w; }
  public float getHeight() { return h; }
  public void setX(float x) { this.x = x; }
  public void setY(float y) { this.y = y; }
  public PVector getVector() { return vector; }
  public void setVector(PVector v) { vector = new PVector(v.x, v.y); }
  public int getScore() { return score; }
  public void setScore(int score) { this.score = score; }
  public void scorePoint() { score++; }

  public boolean intersectsHorizontal() {
    return (getY()+getHeight()/2 > height/2) ||
      (getY()+(height/2)-getHeight()/2 < 0);
    // NOTE: removing "or equals" from the comparisons makes adding +/- 1 to the y-coord obsolete
    //return (getY()+getHeight()/2 >= height/2) ||
    //       (getY()+(height/2)-getHeight()/2 <= 0);
  }

  public void move() {
    // 1. If IN_PLAY and until center of ball aligns with center of paddle
    //   1A. Set vector towards ball at 2x gameSpeed
    //   1B. Set vector to match ball
    // 2. Check for instersecting horizontal walls
    //   2A. Stop paddle from moving
    //   2B. Reset position of paddle so that it is touching the wall
    // 3. Move paddle.
    if (state == GAME_STATE.IN_PLAY) {
      if (intersectsHorizontal()) {
        setVector(NO_MOVE);
        if (y < 0) {
          y = -height / 2 + getHeight() / 2;
        }
        else {
          y = height / 2 - getHeight() / 2;
        }
      } else if (Math.abs(y + getHeight()/ 2 - ball.getY()) <= ball.getRadius()) {
        vector.set(vector.x, ball.getVector().y);
      } else {
        vector.set(vector.x, 2 * ball.getVector().y);
      }
    } else {
      if (intersectsHorizontal()) {
        vector.set(vector.x, -vector.y);
      }
    }
    y+= vector.y;
  }

  public void changeVerticalSpeed(int n) {
    vector.set(vector.x, vector.y + n);
  }

  public void draw() {
    fill(fillColor);
    stroke(#000000);
    rect(x + width/2, y + height/2 -getHeight()/2, getWidth(), getHeight());
  }

  public String toString() {
    return "Paddle: (" + getX() + ", " + getY() + "), width = " + getWidth();
  }
}