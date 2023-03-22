// In this tab, DO NOT CHANGE ANY CODE.
// 
// YOU MAY ADD NEW METHODS, BUT DO NOT CHANGE ANY EXISTING CODE IN THIS TAB

/*
 * square() takes in a double and
 *          returns the square as a double.
 */
public double square(double x) {
    return x * x;
}

/* between() takes in three doubles and
 *           returns whether a is between b and c.
 */
public boolean between(double a, double b, double c) {
    return (a >= b) && (a <= c);
}

/*
 * initializeBallVector() takes in a direction as a float and
 *                        returns a new PVector
 * direction is negative for left and positive for right (?)
 */

public PVector initializeBallVector(float direction) {
    float xComp = 0;
    float yComp = 0;
    
    if (testingMode) { // restrict initial ball direction to purely horizontal
        xComp = direction * gameSpeed;
    } else { // start the ball going in a random direction
        xComp = direction * Math.abs(4 + random(0, 2));
        yComp = random(-2, 2);
    }
    
    return new PVector(xComp, yComp);
}

// noMove() creates a new (0, 0) PVector
public PVector noMove() {
    return new PVector(0, 0);
}