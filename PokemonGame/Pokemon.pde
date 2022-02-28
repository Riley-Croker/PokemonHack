class Pokemon
{
   String name;
   float curhp;
   float hp;
   float attack;
   float spattack;
   float defense;
   float spdefense;
   float speed;
   Type primType;
   Type secType;
   Move move1,move2,move3,move4;
   PImage image;
   PImage backImage;
   
   boolean fainted;
   
   Pokemon()
   {
       name = "None";
       hp = 0;
       attack = 0;
       spattack = 0;
       defense = 0;
       spdefense = 0;
       speed = 0;
       primType = new Type();
       secType = new Type();
       image = null;
       move1 = null;
       move2 = null;
       move3 = null;
       move4 = null;
       backImage=null;
       curhp = hp;
       fainted = true;
   }
   
   Pokemon(String tempName, float tempHP, float tempatk, float tempspatk,float tempdef,float tempspdef,float tempspeed, Type tempprim, Move move11, Move move21, Move move31, Move move41, PImage tempImage, PImage tempBack)
   {
       name = tempName;
       hp = tempHP;
       attack = tempatk;
       spattack = tempspatk;
       defense = tempdef;
       spdefense = tempspdef;
       speed = tempspeed;
       primType = tempprim;
       secType = new Type();
       image = tempImage;
       move1 = move11;
       move2 = move21;
       move3 = move31;
       move4 = move41;
       backImage=tempBack;
       curhp = hp;
       fainted = false;
   }
   
   Pokemon(String tempName, float tempHP, float tempatk, float tempspatk,float tempdef,float tempspdef,float tempspeed, Type tempprim, Type tempsec, Move move11, Move move21, Move move31, Move move41, PImage tempImage, PImage tempBack)
   {
       name = tempName;
       hp = tempHP;
       attack = tempatk;
       spattack = tempspatk;
       defense = tempdef;
       spdefense = tempspdef;
       speed = tempspeed;
       primType = tempprim;
       secType = tempsec;
       image = tempImage;
       move1 = move11;
       move2 = move21;
       move3 = move31;
       move4 = move41;
       backImage=tempBack;
       curhp = hp;
       fainted = false;
   }
   
   Pokemon copyPok()
   {
     Pokemon pok;
     if(secType.name != "None")  
       pok = new Pokemon(name,hp,attack,spattack,defense,spdefense,speed,primType,secType,move1.copyMove(),move2.copyMove(),move3.copyMove(),move4.copyMove(),image,backImage);
     else
       pok = new Pokemon(name,hp,attack,spattack,defense,spdefense,speed,primType,move1.copyMove(),move2.copyMove(),move3.copyMove(),move4.copyMove(),image,backImage);
     return pok;
   }
   
   void render(int x,int y)
   {
     if(image!=null) 
       image(image,x,y);  
   }
   
   void renderBack(int x,int y)
   {
     image(backImage,x,y);  
   }
   
   void reset()
   {
     curhp = hp;
     if(move1 != null)
       move1.reset();
     if(move2 != null)
       move2.reset();
     if(move3 != null)
       move3.reset();
     if(move4 != null)
       move4.reset();
     if(name != "None")
       fainted=false;
   }
   
   Move returnMovePos(int x)
   {
     if(x==0)
       return move1;
     else if(x==1)
       return move2;
     else if(x==2)
       return move3;
     else
       return move4;
   }
   
   void renderNameHP(int x, int y)
   {
     fill(0);
     textSize(27);
     text(name,x,y);
     text(int(curhp) + "/" + int(hp),x+230,y);
   }
   
   void renderBattleBox(int x, int y)
   {
       PImage box = loadImage("BattleBox.png");
       image(box,x,y);
       fill(0);
       textSize(24);
       text(name,x+20,y+40);
       text("HP: " + int(curhp) + " / " + int(hp),x+320,y+40);
       primType.render(x+20,y+50);
       if(!secType.name.equals("None"))
         secType.render(x+80,y+50);
       int rectVal = int(map(curhp,0,hp,0,370));
       rect(x+65,y+75,380,30,7);
       fill(230,230,230);
       rect(x+70,y+80,370,20);
       if(rectVal >= 190)
         fill(0,255,0);
       else if(rectVal >= 50)
         fill(255,255,0);
       else
         fill(255,0,0);
       rect(x+70,y+80,rectVal,20);
   }
   
   void checkIfFainted()
   { 
     if(curhp <= 0)
        fainted = true;
   }
   
   Move useRandomMove()
   {
     Move randMove = returnMovePos(int(random(0,4)));
     while(randMove.ppLeft <= 0)
       randMove = returnMovePos(int(random(0,4)));
     return randMove;
   }
   
   void useMoveOn(Move move,Pokemon opponent)
   {
     float mult = 1;
     String moveType = move.type.name;
     for(String type : primType.weakness)
       if(type.equals(moveType))
       {
         mult = mult * 2;
       }
     for(String type : primType.resistance)
       if(type.equals(moveType))
         mult = mult * .5;
     for(String type : primType.immune)
       if(type.equals(moveType))
         mult = mult * 0;
     if(secType.name != "None")
     {
       for(String type : secType.weakness)
         if(type.equals(moveType))
       {
         mult = mult * 2;
       }
       for(String type : secType.resistance)
         if(type.equals(moveType))
           mult = mult * .5;
       for(String type : secType.immune)
         if(type.equals(moveType))
           mult = mult * 0;  
     }
     int damage;
     if(move.physical)
       damage = int((((move.power * (opponent.attack / defense)) + 2)/3)*mult);
     else
       damage = int((((move.power * (opponent.spattack / spdefense)) + 2)/3)*mult);
     if(damage<=0 && mult != 0)
       damage=1;
     curhp-=damage;
     if(curhp<=0)
       curhp=0;
   }
   
   void renderMoveBox(int x, int y)
   {
     image(loadImage("MoveBox.png"),x,y);  
     move1.render(x+30,y+50);
     move2.render(x+30,y+120);
     move3.render(x+30,y+190);
     move4.render(x+30,y+260);
   }
}
