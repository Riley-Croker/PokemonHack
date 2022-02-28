class TrainerHit
{
  int x;
  int y;
  int h;
  int w;
  Trainer trainer;
  
  TrainerHit(int aX,int aY, int aH, int aW, Trainer aTrainer)
  {
    x = aX;
    y = aY;
    h = aH;
    w = aW;
    trainer = aTrainer;
  }
  
  boolean hitTrainer(int xCheck, int yCheck)
  {
     if(xCheck >= x && xCheck <= (x+w) && yCheck >= y && yCheck <= (y+h))
     { 
       println("wall hit");
       return true;
     }
     return false;
  }
}
