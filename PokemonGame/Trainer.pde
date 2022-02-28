class Trainer
{
  String name;
  Pokemon slot1;
  Pokemon slot2;
  Pokemon slot3;
  Pokemon slot4;
  Pokemon slot5;
  Pokemon slot6;
  PImage switchBox = loadImage("MoveBox.png");
  PImage leftBox = loadImage("PokemonLeftBox.png");
  PImage poke = loadImage("PokeBallBattle.png");
  PImage pokeDead = loadImage("PokeBallDead.png");
  PImage trainPic;
  Dialogue dialogue;
  
  boolean defeated;
  
  Trainer(String tempName, PImage aTrainPic, Dialogue aD, Pokemon s1, Pokemon s2, Pokemon s3, Pokemon s4, Pokemon s5, Pokemon s6)
  {
      name = tempName;
      trainPic = aTrainPic;
      dialogue = aD;
      slot1=s1;
      slot2=s2;
      slot3=s3;
      slot4=s4;
      slot5=s5;
      slot6=s6;
      defeated=false;
  }
  Trainer(String tempName, PImage aTrainPic, Dialogue aD, Pokemon s1, Pokemon s2, Pokemon s3, Pokemon s4, Pokemon s5)
  {
      name = tempName;
      trainPic = aTrainPic;
      dialogue = aD;
      slot1=s1;
      slot2=s2;
      slot3=s3;
      slot4=s4;
      slot5=s5;
      slot6=new Pokemon();
      defeated=false;
  }
  Trainer(String tempName, PImage aTrainPic, Dialogue aD, Pokemon s1, Pokemon s2, Pokemon s3, Pokemon s4)
  {
      name = tempName;
      trainPic = aTrainPic;
      dialogue = aD;
      slot1=s1;
      slot2=s2;
      slot3=s3;
      slot4=s4;
      slot5=new Pokemon();
      slot6=new Pokemon();
      defeated=false;
  }
  Trainer(String tempName, PImage aTrainPic, Dialogue aD, Pokemon s1, Pokemon s2, Pokemon s3)
  {
      name = tempName;
      trainPic = aTrainPic;
      dialogue = aD;
      slot1=s1;
      slot2=s2;
      slot3=s3;
      slot4=new Pokemon();
      slot5=new Pokemon();
      slot6=new Pokemon();
      defeated=false;
  }
  Trainer(String tempName, PImage aTrainPic, Dialogue aD, Pokemon s1, Pokemon s2)
  {
      name = tempName;
      trainPic = aTrainPic;
      dialogue = aD;
      slot1=s1;
      slot2=s2;
      slot3=new Pokemon();
      slot4=new Pokemon();
      slot5=new Pokemon();
      slot6=new Pokemon();
      defeated=false;
  }
  Trainer(String tempName, PImage aTrainPic, Dialogue aD, Pokemon s1)
  {
      name = tempName;
      trainPic = aTrainPic;
      dialogue = aD;
      slot1=s1;
      slot2=new Pokemon();
      slot3=new Pokemon();
      slot4=new Pokemon();
      slot5=new Pokemon();
      slot6=new Pokemon();
      defeated=false;
  }
  
  Pokemon returnPos(int i)
  {
    if(i==1)
      return slot1;
    else if(i==2)
      return slot2;
    else if(i==3)
      return slot3;
    else if(i==4)
      return slot4;
    else if(i==5)
      return slot5;
    else if(i==6)
      return slot6;
    return new Pokemon();
  }
  void reset()
  {
      if(slot1!=null)
        slot1.reset();
      if(slot2!=null)
        slot2.reset();
      if(slot3!=null)
        slot3.reset();
      if(slot4!=null)
        slot4.reset();
      if(slot5!=null)
        slot5.reset();
      if(slot6!=null)
        slot6.reset();
      defeated=false;
  }
  
  void softReset()
  {
      if(slot1!=null)
        slot1.reset();
      if(slot2!=null)
        slot2.reset();
      if(slot3!=null)
        slot3.reset();
      if(slot4!=null)
        slot4.reset();
      if(slot5!=null)
        slot5.reset();
      if(slot6!=null)
        slot6.reset();
  }
  
  void addPoke(Pokemon pok)
  {
    if(slot2.name == "None")
    {
      slot2=pok.copyPok();
      return;
    }
    else if(slot3.name == "None")
    {
      slot3=pok.copyPok();
      return;
    }
    else if(slot4.name == "None")
    {
      slot4=pok.copyPok();
      return;
    }
    else if(slot5.name == "None")
    {
      slot5=pok.copyPok();
      return;
    }
    else if(slot6.name == "None")
    {
      slot6=pok.copyPok();
      return;
    }
  }
  
  void renderSwitchBox(int x, int y)
  {
      image(switchBox,x,y);
      if(slot1.name!="None")
        slot1.renderNameHP(x+30,y+50);
      if(slot2.name!="None")
        slot2.renderNameHP(x+30,y+95);
      if(slot3.name!="None")
        slot3.renderNameHP(x+30,y+140);
      if(slot4.name!="None")
        slot4.renderNameHP(x+30,y+185);
      if(slot5.name!="None")
        slot5.renderNameHP(x+30,y+230);
      if(slot6.name!="None")
        slot6.renderNameHP(x+30,y+275);
  }
  
  void renderPokeLeft(int x,int y)
  {
    image(leftBox,x,y);
    if(slot1.name != "None")
    {
      if(slot1.fainted)
        image(pokeDead,x+18,y+7);
      else
        image(poke,x+18,y+7);
    }
    if(slot2.name != "None")
    {
      if(slot2.fainted)
        image(pokeDead,x+62,y+7);
      else
        image(poke,x+62,y+7);
    }
    if(slot3.name != "None")
    {
      if(slot3.fainted)
        image(pokeDead,x+107,y+7);
      else
        image(poke,x+107,y+7);
    }
    if(slot4.name != "None")
    {
      if(slot4.fainted)
        image(pokeDead,x+152,y+7);
      else
        image(poke,x+152,y+7);
    }
    if(slot5.name != "None")
    {
      if(slot5.fainted)
        image(pokeDead,x+197,y+7);
      else
        image(poke,x+197,y+7);
    }
    if(slot6.name != "None")
    {
      if(slot6.fainted)
        image(pokeDead,x+242,y+7);
      else
        image(poke,x+242,y+7);
    }
  }
  
  void checkIfDefeated()
  {
    slot1.checkIfFainted(); 
    slot2.checkIfFainted(); 
    slot3.checkIfFainted(); 
    slot4.checkIfFainted(); 
    slot5.checkIfFainted(); 
    slot6.checkIfFainted(); 
    if(slot1.fainted && slot2.fainted && slot3.fainted && slot4.fainted && slot5.fainted && slot6.fainted)
       defeated = true;
  }
}
