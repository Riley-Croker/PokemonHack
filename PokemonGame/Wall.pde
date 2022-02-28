class Wall
{
  int x;
  int y;
  int h;
  int w;
  
  Wall(int aX,int aY, int aH, int aW)
  {
    x = aX;
    y = aY;
    h = aH;
    w = aW;
  }
  
  boolean hitWall(int xCheck, int yCheck)
  {
     if(xCheck >= x && xCheck <= (x+w) && yCheck >= y && yCheck <= (y+h))
     { 
       println("wall hit");
       return true;
     }
     return false;
  }
}
