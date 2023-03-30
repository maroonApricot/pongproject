// In this tab, you must write code in:
//
// * intersectsPaddle(Paddle paddle)
// * move()

// BONUS:  Discuss "WHY DOESN'T THIS WORK?"

class Ball {
  private float radius;
  private float x; // x-coordinate of the center of ball
  private float y; // y-coordinate of the center of ball
  private PVector vector;
  private color fillColor;

  public Ball(float x, float y, float radius, PVector vector, color c) {
    this.x = x;
    this.y = y;
    setVector(vector);
    //this.vector = vector;  // WHY DOESN'T THIS WORK?
    this.radius = radius;
    this.fillColor = c;
  }

  public float getX() { return x; }
  public float getY() { return y; }
  public void setX(int x) { this.x = x; }
  public void setY(int y) { this.y = y; }
  public float getRadius() { return radius; }
  public PVector getVector() { return vector; }
  public void setVector(PVector v) { vector = new PVector(v.x, v.y); }
  //public void setVector(PVector vector) { this.vector = vector; }  // WHY DOESN'T THIS WORK?

  public float distance(Ball other) {
    return (float) Math.sqrt(square(getX()-other.getX()) + square(getY()-other.getY()));
  }

  // Returns true if ball is touching a vertical wall
  public boolean intersectsVertical() {
    // NOTE: removing "or equals" from the comparisons makes adding +/- 1 to the x-coord obsolete
    return (getX()+(width/2)+getRadius() >= width) || 
           (getX()+(width/2)-getRadius() <= 0);
  }

  // Returns true if ball is touching a horizontal wall
  public boolean intersectsHorizontal() {
    return (getY()+getRadius() >= height/2) ||
           (getY()-getRadius() <= -height/2);
    // NOTE: removing "or equals" from the comparisons makes adding +/- 1 to the x-coord obsolete
    //return (getY()+(height/2)+getRadius() >= height) ||
    //       (getY()+(height/2)-getRadius() <= 0);
  }

  // Return true if the ball is touching the specified paddle
  public boolean intersectsPaddle(Paddle paddle) {
    //debugging code
    //if (abs(getX())+getRadius() > abs(paddle.getX())-paddle.getWidth()/2){
    //     if ((y >= paddle.getY()-paddle.getHeight()/2) && y <= paddle.getY()+paddle.getHeight()/2){
    //         float top = paddle.getY()-paddle.getHeight()/2;
    //         System.out.println(y + ">=" + top);
    //         float bottom = paddle.getY()+paddle.getHeight()/2;
    //         System.out.println(y + "<=" + bottom);
    //     }
    // }
    
    return (abs(x)+radius >= abs(paddle.getX())-paddle.getWidth()/2) && 
           !(abs(x)-radius >= abs(paddle.getX())) &&
            (abs(getY() - paddle.getY()) < getRadius() + paddle.getHeight()/2);
  }

  // TODO: move()
  public void move() {
    // If the ball is not in play, it should not move
    // It is somewhat useful visually to have it stay by the wall it hits
    // when a point ends
    if (state != GAME_STATE.IN_PLAY) {
        vector = new PVector(0.0, 0.0);
    }
    // If the ball is in play, then it needs to change direction if it hits
    // a paddle...
    if (intersectsPaddle(computer)||intersectsPaddle(player))
    {
        vector = new PVector(-(this.vector.x), this.vector.y);
    }
    
    // ...or if it hits the top or bottom wall
    // YOUR_CODE_HERE
    if (intersectsHorizontal())
    {
        vector = new PVector(this.vector.x, -(this.vector.y));
    }
    // Update the coordinates of the ball
    x+= vector.x;
    y+= vector.y;
  }

  public void draw() {
    fill(fillColor);
    stroke(#000000);
    ellipse(x + width/2, y + height/2, radius, radius);
  }

  public String toString() {
    return "Ball: (" + getX() + ", " + getY() + "), radius = " + getRadius() + "Vector values: " +vector.x + ", " + vector.y ;
  }
}