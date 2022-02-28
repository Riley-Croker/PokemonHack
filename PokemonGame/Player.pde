import processing.sound.*;

class Player
{
   //Trainer player; 
   int x;
   int y;
   PImage frontS;
   PImage frontW1;
   PImage frontW2;
   PImage backS;
   PImage backW1;
   PImage backW2;
   PImage leftS;
   PImage leftW1;
   PImage leftW2;
   PImage rightS;
   PImage rightW1;
   PImage rightW2;
   PImage currImage;
   boolean isMovingUp;
   boolean isMovingDown;
   boolean isMovingLeft;
   boolean isMovingRight;
   
   Player(PImage frontS1, PImage frontW11, PImage frontW12, PImage backS1, PImage backW11, PImage backW12, PImage leftS1, PImage leftW11, PImage leftW12, PImage rightS1, PImage rightW11, PImage rightW12)
   {
       x=522;
       y=330;
       frontS = frontS1;
       frontW1 = frontW11;
       frontW2 = frontW12;
       backS = backS1;
       backW1 = backW11;
       backW2 = backW12;
       leftS = leftS1;
       leftW1 = leftW11;
       leftW2 = leftW12;
       rightS = rightS1;
       rightW1 = rightW11;
       rightW2 = rightW12;
       currImage = frontS;
       isMovingUp=false;
       isMovingDown=false;
       isMovingLeft=false;
       isMovingRight=false;
   }
   
   void render()
   {
      image(currImage,x,y); 
   }
   
   void setCurrImage(PImage newImage)
   {
      currImage = newImage;   
   }
   
   void moveLeft()
   {
      if(isMovingLeft)
        x -= 4;
   }
   
   void moveUp()
   {
      if(isMovingUp)
        y -= 4;
   }
   
   void moveDown()
   {
      if(isMovingDown)
        y += 4;
   }
   
   void moveRight()
   {
      if(isMovingRight)
        x += 4;
   }
}
