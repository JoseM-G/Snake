/*
* Authors: Jose Martinez and An Tran
* Program name: Snake
* Description:  The snake start moving when mouse is press inside
* the program screen. The snake is then control by the arrow keys.
* It goal is to eat the red circle, but if it touch itself
* or the edge, the game would be over.
*/

Serpent mySnake = new Serpent (100);  //Call class as an array
GridPos food = new GridPos (0,0);  //Call class as an array

void setup(){
  size (200,200);
  frameRate (30);  //Reduce the speed of the program
  noLoop();  //No repeating
  food.randomize(); //Red circle appear randomly
  println("Press on the mouse, so that the program would start. Then move the the snake to the red block by the use of arrow keys."); //Game instructions
  
}

void draw(){
  background(201,199,199); //Gray background
  mySnake.display(); //The green snake
  
  if (frameCount % 10 == 0){ //Speed of the snake
    mySnake.move(); //Snake movement
  }
  if (mySnake.headOffScreen()== true){ //Head touch the edge
    noLoop(); //Stop the program 
    println("Snake's head left screen with a lenth of " + mySnake.curLength()); //Announce that the snake hit the edge and length 
  }
  if (mySnake.headIntersect() == true){ //Head touching body
    noLoop(); //Stop the program
    println("Snake collided with the body length of " + mySnake.curLength()); //Announce that the snake hit the body and length
  }
  food.circle( color(255,0,0)); //Red circle
  
  if (mySnake.onSerpent(food) == true){ //Snake touch the red circle
    mySnake.grow(3);  //Snake grow by 3 length
    food.randomize();  //Make the food appear randomly somewhere else on the screen
  }

}

//read the arrow keys to change the snake direction
void keyPressed(){
  // println(" in KeyPressed");
  if (key == CODED) { //a special key like arrows
  if (keyCode == UP){ //Up arrow key
    // println("now moving up");
    mySnake.changeDirection(new GridPos(0,-1)); //Snake move up
  }
  else if (keyCode == DOWN){ //Down arrow key
    // println("now moving down");
    mySnake.changeDirection(new GridPos(0,1)); //Snake move down
  }
  else if (keyCode == RIGHT){ //Right arrow key
    // println("now moving right");
    mySnake.changeDirection(new GridPos(1,0)); //Snake move right
  }
  else if (keyCode == LEFT){ //Left arrow key
    // println("now moving left
    mySnake.changeDirection(new GridPos(-1,0)); //Snake move left
  }
  else {
    println("UNKNOWN CODED KEY: code = " + keyCode); //Print when many arrow keys are pressed at once
  }
  }
}
  

void mousePressed(){
  loop(); //Repeating start when mouse press
}


