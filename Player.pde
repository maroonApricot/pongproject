/*
 * In this tab, you must write code in:
 *
 * move()
 */

class Player extends Paddle {
    // Constructor
    public Player(float x, float y, float w, float h, PVector vector, color c) {
        super(x, y, w, h, vector, c);
    }

    /*
     * TODO: move()
     *
     * The player's move() method should work as follows:
     * 1. Change the y-coordinate of the paddle (x-coordinate remains fixed)
     * 2. Check if the new y-coordinate means that the paddle is touching the
     *    top or bottom wall.  If true:
     *       2A. Set the paddle's vector to (0, 0); there is a method for that in the
     *           Utilities tab.
     *       2B. Set the y-coordinate so that the edge of the paddle is touching the wall
     */
    public void move() {
        // 1.
        setY(getY() + getVector().y);
        // 2.
        if (intersectsHorizontal()) {
            setVector(NO_MOVE);
            if (getY() < 0) {
                setY(-(height / 2) + getHeight() / 2);
            }
            else {
                setY(height / 2 - getHeight() / 2);
            }
        }
    }
}