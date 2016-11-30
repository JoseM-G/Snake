/*
 * Class GridPos Provides:
 * instance variables x, y (which probably shouldn't be used)
 * Constant GRIDSIZE
 * constructure GridPos (int initX, int initY)
 * instance Methods:
 * void setTo(int xval int yval) -- sets the instance variables to the passed values
 * void print(String msg) -- prints the position followed by the message string
 * boolean equals(GridPos p) -- returns true the x,y values are the same
 * boolean onScreen() -- returns true if the object's position is on the screen
 * void shiftBy(GridPos p) -- increases the objects x value 
 *      by the passed objects x value, and similarly for y values.
 * void paint (color c)  -- paints the objects position with the indicated color
 * void randomize() -- sets the position to random coordinates
 * public String toString() -- converts GridPos to a string
 */

class GridPos {
  // instance variables
  int x;
  int y;

  // one value for the whole class (shared by all GridPos objects)
  // use GridPos.GRIDSIZE to refer to it if just GRIDSIZE doesn't work
  static final int GRIDSIZE = 20;

  // constructor -- like a function but no return type
  // uses same name as the class (and new GridPos(a,b) creates
  // and returns a GridPos object)
  GridPos (int initX, int initY) {
    x = initX;
    y = initY;
  }

  // sets the position to the indicated coordinates
  void setTo (int xval, int yval) {
    x = xval;
    y = yval;
  }
  
  // copy the x and y values of the indicated GridPos
  void setToPos(GridPos pos) {
    x = pos.x;
    y = pos.y;
  }

  // a print function for debugging
  void print(String msg) {
    println ("x=" + x + ", y=" + y + ", " + msg);
  }

  // returns true if at same place as the passed GridPos
  boolean equals (GridPos p) {
    return (x == p.x  && y == p.y);
  }

  // returns true if on the screen
  boolean onScreen() {
    return (x >= 0 && y >= 0 && x*GRIDSIZE < width && y*GRIDSIZE < height);
  }

  // updates the refrence position by adding in the x and y in the passed position to the x and
  void shiftBy(GridPos p) {
    x = x + p.x;
    y = y + p.y;
  }

  // draws the position as a square on the screen
  void paint (color c) {
    rectMode(CORNER);
    stroke(255);
    fill(c);
    rect(x*GRIDSIZE, y*GRIDSIZE, GRIDSIZE, GRIDSIZE);
  }
  
  // draws a circle instead of a square
  void circle (color c) {
    ellipseMode(CORNER);
    stroke(255);
    fill(c);
    ellipse(x*GRIDSIZE, y*GRIDSIZE, GRIDSIZE, GRIDSIZE);
  }

  // updates the x and y coordinates to random values on the screen 
  void randomize() {
    x = (int) random(0, width / GRIDSIZE);
    y = (int) random(0, height / GRIDSIZE);
  }

  // returns the x-value of the position
  int getX() {
    return this.x;  // using "this." just for emphasis
  }

  // returns the y-value of the position
  int getY() {
    return this.y;
  }

  // prints the location with parens
  public String toString() {
    return "(" + x + ", " + y + ")";
  }

}

