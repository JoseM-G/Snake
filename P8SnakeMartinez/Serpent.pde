/*
 * class Serpent
 * represents the snake body
 * instance variables: 
 * body -- array of GridPos (each element of the array is a GridPos object)
 * length -- number of cells in the body 
 * amountToGrow -- number of cellsto be added to the body
 * direction -- direction the head is moving
 * constructor: Serpent(int maxCells) initializes the Serpent with its max length
 * instance methods:
 * void changeDirection (GridPos dir) -- changes direction of head movement
 * void grow(int amount) -- adds to amount to grow
 * void move() -- mnoves the Serpent 1 cell, growing it by 1 cell if amountToGrow > 0
 * void display() -- draws the Serpent
 * boolean headIntersect() -- returns true if the head intersects the Serpent
 * boolean headOffScreen() -- returns true if the head is off the screen
 * boolean onSerpent(GridPos pos) -- returns true if pos is on the Serpent.
 * int curLength()  -- returns the current length of the Serpent.
 */

class Serpent {
  GridPos[] body;
  int length;
  GridPos direction;
  int amountToGrow;

  // Constructor has class name and no return type
  // It creates and initializes the object 
  // called with "new Serpent(maxNumCells)" 
  // start Serpent on left edge going down
  Serpent (int maxCells) {
    body = new GridPos[maxCells];
    length = 3;
    body[0] = new GridPos(0,3);
    body[1] = new GridPos(0,2);
    body[2] = new GridPos(0,1);
    direction = new GridPos(0, 1);
    amountToGrow = 0;
  }

  // change the Serpent's direction to the x,y values in the indicated GridPos
  void changeDirection (GridPos dir) {
    direction.setToPos(dir);
  }

  // update the amount to grow
  void grow(int amount) {
    amountToGrow = amountToGrow + amount;
    // this.debugInfo("growing");
  }

  // get the length of the snake
  int curLength() {
    return this.length;
  }
  
  // move the Serpent. 
  // create the new head position, shift the array element down the array,
  // and extend the length if the Serpent is supposed to grow 
  void move() {
    // create a GridPos object for where the head is moving to
    // and set it to that position
    GridPos newHead = new GridPos(0, 0);
    newHead.setToPos(body[0]);
    newHead.shiftBy(direction); 

    if (amountToGrow > 0) {
      // grow 1 segment -- shift last section into new array slot
      body[length] = body[length-1];
      amountToGrow = amountToGrow -1;
      length = length+1;
    }
    
    for (int i=length-1; i > 0 ; i--) {
      // shift positions down the body array
      body[i] = body[i-1];
    }
    // put newHead position in element 0 of body array
    body[0] = newHead;
  }


  // show the Serpent with the head as a circle
  void display() {
    body[0].circle( color(0, 150,0) );
    for (int i=1; i < length; i++) {
      body[i].paint( color(0, 150, 0) );
    }
  }

  // returns true if the head (body[0]) intersects the body
  boolean headIntersect() {
    for (int i=1; i < length; i++) {
      if ( body[0].equals(body[i]) ) {
        return true;
      }
    }
    return false;
  }

  // return true if the indicated GridPos is on the Serpent
  boolean onSerpent (GridPos pos) {
    for (int i=0; i < length -1; i++) {
      if (pos.equals(body[i]) ) {
        return true;
      }
    }
    return false;
  }

  // return true if the head goes off the screen.
  boolean headOffScreen() {
    return (! body[0].onScreen() );
  }

  // print information about Serpent for debugging
  void debugInfo(String msg) {
    print(msg);
    println ("Serpent: length = " + length + " direction=" + direction 
      + " amountToGrow=" + amountToGrow);
    print("Serpent Body (from head): ");
    for (int i=0; i < length; i++) {
      if (body[i] != null) {
        print(body[i]+" ");
      }
      else {
        print("body[" + i + "] is null!  ");
      }
    }
    for (int i=length; i < body.length; i++) {
      if (body[i] != null) {
        print ("body[" + i + "] is " + body[i] +  "  ");
      }
    }
    println();
  }
  
}


