void setup(){
   size(400,400);
   background(136,170,222);
   noLoop();
}
 
void draw(){
  int sum = 0;
  background(136,170,222);
  for(int y = 35; y <= 275; y += 60){
      for(int x = 55; x <= 300; x += 60){
        Die bob = new Die (x, y);
        bob.show();
        sum = sum + bob.numRolled;
      }
   }
   textSize(18);
   fill (118, 7, 9);
   text ("You rolled a " + sum + "!",122, 365);
}

void mousePressed(){
  redraw();
}

class Die{ //models one single dice cube
  int numRolled, myX, myY;
      
  Die(int x, int y){ //constructor
    myX = x;
    myY = y;
    roll();
  }
  void roll(){
    numRolled = (int)(Math.random()*6)+1;
  }
  
  void rollOne(){
    ellipse (myX+25, myY+25, 10, 10);
  }
  
  void rollTwo(){
    ellipse(myX+12.5, myY+12.5, 10, 10);
    ellipse(myX+37.5, myY+37.5, 10, 10);
  }
  
  void rollFour(){
    rollTwo();
    ellipse(myX+37.5, myY+12.5, 10, 10);
    ellipse(myX+12.5, myY+37.5, 10, 10);
  }
  
  void show(){
    fill(255);
    stroke(173, 173, 173);
    rect (myX, myY, 50, 50, 10);
    fill(0);
    if(numRolled == 1){
      rollOne();
    }
    if(numRolled == 2){
      rollTwo();
    }
    if(numRolled == 3){
      rollTwo();
      ellipse(myX+25, myY+25, 10, 10);
    }
    if(numRolled == 4){
      rollFour();
    }
    if(numRolled == 5){
      rollFour();
      ellipse (myX+25, myY+25, 10, 10);
    }
    if(numRolled == 6){
      rollFour();
      ellipse(myX+12.5, myY+25, 10, 10);
      ellipse(myX+37.5, myY+25, 10, 10);
    }
  }
}

