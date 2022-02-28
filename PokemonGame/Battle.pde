
class Battle
{
  PImage arrow = loadImage("ArrowBlack.png");
  Trainer main;
  Trainer enemy;
  Pokemon mainCurr;
  Pokemon enemyCurr;
  PImage background;
  Dialogue missed = new Dialogue("Your attack missed!");
  Dialogue missedE = new Dialogue("Your enemy's attack missed!");
  PImage mainP = loadImage("MainBattle.png");
  Dialogue move;
  
  Battle(Trainer aMain,Trainer aEnemy,PImage back)
  {
    main = aMain;
    enemy = aEnemy;
    mainCurr = main.slot1;
    enemyCurr = enemy.slot1;
    background = back;
  }
  
  void renderNormAtk()
  {
      image(background,0,0);
      enemyCurr.render(750,100);
      enemyCurr.renderBattleBox(50,50);
      Dialogue battletext = new Dialogue("Choose an Action:");
      battletext.render(0);
      mainCurr.renderBack(170,368);
      mainCurr.renderBattleBox(520,350);
      fill(0);
      textSize(30);
      text("Attack           Switch",580,577);
      image(arrow,550,560);
  }
  
  void renderBegin()
  {
    image(background,0,0); 
    image(enemy.trainPic,750,100);
    image(mainP,150,380);
  }
  
  void renderNormSwt()
  {
      image(background,0,0);
      enemyCurr.render(750,100);
      enemyCurr.renderBattleBox(50,50);
      Dialogue battletext = new Dialogue("Choose an Action:");
      battletext.render(0);
      mainCurr.renderBack(170,368);
      mainCurr.renderBattleBox(520,350);
      fill(0);
      textSize(30);
      text("Attack           Switch",580,577);
      image(arrow,750,560);
  }
  
  void renderMoveSelect()
  {
      image(background,0,0);
      enemyCurr.render(750,100);
      enemyCurr.renderBattleBox(50,50);
      Dialogue battletext = new Dialogue("Choose an Action:");
      battletext.render(0);
      mainCurr.renderBack(170,368);
      mainCurr.renderBattleBox(520,350);
      fill(0);
      textSize(30);
      text("Attack           Switch",580,577);
      image(arrow,550,560);
      mainCurr.renderMoveBox(550,215);
  }
  
  void renderPokemonSwitch()
  {
      main.renderSwitchBox(550,215);
  }
  
  void switchMon(int i)
  {
    if(main.returnPos(i).name != "None")
      mainCurr = main.returnPos(i);
  }
  
  void enemySwitchMon(int i)
  {
    enemyCurr = enemy.returnPos(i);
  }
  
  void sendRandPok()
  {
    int i = 0;
    while(enemy.returnPos(i).fainted)
    {
        i = int(random(0,7));
    }
    enemyCurr=enemy.returnPos(i);
  }
  
  boolean myTurn(Move myMove)
  {
     enemyCurr.useMoveOn(myMove,mainCurr);
     enemyCurr.checkIfFainted();
     if(enemyCurr.fainted)
        return true;
     return false;
  }
  
  boolean enemyTurn(Move enemyMove)
  {
     mainCurr.useMoveOn(enemyMove,enemyCurr);
     mainCurr.checkIfFainted();
     if(mainCurr.fainted)
        return true;
     return false;
  }
  
  boolean battleWon()
  {
    enemy.checkIfDefeated();
    return enemy.defeated;
  }
  
  boolean battleLost()
  {
    main.checkIfDefeated();
    return main.defeated;
  }
  
  void waitD()
  {
    int i = millis();
    while(millis()-i<1000)
     {
     }  
  }
  
  
}
