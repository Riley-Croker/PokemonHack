import processing.sound.*;
import processing.serial.*;
//Serial port;

int outgoingPix=0;
int outgoingColor=0;

int outgoingBattleState1=0;
int outgoingBattleState2=0;
int outgoingBattleState3=0;
int outgoingBattleState4=0;
int outgoingBattleState5=0;
int outgoingBattleState6=0;
int ambianceState=0;
String message="[0,0,0,0,0,0,0]";

int i = 10;
int arrowCounter=27;
int dialogueCounter=0;
int battleCounter = 9;
int j=0;
boolean dialogueReturn=false;
boolean battleStart=false;
int switchVal2 = 0;
int arrowCordAtk = 0;
int arrowCordSwt = 0;
Battle startBattle;
Pokemon swablu, arceus, mewtwo, kyogre, groudon, rayquaza, genesect, stuntank, dragonite, beartic, rhyperior, magmortar, salamence, metagross, hydreigon, volcarona, goodra, noivern, porygon2, porygonZ, rotom, jolteon, vaporeon, flareon, eevee, rhydon, tyranitar, ursaring, garchomp, seaking, hitmonlee, hitmonchan, vigoroth, rapidash, zebstrika, scolipede, electivire, mamoswine, umbreon, greninja, luxray, haxorus, milotic, talonflame, purugly, genesectOP, steelix, magnezone, crobat, zubat, pangoro, raichu, nidoqueen, magneton, stunky, nidoking, golbat, gyarados, shiftry, manectric, pidgeot, conkeldurr, lucario, blissey, florges, altaria, charizard, maractus, ivysaur, cleffa, clefable, pikachu, swanna, cofagrigus, krokorok, staryu, psyduck, starmie, graveler, onix, flygon, trapinch, gengar, gardevoir, alakazam, arcanine, machamp, lapras, heracross, snorlax, staraptor, caterpie, wurmple, drowzee, kadabra, jigglypuff, pachirisu, ducklett, venasaur, blastoise, sceptile, blaziken, swampert, meganium, typhlosion, feraligatr, infernape, bidoof;
int switchValMain=0;
int switchValMainTemp=0;
int tempSwitch=0;
boolean battleLost=false;
boolean battleWonZane=false;
boolean pickedSecond,pickedThird,pickedFifth,addArceus = false;
boolean cellTower=false;
boolean battleDone,battleDone1=false;
PImage title;
PImage leftS;
PImage grassy;
PImage chris;
PImage preschooler;
PImage arrow,arrowBlack;
PImage treeBack,facBack,desBack,caveBack;
PImage labPic,route0pic,route1pic,route2pic,route3pic,route4pic,route5pic,route6apic,route6bpic,celltower1apic,celltower1bpic,celltower2apic,celltower2bpic,celltower3apic,celltower3bpic,celltower4apic,celltower4bpic,celltower5apic,celltower5bpic,route7pic,route8pic,route9pic,route10pic,darkCave1pic,darkCave2pic,darkCave3pic,darkCave4pic,finalApic,finalBpic,finalCpic;
PImage normalPic,fightingPic,firePic,waterPic,grassPic,icePic,poisonPic,bugPic,dragonPick,darkPic,ghostPic,psychicPic,fairyPic,rockPic,groundPic,steelPic,flyingPic,electricPic;
Move fireBlast,thunder2,psychoBoost,judgement,hyperBeam,bugBuzz,zenHeadbutt,outrage,thunderFang,hornAttack,flameCharge,braveBird,avalanche,wildCharge,waterShuriken,poisonJab,poisonFang,technoBlast,slash,ironTail,signalBeam,meteorMash,auraSphere,dragonPulse,thunder,thunderBolt,fireFang,hammerArm,stoneEdge,leafBlade,suckerPunch,peck,dazzlingGleam,hurricane,waterPulse,rapidSpin,rockTomb,rockBlast,bulldoze,sandTomb,dragonBreath,gigaImpact,iceBeam,megaHorn,flareBlitz,psychicBlast,moonBlast,shadowBall,darkPulse,sludgeWave,hex,closeCombat,airSlash,bugBite,tackle,round,confusion,thunderShock,spark,fairyWind,disarmingVoice,pound,firePunch,brickBreak,punchPunch,earthquake,muddyWater,solarBeam,razorLeaf,kickKick,blazeKick,highKick,energyBall,dragonTail,sludgeBomb,slam,waterGun,weak,bubble,headbutt,bite,hydroPump,icyPump,aquaTail,iceFang,flamethrower,wingAttack,razorWind,lavaPlume,flashCannon;
Player main;
Trainer mainT,chrisT,chrisT2,zane,diego,bo,lexi,ross,isabella,hannah,dylan,garner,zaneOP,emma,zach,zoe,rob,julia,grace,michael,mason,paul,alston,hunter,ben,sarah,elizabeth,halle,gruntm1,gruntf1,gruntm2,gruntf2,gruntm3,gruntm4,gruntf3,gruntm5,gruntm6,gruntf4,gruntf5,gruntm7,gruntm8,gruntf6,gruntf7,gruntf8,gruntm9,gruntm10,gruntf9,gruntm11,gruntf10,gruntm12,gruntf11;
Trainer hitLab,hitr1,hitr2,hitr3,hitr4,hitr5,hitct1,hitct2,hitct3,hitct4,hitr7,hitr8,hitr9,hitr10,hitdc1,hitdc2,hitdc3,hitdc4;
Pokemon[] starterList;
Pokemon[] secondaryList;
Pokemon[] thirdList;
Pokemon[] fourthList;
Pokemon[] fifthList;
Terrain lab,route0,route1,route2,route3,route4,route5,route6a,route6b,celltower1a,celltower1b,celltower2a,celltower2b,celltower3a,celltower3b,celltower4a,celltower4b,cellTower5a,cellTower5b,route7,route8,route9,route10,darkCave1,darkCave2,darkCave3,darkCave4,finalA,finalB,finalC;
Terrain curRoute;
boolean labStart,route0Start,route1Start;
Dialogue move=new Dialogue("Hi");

SoundFile menu,chrisS,grassS,desertS,dangerS,zaneS,caveS;

void setup()
{
  size(1100,650);
  //port = new Serial(this,"COM3",9600);
  background(0,0,0);
  main = new Player(loadImage("PlayerFrontStanding.png"), loadImage("PlayerFrontW1.png"), loadImage("PlayerFrontW2.png"),
                    loadImage("PlayerBackStanding.png"), loadImage("PlayerBackW1.png"), loadImage("PlayerBackW2.png"),
                    loadImage("PlayerLeftStanding.png"), loadImage("PlayerLeftW1.png"), loadImage("PlayerLeftW2.png"),
                    loadImage("PlayerRightStanding.png"), loadImage("PlayerRightW1.png"), loadImage("PlayerRightW2.png"));
  String[] fireweak = {"Water","Rock","Ground"};
  String[] fireresist = {"Grass","Bug","Fire","Steel","Ice","Fairy"};
  Type fire = new Type("Fire",fireweak,fireresist,loadImage("Fire.png"));
  String[] flyweak = {"Electric","Rock","Ice"};
  String[] flyresist = {"Grass","Bug","Fighting"};
  String[] flyimmune = {"Ground"};
  Type flying = new Type("Flying",flyweak,flyresist,flyimmune,loadImage("Flying.png"));
  String[] normweak = {"Fighting"};
  String[] normresist = {};
  String[] normimmune = {"Ghost"};
  Type normal = new Type("Normal",normweak,normresist,normimmune,loadImage("Normal.png"));
  String[] fightweak = {"Flying","Psychic","Fairy"};
  String[] fightresist = {"Rock","Bug","Dark"};
  Type fighting = new Type("Fighting",fightweak,fightresist,loadImage("Fighting.png"));
  String[] poisweak = {"Ground","Psychic"};
  String[] poisresist = {"Fighting","Bug","Fairy","Poison","Grass"};
  Type poison = new Type("Poison",poisweak,poisresist,loadImage("Poison.png"));
  String[] grweak = {"Water","Grass","Ice"};
  String[] grresist = {"Poison","Rock"};
  String[] grimmune = {"Electric"};
  Type ground = new Type("Ground",grweak,grresist,grimmune,loadImage("Ground.png"));
  String[] rockweak = {"Ground","Fighting","Steel","Water","Grass"};
  String[] rockresist = {"Normal","Flying","Fire","Poison"};
  Type rock = new Type("Rock",rockweak,rockresist,loadImage("Rock.png"));
  String[] bugweak = {"Flying","Rock","Fire"};
  String[] bugresist = {"Fighting","Ground","Grass"};
  Type bug = new Type("Bug",bugweak,bugresist,loadImage("Bug.png"));
  String[] ghweak = {"Ghost","Dark"};
  String[] ghresist = {"Poison","Bug"};
  String[] ghimmune = {"Normal","Fighting"};
  Type ghost = new Type("Ghost",ghweak,ghresist,ghimmune,loadImage("Ghost.png"));
  String[] steelweak = {"Ground","Fighting","Fire"};
  String[] steelresist = {"Normal","Flying","Rock","Bug","Steel","Grass","Psychic","Ice","Dragon","Fairy"};
  String[] steelimmune = {"Poison"};
  Type steel = new Type("Steel",steelweak,steelresist,steelimmune,loadImage("Steel.png"));
  String[] waterweak = {"Grass","Electric"};
  String[] waterresist = {"Steel","Water","Fire","Ice"};
  Type water = new Type("Water",waterweak,waterresist,loadImage("Water.png"));
  String[] grassweak = {"Flying","Poison","Bug","Fire","Ice"};
  String[] grassresist = {"Ground","Water","Grass","Electric"};
  Type grass = new Type("Grass",grassweak,grassresist,loadImage("Grass.png"));
  String[] electricweak = {"Ground"};
  String[] electricresist = {"Flying","Steel","Electric"};
  Type electric = new Type("Electric",electricweak,electricresist,loadImage("Electric.png"));
  String[] psyweak = {"Bug","Ghost","Dark"};
  String[] psyresist = {"Fighting","Psychic"};
  Type psychic = new Type("Psychic",psyweak,psyresist,loadImage("Psychic.png"));
  String[] iceweak = {"Fighting","Rock","Steel","Fire"};
  String[] iceresist = {"Ice"};
  Type ice = new Type("Ice",iceweak,iceresist,loadImage("Ice.png"));
  String[] draweak = {"Ice","Dragon","Fairy"};
  String[] draresist = {"Fire","Water","Grass","Electric"};
  Type dragon = new Type("Dragon",draweak,draresist,loadImage("Dragon.png"));
  String[] darkweak = {"Fighting","Bug","Fairy"};
  String[] darkresist = {"Dark","Ghost"};
  String[] darkimmune = {"Psychic"};
  Type dark = new Type("Dark",darkweak,darkresist,darkimmune,loadImage("Dark.png"));
  String[] fairyweak = {"Poison","Steel"};
  String[] fairyresist = {"Fighting","Bug","Dark"};
  String[] fairyimmune = {"Dragon"};
  Type fairy = new Type("Fairy",fairyweak,fairyresist,fairyimmune,loadImage("Fairy.png"));
  fireBlast = new Move("Fire Blast",fire,100,5,80,false);
  waterGun = new Move("Water Gun",water,50,25,100,false);
  weak = new Move("Weak",normal,1,30,100,false);
  firePunch = new Move("Fire Punch",fire,80,10,95,true);
  brickBreak = new Move("Brick Break",fighting,75,20,100,true);
  punchPunch = new Move("Punch",normal,70,25,100,true);
  solarBeam = new Move("Solar Beam",grass,100,5,90,false);
  razorLeaf = new Move("Razor Leaf",grass,65,25,100,true);
  sludgeBomb = new Move("Sludge Bomb",poison,75,15,85,false);
  slam = new Move("Slam",normal,70,25,100,true);
  headbutt = new Move("Headbutt",normal,75,20,100,true);
  hydroPump = new Move("Hydro Pump", water, 100,5,90,false);
  icyPump = new Move("Icy Pump", ice,50,10,85,false);
  bite = new Move("Bite", dark,60,20,100,true);
  bubble = new Move("Bubble",water,30,25,95,false);
  flamethrower = new Move("Flamethrower",fire,85,15,90,false);
  wingAttack = new Move("Wing Attack",flying,60,20,95,true);
  razorWind = new Move("Razor Wind",normal,70,15,90,false);
  lavaPlume = new Move("Lava Plume",fire,90,10,80,false);
  flashCannon = new Move("Flash Cannon",steel,70,5,90,false);
  aquaTail = new Move("Aqua Tail",water,90,10,80,true);
  iceFang = new Move("Ice Fang",ice,65,15,100,true);
  leafBlade = new Move("Leaf Blade",grass,90,10,95,true);
  energyBall = new Move("Energy Ball",grass,85,10,90,false);
  dragonTail = new Move("Dragon Tail",dragon,60,15,90,true);
  blazeKick = new Move("Blaze Kick",fire,95,15,90,true);
  highKick = new Move("High Kick",fighting,95,15,85,true);
  kickKick = new Move("Kick",normal,70,25,100,true);
  muddyWater = new Move("Muddy Water",water,85,15,80,false);
  earthquake = new Move("Earthquake",ground,100,5,90,true);
  disarmingVoice = new Move("Disarming Voice",fairy,40,25,100,false);
  pound = new Move("Pound",normal,40,25,100,true);
  fairyWind = new Move("Fairy Wind", fairy,50,20,95,false);
  thunderShock = new Move("Thunder Shock", electric,50,20,90,false);
  spark = new Move("Spark",electric,65,20,90,true);
  confusion = new Move("Confusion",psychic,50,25,100,false);
  round = new Move("Round",normal,40,25,100,false);
  tackle = new Move("Tackle",normal,40,20,100,true);
  bugBite = new Move("Bug Bite",bug,40,25,100,true);
  closeCombat = new Move("Close Combat",fighting,100,5,90,true);
  airSlash = new Move("Air Slash",flying,70,10,90,true);
  shadowBall = new Move("Shadow Ball",ghost,85,15,95,false);
  darkPulse = new Move("Dark Pulse",dark,70,15,100,false);
  waterPulse = new Move("Water Pulse",water,60,10,90,false);
  rapidSpin = new Move("Rapid Spin",normal,40,25,100,true);
  sludgeWave = new Move("Sludge Wave",poison,70,10,90,false);
  hex = new Move("Hex",ghost,60,25,100,false);
  psychicBlast = new Move("Psychic",psychic,90,5,90,false);
  moonBlast = new Move("Moon Blast",fairy,90,5,90,false);
  flareBlitz = new Move("Flare Blitz",fire,90,5,90,true);
  megaHorn = new Move("Mega Horn",bug,95,5,90,true);
  iceBeam = new Move("Ice Beam",ice,80,10,100,false);
  gigaImpact = new Move("Giga Impact",normal,100,5,90,true);
  dragonBreath = new Move("Dragon Breath",dragon,60,20,100,false);
  sandTomb = new Move("Sand Tomb",ground,40,25,100,true);
  rockBlast = new Move("Rock Blast",rock,60,25,90,true);
  rockTomb = new Move("Rock Tomb",rock,50,20,95,true);
  bulldoze = new Move("Bulldoze",ground,60,10,90,true);
  hurricane = new Move("Hurricane",flying,100,5,90,false);
  dazzlingGleam = new Move("Dazzling Gleam",fairy,80,10,90,false);
  peck = new Move("Peck",flying,40,25,100,true);
  suckerPunch = new Move("Sucker Punch",dark,70,10,100,true);
  hammerArm = new Move("Hammer Arm",fighting,95,5,90,true);
  stoneEdge = new Move("Stone Edge",rock,100,5,80,true);
  thunder = new Move("Thunder",electric,100,5,70,false);
  thunderBolt = new Move("Thunderbolt",electric,85,10,90,false);
  fireFang = new Move("Fire Fang",fire,65,10,100,true);
  meteorMash = new Move("Meteor Mash",steel,80,10,100,true);
  auraSphere = new Move("Aura Sphere",fighting,85,10,100,false);
  dragonPulse = new Move("Dragon Pulse",dragon,85,10,90,false);
  signalBeam = new Move("Signal Beam",bug,70,10,95,false);
  poisonFang = new Move("Poison Fang",poison,50,25,100,true);
  poisonJab = new Move("Poison Jab",poison,75,10,90,true);
  slash = new Move("Slash",normal,70,15,100,true);
  ironTail = new Move("Iron Tail",steel,90,10,85,true);
  technoBlast = new Move("Techno Blast",fire,120,10,100,false);
  judgement = new Move("Judgement",normal,120,10,100,false);
  avalanche = new Move("Avalanche",ice,85,10,90,true);
  waterShuriken = new Move("Water Shuriken",water,90,10,100,false);
  wildCharge = new Move("Wild Charge",electric,100,5,90,true);
  outrage = new Move("Outrage",dragon,100,5,90,true);
  braveBird = new Move("Brave Bird",flying,100,5,90,true);
  flameCharge = new Move("Flame Charge",fire,50,25,100,true);
  hornAttack = new Move("Horn Attack",normal,65,25,100,true);
  thunderFang = new Move("Thunder Fang",electric,65,25,100,true);
  hyperBeam = new Move("Hyper Beam",normal,100,5,90,false);
  zenHeadbutt = new Move("Zen Headbutt",psychic,90,5,90,true);
  bugBuzz = new Move("Bug Buzz",bug,90,5,90,false);
  psychoBoost = new Move("Psycho Boost",psychic,120,5,90,false);
  thunder2 = new Move("Thunder",electric,100,5,100,false);
  //menu = new SoundFile(this, "MenuSong.mp3");
  //chrisS = new SoundFile(this, "ChrisVibingSong.mp3");
  //grassS = new SoundFile(this, "GrassRoute.mp3");
  //desertS = new SoundFile(this, "DesertSong.mp3");
  //dangerS = new SoundFile(this, "DangerSong.mp3");
  //caveS = new SoundFile(this, "CaveSong.mp3");
  starterList = new Pokemon[9];
  secondaryList = new Pokemon[9];
  thirdList = new Pokemon[9];
  fourthList = new Pokemon[9];
  fifthList = new Pokemon[9];
  venasaur = new Pokemon("Venusaur",80,82,100,83,100,80,grass,poison,solarBeam.copyMove(),slam.copyMove(),sludgeBomb.copyMove(),razorLeaf.copyMove(),loadImage("venusaur.png"),loadImage("venusaurBack.png"));
  charizard = new Pokemon("Charizard",78,84,109,78,85,100,fire,flying,fireBlast.copyMove(),punchPunch.copyMove(),flamethrower.copyMove(),wingAttack.copyMove(),loadImage("charizard.png"),loadImage("charizardBack.png"));
  blastoise = new Pokemon("Blastoise",79,83,83,100,105,78,water,waterGun.copyMove(),hydroPump.copyMove(),slam.copyMove(),icyPump.copyMove(),loadImage("blastoise.png"),loadImage("blastoiseBack.png"));
  meganium = new Pokemon("Meganium",80,82,83,100,100,80,grass,razorLeaf.copyMove(),slam.copyMove(),solarBeam.copyMove(),razorWind.copyMove(),loadImage("meganium.png"),loadImage("meganiumBack.png"));
  typhlosion = new Pokemon("Typhlosion",78,84,109,78,85,100,fire,flamethrower.copyMove(),flashCannon.copyMove(),slam.copyMove(),lavaPlume.copyMove(),loadImage("typhlosion.png"),loadImage("typhlosionBack.png"));
  feraligatr = new Pokemon("Feraligatr",85,105,79,100,83,78,water,waterGun.copyMove(),iceFang.copyMove(),slam.copyMove(),aquaTail.copyMove(),loadImage("feraligatr.png"),loadImage("feraligatrBack.png"));
  sceptile = new Pokemon("Sceptile",70,85,105,65,85,120,grass,leafBlade.copyMove(),dragonTail.copyMove(),punchPunch.copyMove(),energyBall.copyMove(),loadImage("sceptile.png"),loadImage("sceptileBack.png"));
  blaziken = new Pokemon("Blaziken",80,100,90,70,70,80,fire,fighting,highKick.copyMove(),blazeKick.copyMove(),kickKick.copyMove(),firePunch.copyMove(),loadImage("blaziken.png"),loadImage("blazikenBack.png"));
  swampert = new Pokemon("Swampert",100,110,85,90,90,60,water,ground,earthquake.copyMove(),aquaTail.copyMove(),slam.copyMove(),muddyWater.copyMove(),loadImage("swampert.png"),loadImage("swampertBack.png"));
  infernape = new Pokemon("Infernape",76,104,104,71,71,108,fire,fighting,firePunch.copyMove(),brickBreak.copyMove(),punchPunch.copyMove(),fireBlast.copyMove(),loadImage("infernape.png"),loadImage("infernapeBack.png"));
  bidoof = new Pokemon("Bidoof",59,45,35,40,40,31,normal,slam.copyMove(),headbutt.copyMove(),bite.copyMove(),bubble.copyMove(),loadImage("bidoof.png"),loadImage("bidoofBack.png"));
  ducklett = new Pokemon("Ducklett",59,35,45,40,40,31,water,flying,wingAttack.copyMove(),bubble.copyMove(),slam.copyMove(),waterGun.copyMove(),loadImage("ducklett.png"),loadImage("ducklettBack.png"));
  jigglypuff=new Pokemon("Jigglypuff",115,45,45,20,25,20,normal,fairy,punchPunch.copyMove(),disarmingVoice.copyMove(),pound.copyMove(),fairyWind.copyMove(),loadImage("jigglypuff.png"),loadImage("jigglypuffback.png"));
  pachirisu=new Pokemon("Pachirisu",60,45,45,70,90,95,electric,bite.copyMove(),pound.copyMove(),thunderShock.copyMove(),spark.copyMove(),loadImage("pachirisu.png"),loadImage("pachirisuBack.png"));
  drowzee = new Pokemon("Drowzee",60,48,43,45,90,42,psychic,round.copyMove(),pound.copyMove(),confusion.copyMove(),disarmingVoice.copyMove(),loadImage("drowzee.png"),loadImage("drowzeeBack.png"));
  kadabra = new Pokemon("Kabadra",60,35,100,30,70,90,psychic,confusion.copyMove(),pound.copyMove(),disarmingVoice.copyMove(),confusion.copyMove(),loadImage("kadabra.png"),loadImage("kadabraBack.png"));
  caterpie = new Pokemon("Caterpie",45,30,20,35,20,45,bug,bugBite.copyMove(),pound.copyMove(),tackle.copyMove(),bugBite.copyMove(),loadImage("caterpie.png"),loadImage("caterpieBack.png"));
  wurmple = new Pokemon("Wurmple",45,45,20,35,30,20,bug,bugBite.copyMove(),pound.copyMove(),tackle.copyMove(),bugBite.copyMove(),loadImage("wurmple.png"),loadImage("wurmpleBack.png"));
  gengar = new Pokemon("Gengar",70,65,100,60,75,110,ghost,poison,shadowBall.copyMove(),sludgeWave.copyMove(),darkPulse.copyMove(),hex.copyMove(),loadImage("gengar.png"),loadImage("gengarBack.png"));
  gardevoir = new Pokemon("Gardevoir",70,65,110,65,115,80,fairy,psychic,psychicBlast.copyMove(),moonBlast.copyMove(),hex.copyMove(),confusion.copyMove(),loadImage("gardevoir.png"),loadImage("gardevoirBack.png"));
  arcanine = new Pokemon("Arcanine",90,100,100,80,80,95,fire,flareBlitz.copyMove(),bite.copyMove(),slam.copyMove(),flamethrower.copyMove(),loadImage("arcanine.png"),loadImage("arcanineBack.png"));
  alakazam = new Pokemon("Alakazam",60,50,120,45,85,110,psychic,psychicBlast.copyMove(),shadowBall.copyMove(),hex.copyMove(),confusion.copyMove(),loadImage("alakazam.png"),loadImage("alakazamBack.png"));
  heracross = new Pokemon("Heracross",80,120,40,75,80,85,bug,fighting,closeCombat.copyMove(),slam.copyMove(),megaHorn.copyMove(),brickBreak.copyMove(),loadImage("heracross.png"),loadImage("heracrossBack.png"));
  lapras = new Pokemon("Lapras",120,85,85,80,95,60,water,ice,iceBeam.copyMove(),hydroPump.copyMove(),waterGun.copyMove(),iceFang.copyMove(),loadImage("lapras.png"),loadImage("laprasBack.png"));
  snorlax = new Pokemon("Snorlax",160,80,65,65,100,20,normal,slam.copyMove(),gigaImpact.copyMove(),punchPunch.copyMove(),bite.copyMove(),loadImage("snorlax.png"),loadImage("snorlaxBack.png"));
  machamp = new Pokemon("Machamp",90,110,65,80,80,55,fighting,brickBreak.copyMove(),punchPunch.copyMove(),kickKick.copyMove(),closeCombat.copyMove(),loadImage("machamp.png"),loadImage("machampBack.png"));
  staraptor = new Pokemon("Staraptor",85,100,50,70,60,100,normal,flying,closeCombat.copyMove(),airSlash.copyMove(),slam.copyMove(),wingAttack.copyMove(),loadImage("staraptor.png"),loadImage("staraptorBack.png"));
  flygon = new Pokemon("Flygon",80,90,80,80,80,90,ground,dragon,earthquake.copyMove(),slam.copyMove(),dragonBreath.copyMove(),sandTomb.copyMove(),loadImage("flygon.png"),loadImage("flygonBack.png"));
  trapinch = new Pokemon("Trapinch",45,90,45,45,45,20,ground,slam.copyMove(),bugBite.copyMove(),sandTomb.copyMove(),tackle.copyMove(),loadImage("trapinch.png"),loadImage("trapinchBack.png"));
  graveler = new Pokemon("Graveler",65,90,45,115,60,30,rock,ground,bulldoze.copyMove(),slam.copyMove(),rockTomb.copyMove(),rockBlast.copyMove(),loadImage("graveler.png"),loadImage("gravelerBack.png"));
  onix = new Pokemon("Onix",65,45,30,150,50,70,rock,ground,bulldoze.copyMove(),tackle.copyMove(),rockTomb.copyMove(),rockBlast.copyMove(),loadImage("onix.png"),loadImage("onixBack.png"));
  staryu = new Pokemon("Staryu",50,45,70,55,55,85,water,waterGun.copyMove(),rapidSpin.copyMove(),waterPulse.copyMove(),tackle.copyMove(),loadImage("staryu.png"),loadImage("staryuBack.png"));
  psyduck = new Pokemon("Psyduck",50,52,65,48,50,55,water,waterGun.copyMove(),confusion.copyMove(),tackle.copyMove(),waterGun.copyMove(),loadImage("psyduck.png"),loadImage("psyduckBack.png"));
  starmie = new Pokemon("Starmie",60,75,80,85,85,100,water,psychic,waterPulse.copyMove(),psychicBlast.copyMove(),rapidSpin.copyMove(),waterGun.copyMove(),loadImage("starmie.png"),loadImage("starmieBack.png"));
  cofagrigus = new Pokemon("Cofagrigus",60,50,80,130,110,30,ghost,shadowBall.copyMove(),bulldoze.copyMove(),slam.copyMove(),rockTomb.copyMove(),loadImage("cofagrigus.png"),loadImage("cofagrigusBack.png"));
  krokorok = new Pokemon("Krokorok",60,80,45,45,45,75,ground,dark,bite.copyMove(),bulldoze.copyMove(),sandTomb.copyMove(),rockTomb.copyMove(),loadImage("krokorok.png"),loadImage("krokorokBack.png"));
  swanna = new Pokemon("Swanna",75,87,87,63,63,90,water,flying,airSlash.copyMove(),hurricane.copyMove(),waterPulse.copyMove(),slam.copyMove(),loadImage("swanna.png"),loadImage("swannaBack.png"));
  pikachu = new Pokemon("Pikachu",40,55,50,40,50,60,electric,thunderShock.copyMove(),tackle.copyMove(),spark.copyMove(),pound.copyMove(),loadImage("pikachu.png"),loadImage("pikachuBack.png"));
  cleffa = new Pokemon("Cleffa",50,25,45,30,50,20,fairy,fairyWind.copyMove(),pound.copyMove(),disarmingVoice.copyMove(),tackle.copyMove(),loadImage("cleffa.png"),loadImage("cleffaBack.png"));
  clefable = new Pokemon("Clefable",100,70,95,75,90,60,fairy,moonBlast.copyMove(),razorWind.copyMove(),slam.copyMove(),dazzlingGleam.copyMove(),loadImage("clefable.png"),loadImage("clefableBack.png"));
  maractus = new Pokemon("Maractus",75,85,90,70,70,70,grass,solarBeam.copyMove(),razorLeaf.copyMove(),razorWind.copyMove(),bulldoze.copyMove(),loadImage("maractus.png"),loadImage("maractusBack.png"));
  ivysaur = new Pokemon("Ivysaur",60,65,80,60,80,60,grass,poison,solarBeam.copyMove(),sludgeWave.copyMove(),slam.copyMove(),razorLeaf.copyMove(),loadImage("ivysaur.png"),loadImage("ivysaurBack.png"));
  swablu = new Pokemon("Swablu",45,40,40,65,75,50,normal,flying,wingAttack.copyMove(),peck.copyMove(),tackle.copyMove(),pound.copyMove(),loadImage("swablu.png"),loadImage("swabluBack.png"));
  altaria = new Pokemon("Altaria",80,70,70,90,100,80,dragon,flying,hurricane.copyMove(),dragonBreath.copyMove(),dragonTail.copyMove(),wingAttack.copyMove(),loadImage("altaria.png"),loadImage("altariaBack.png"));
  gyarados = new Pokemon("Gyrados",90,100,50,80,80,80,water,flying,aquaTail.copyMove(),bite.copyMove(),dragonTail.copyMove(),gigaImpact.copyMove(),loadImage("gyarados.png"),loadImage("gyaradosBack.png"));
  shiftry = new Pokemon("Shiftry",90,100,80,60,60,80,grass,dark,leafBlade.copyMove(),energyBall.copyMove(),suckerPunch.copyMove(),slam.copyMove(),loadImage("shiftry.png"),loadImage("shiftryBack.png"));
  conkeldurr = new Pokemon("Conkeldurr",105,120,50,90,60,45,fighting,hammerArm.copyMove(),stoneEdge.copyMove(),punchPunch.copyMove(),brickBreak.copyMove(),loadImage("conkeldurr.png"),loadImage("conkeldurrBack.png"));
  manectric = new Pokemon("Manectric",70,75,100,60,60,100,electric,thunder.copyMove(),fireFang.copyMove(),bite.copyMove(),thunderBolt.copyMove(),loadImage("manectric.png"),loadImage("manectricBack.png"));
  lucario = new Pokemon("Lucario",70,100,100,70,70,90,fighting,steel,auraSphere.copyMove(),meteorMash.copyMove(),dragonPulse.copyMove(),brickBreak.copyMove(),loadImage("lucario.png"),loadImage("lucarioBack.png"));
  blissey = new Pokemon("Blissey",255,10,70,10,130,55,normal,disarmingVoice.copyMove(),gigaImpact.copyMove(),razorWind.copyMove(),slam.copyMove(),loadImage("blissey.png"),loadImage("blisseyBack.png"));
  florges = new Pokemon("Florges",80,65,100,65,120,75,fairy,moonBlast.copyMove(),razorWind.copyMove(),signalBeam.copyMove(),energyBall.copyMove(),loadImage("florges.png"),loadImage("florgesBack.png"));
  pidgeot = new Pokemon("Pidgeot",85,80,70,75,70,100,normal,flying,hurricane.copyMove(),razorWind.copyMove(),slam.copyMove(),airSlash.copyMove(),loadImage("pidgeot.png"),loadImage("pidgeotBack.png"));
  golbat = new Pokemon("Golbat",75,80,60,70,70,85,poison,flying,airSlash.copyMove(),sludgeBomb.copyMove(),poisonFang.copyMove(),razorWind.copyMove(),loadImage("golbat.png"),loadImage("golbatBack.png"));
  nidoking = new Pokemon("Nidoking",80,85,80,75,75,85,poison,ground,bulldoze.copyMove(),sludgeBomb.copyMove(),poisonJab.copyMove(),megaHorn.copyMove(),loadImage("nidoking.png"),loadImage("nidokingBack.png"));
  nidoqueen = new Pokemon("Nidoqueen",90,80,75,80,80,75,poison,ground,bulldoze.copyMove(),sludgeBomb.copyMove(),poisonJab.copyMove(),megaHorn.copyMove(),loadImage("nidoqueen.png"),loadImage("nidoqueenBack.png"));
  stunky = new Pokemon("Stunky",65,60,40,45,40,75,poison,dark,poisonFang.copyMove(),bite.copyMove(),tackle.copyMove(),suckerPunch.copyMove(),loadImage("stunky.png"),loadImage("stunkyBack.png"));
  magneton = new Pokemon("Magneton",60,60,100,80,70,70,electric,steel,thunderBolt.copyMove(),flashCannon.copyMove(),thunderShock.copyMove(),slam.copyMove(),loadImage("magneton.png"),loadImage("magnetonBack.png"));
  stuntank = new Pokemon("Skuntank",100,90,70,65,60,80,poison,dark,poisonJab.copyMove(),suckerPunch.copyMove(),sludgeWave.copyMove(),slam.copyMove(),loadImage("stuntank.png"),loadImage("stuntankBack.png"));
  pangoro = new Pokemon("Pangoro",90,100,70,70,70,55,fighting,dark,brickBreak.copyMove(),suckerPunch.copyMove(),hammerArm.copyMove(),slam.copyMove(),loadImage("pangoro.png"),loadImage("pangoroBack.png"));
  raichu = new Pokemon("Raichu",60,80,80,55,80,100,electric,thunderBolt.copyMove(),thunder.copyMove(),round.copyMove(),thunderShock.copyMove(),loadImage("raichu.png"),loadImage("raichuBack.png"));
  zubat = new Pokemon("Zubat",40,45,30,35,40,55,poison,flying,poisonFang.copyMove(),bite.copyMove(),wingAttack.copyMove(),tackle.copyMove(),loadImage("zubat.png"),loadImage("zubatBack.png"));
  magnezone = new Pokemon("Magnezone",70,60,100,90,85,60,electric,steel,thunderBolt.copyMove(),flashCannon.copyMove(),meteorMash.copyMove(),thunderShock.copyMove(),loadImage("magnezone.png"),loadImage("magnezoneBack.png"));
  crobat = new Pokemon("Crobat",85,90,65,80,80,120,poison,flying,poisonJab.copyMove(),bite.copyMove(),airSlash.copyMove(),poisonFang.copyMove(),loadImage("crobat.png"),loadImage("crobatBack.png"));
  purugly = new Pokemon("Purugly",70,80,65,65,60,110,normal,gigaImpact.copyMove(),bite.copyMove(),slam.copyMove(),slash.copyMove(),loadImage("purugly.png"),loadImage("puruglyBack.png"));
  steelix = new Pokemon("Steelix",75,80,45,150,65,30,steel,ground,bulldoze.copyMove(),fireFang.copyMove(),ironTail.copyMove(),rockTomb.copyMove(),loadImage("steelix.png"),loadImage("steelixBack.png"));
  genesectOP = new Pokemon("Genesect",999,999,999,999,999,999,bug,steel,technoBlast.copyMove(),technoBlast.copyMove(),technoBlast.copyMove(),technoBlast.copyMove(),loadImage("genesect.png"),loadImage("genesectBack.png"));
  mamoswine = new Pokemon("Mamoswine",100,100,75,80,60,80,ice,ground,earthquake.copyMove(),gigaImpact.copyMove(),avalanche.copyMove(),rockBlast.copyMove(),loadImage("mamoswine.png"),loadImage("mamoswineBack.png"));
  umbreon = new Pokemon("Umbreon",95,65,60,110,110,65,dark,darkPulse.copyMove(),suckerPunch.copyMove(),gigaImpact.copyMove(),slam.copyMove(),loadImage("umbreon.png"),loadImage("umbreonBack.png"));
  greninja = new Pokemon("Greninja",75,90,100,70,70,120,water,dark,darkPulse.copyMove(),hydroPump.copyMove(),waterShuriken.copyMove(),iceBeam.copyMove(),loadImage("greninja.png"),loadImage("greninjaBack.png"));
  luxray = new Pokemon("Luxray",80,100,95,75,75,70,electric,thunderBolt.copyMove(),suckerPunch.copyMove(),wildCharge.copyMove(),slam.copyMove(),loadImage("luxray.png"),loadImage("luxrayBack.png"));
  haxorus = new Pokemon("Haxorus",75,110,60,80,70,95,dragon,outrage.copyMove(),gigaImpact.copyMove(),dragonPulse.copyMove(),firePunch.copyMove(),loadImage("haxorus.png"),loadImage("haxorusBack.png"));
  milotic = new Pokemon("Milotic",95,60,90,80,110,80,water,hydroPump.copyMove(),moonBlast.copyMove(),iceBeam.copyMove(),slam.copyMove(),loadImage("milotic.png"),loadImage("miloticBack.png"));
  talonflame = new Pokemon("Talonflame",80,80,75,70,70,120,flying,fire,braveBird.copyMove(),flareBlitz.copyMove(),hurricane.copyMove(),flamethrower.copyMove(),loadImage("talonflame.png"),loadImage("talonflameBack.png"));
  hitmonlee = new Pokemon("Hitmonlee",60,100,35,50,90,90,fighting,highKick.copyMove(),kickKick.copyMove(),blazeKick.copyMove(),brickBreak.copyMove(),loadImage("hitmonlee.png"),loadImage("hitmonleeBack.png"));
  hitmonchan = new Pokemon("Hitmonchan",60,100,35,80,90,80,fighting,punchPunch.copyMove(),firePunch.copyMove(),suckerPunch.copyMove(),closeCombat.copyMove(),loadImage("hitmonchan.png"),loadImage("hitmonchanBack.png"));
  vigoroth = new Pokemon("Vigoroth",80,80,55,80,55,90,normal,slash.copyMove(),slam.copyMove(),brickBreak.copyMove(),suckerPunch.copyMove(),loadImage("vigoroth.png"),loadImage("vigorothBack.png"));
  rapidash = new Pokemon("Rapidash",65,90,80,70,80,105,fire,flareBlitz.copyMove(),kickKick.copyMove(),blazeKick.copyMove(),poisonJab.copyMove(),loadImage("rapidash.png"),loadImage("rapidashBack.png"));
  zebstrika = new Pokemon("Zebstrika",75,90,80,65,65,115,electric,wildCharge.copyMove(),thunderBolt.copyMove(),slam.copyMove(),flameCharge.copyMove(),loadImage("zebstrika.png"),loadImage("zebstrikaBack.png"));
  scolipede = new Pokemon("Scolipede",60,90,55,90,70,110,bug,poison,megaHorn.copyMove(),slam.copyMove(),poisonJab.copyMove(),sludgeBomb.copyMove(),loadImage("scolipede.png"),loadImage("scolipedeBack.png"));
  electivire = new Pokemon("Electivire",75,110,90,70,80,95,electric,wildCharge.copyMove(),brickBreak.copyMove(),thunderBolt.copyMove(),firePunch.copyMove(),loadImage("electivire.png"),loadImage("electivireBack.png"));
  garchomp = new Pokemon("Garchomp",110,120,80,90,80,95,ground,dragon,earthquake.copyMove(),outrage.copyMove(),stoneEdge.copyMove(),gigaImpact.copyMove(),loadImage("garchomp.png"),loadImage("garchompBack.png"));
  seaking = new Pokemon("Seaking",80,90,65,65,80,70,water,hornAttack.copyMove(),megaHorn.copyMove(),aquaTail.copyMove(),waterPulse.copyMove(),loadImage("seaking.png"),loadImage("seakingBack.png"));
  vaporeon = new Pokemon("Vaporeon",120,60,90,60,90,70,water,hydroPump.copyMove(),waterPulse.copyMove(),slam.copyMove(),razorWind.copyMove(),loadImage("vaporeon.png"),loadImage("vaporeonBack.png"));
  jolteon = new Pokemon("Jolteon",65,65,100,65,95,130,electric,thunderBolt.copyMove(),thunderBolt.copyMove(),shadowBall.copyMove(),wildCharge.copyMove(),loadImage("jolteon.png"),loadImage("jolteonBack.png"));
  flareon = new Pokemon("Flareon",65,100,90,60,90,65,fire,flamethrower.copyMove(),gigaImpact.copyMove(),flareBlitz.copyMove(),suckerPunch.copyMove(),loadImage("flareon.png"),loadImage("flareonBack.png"));
  eevee = new Pokemon("Eevee",60,60,60,60,60,60,normal,bite.copyMove(),slam.copyMove(),gigaImpact.copyMove(),sandTomb.copyMove(),loadImage("eevee.png"),loadImage("eeveeBack.png"));
  tyranitar = new Pokemon("Tyranitar",100,110,90,100,100,60,rock,dark,stoneEdge.copyMove(),earthquake.copyMove(),suckerPunch.copyMove(),thunderFang.copyMove(),loadImage("tyranitar.png"),loadImage("tyranitarBack.png"));
  ursaring = new Pokemon("Ursaring",90,110,75,75,75,55,normal,gigaImpact.copyMove(),hammerArm.copyMove(),slam.copyMove(),suckerPunch.copyMove(),loadImage("ursaring.png"),loadImage("ursaringBack.png"));
  rhydon = new Pokemon("Rhydon",100,110,40,110,45,40,rock,ground,stoneEdge.copyMove(),earthquake.copyMove(),hammerArm.copyMove(),megaHorn.copyMove(),loadImage("rhydon.png"),loadImage("rhydonBack.png"));
  rotom = new Pokemon("Rotom",70,50,100,80,80,90,electric,ghost,thunderBolt.copyMove(),shadowBall.copyMove(),psychicBlast.copyMove(),hex.copyMove(),loadImage("rotom.png"),loadImage("rotomBack.png"));
  porygon2 = new Pokemon("Porygon2",85,80,100,90,90,60,normal,hyperBeam.copyMove(),gigaImpact.copyMove(),darkPulse.copyMove(),thunderBolt.copyMove(),loadImage("porygon2.png"),loadImage("porygon2Back.png"));
  porygonZ = new Pokemon("Porygon-Z",85,80,110,90,90,70,normal,hyperBeam.copyMove(),thunder.copyMove(),gigaImpact.copyMove(),thunderBolt.copyMove(),loadImage("porygonZ.png"),loadImage("porygonZBack.png"));
  dragonite = new Pokemon("Dragonite",90,120,100,95,100,80,dragon,flying,outrage.copyMove(),hurricane.copyMove(),dragonPulse.copyMove(),hyperBeam.copyMove(),loadImage("dragonite.png"),loadImage("dragoniteBack.png"));
  salamence = new Pokemon("Salamence",95,120,110,80,80,100,dragon,flying,outrage.copyMove(),fireBlast.copyMove(),dragonPulse.copyMove(),braveBird.copyMove(),loadImage("salamence.png"),loadImage("salamenceBack.png"));
  metagross = new Pokemon("Metagross",80,120,95,120,90,70,steel,psychic,meteorMash.copyMove(),zenHeadbutt.copyMove(),hammerArm.copyMove(),flashCannon.copyMove(),loadImage("metagross.png"),loadImage("metagrossBack.png"));
  hydreigon = new Pokemon("Hydreigon",95,110,120,90,90,100,dragon,dark,outrage.copyMove(),darkPulse.copyMove(),dragonPulse.copyMove(),hyperBeam.copyMove(),loadImage("hydreigon.png"),loadImage("hydreigonBack.png"));
  volcarona = new Pokemon("Volcarona",85,60,120,65,100,100,fire,bug,bugBuzz.copyMove(),fireBlast.copyMove(),hurricane.copyMove(),flamethrower.copyMove(),loadImage("volcarona.png"),loadImage("volcaronaBack.png"));
  goodra = new Pokemon("Goodra",90,80,100,70,130,80,dragon,aquaTail.copyMove(),energyBall.copyMove(),dragonPulse.copyMove(),hyperBeam.copyMove(),loadImage("goodra.png"),loadImage("goodraBack.png"));
  noivern = new Pokemon("Noivern",85,70,100,80,80,130,dragon,flying,hurricane.copyMove(),moonBlast.copyMove(),dragonPulse.copyMove(),fireBlast.copyMove(),loadImage("noivern.png"),loadImage("noivernBack.png"));
  beartic = new Pokemon("Beartic",95,100,70,80,80,50,ice,avalanche.copyMove(),gigaImpact.copyMove(),hammerArm.copyMove(),iceBeam.copyMove(),loadImage("beartic.png"),loadImage("bearticBack.png"));
  rhyperior = new Pokemon("Rhyperior",110,120,55,120,55,40,rock,ground,earthquake.copyMove(),stoneEdge.copyMove(),slam.copyMove(),hammerArm.copyMove(),loadImage("rhyperior.png"),loadImage("rhyperiorBack.png"));
  magmortar = new Pokemon("Magmortar",75,95,100,70,90,80,fire,fireBlast.copyMove(),flamethrower.copyMove(),hyperBeam.copyMove(),sludgeBomb.copyMove(),loadImage("magmortar.png"),loadImage("magmortarBack.png"));
  arceus = new Pokemon("Arceus",130,130,130,130,130,130,normal,judgement.copyMove(),thunder2.copyMove(),psychoBoost.copyMove(),hydroPump.copyMove(),loadImage("arceus.png"),loadImage("arceusBack.png"));
  genesect = new Pokemon("Genesect",130,130,130,130,130,130,bug,steel,technoBlast.copyMove(),flashCannon.copyMove(),hyperBeam.copyMove(),bugBuzz.copyMove(),loadImage("genesect.png"),loadImage("genesectBack.png"));
  rayquaza = new Pokemon("Rayquaza",110,120,120,90,90,95,dragon,flying,outrage.copyMove(),hurricane.copyMove(),hyperBeam.copyMove(),dragonPulse.copyMove(),loadImage("rayquaza.png"),loadImage("rayquazaBack.png"));
  mewtwo = new Pokemon("Mewtwo",110,100,130,90,90,120,psychic,psychicBlast.copyMove(),auraSphere.copyMove(),hyperBeam.copyMove(),fireBlast.copyMove(),loadImage("mewtwo.png"),loadImage("mewtwoBack.png"));
  groudon = new Pokemon("Groudon",100,130,100,110,90,90,ground,earthquake.copyMove(),fireBlast.copyMove(),hyperBeam.copyMove(),stoneEdge.copyMove(),loadImage("groudon.png"),loadImage("groudonBack.png"));
  kyogre = new Pokemon("Kyogre",100,100,130,90,120,90,water,hydroPump.copyMove(),hydroPump.copyMove(),hyperBeam.copyMove(),iceBeam.copyMove(),loadImage("kyogre.png"),loadImage("kyogreBack.png"));
  fifthList[0] = dragonite; fifthList[1] = tyranitar; fifthList[2] = salamence; fifthList[3] = metagross; fifthList[4] = garchomp; 
  fifthList[5] = hydreigon; fifthList[6] = volcarona; fifthList[7] = goodra; fifthList[8] = noivern;
  fourthList[0] = mamoswine; fourthList[1] = umbreon; fourthList[2] = altaria; fourthList[3] = greninja; fourthList[4] = luxray; 
  fourthList[5] = haxorus; fourthList[6] = nidoking; fourthList[7] = milotic; fourthList[8] = talonflame;
  thirdList[0] = gyarados; thirdList[1] = flygon; thirdList[2] = shiftry; thirdList[3] = conkeldurr; thirdList[4] = manectric; 
  thirdList[5] = lucario; thirdList[6] = blissey; thirdList[7] = florges; thirdList[8] = pidgeot;
  secondaryList[0] = gengar; secondaryList[1] = gardevoir; secondaryList[2] = arcanine; secondaryList[3] = alakazam; secondaryList[4] = heracross; 
  secondaryList[5] = lapras; secondaryList[6] = snorlax; secondaryList[7] = machamp; secondaryList[8] = staraptor;
  starterList[0] = venasaur; starterList[1] = blastoise; starterList[2] = charizard; starterList[3] = meganium; starterList[4] = feraligatr; 
  starterList[5] = typhlosion; starterList[6] = sceptile; starterList[7] = swampert; starterList[8] = blaziken;
  title = loadImage("NewerTitle.png");
  labPic = loadImage("Lab.png");
  route0pic = loadImage("Route0.png");
  route1pic=loadImage("Route1.png");
  route2pic=loadImage("Route2.png");
  route3pic = loadImage("Route3.png");
  route4pic=loadImage("Route4.png");
  route5pic=loadImage("Route5.png");
  route6apic=loadImage("Route6a.png");
  route6bpic=loadImage("Route6b.png");
  celltower1apic=loadImage("CellTower1a.png");
  celltower1bpic=loadImage("CellTower1.png");
  celltower2apic=loadImage("CellTower2a.png");
  celltower2bpic=loadImage("CellTower2b.png");
  celltower3apic=loadImage("CellTower3a.png");
  celltower3bpic=loadImage("CellTower3b.png");
  celltower4apic=loadImage("CellTower4a.png");
  celltower4bpic=loadImage("CellTower4b.png");
  celltower5apic=loadImage("CellTower5a.png");
  celltower5bpic=loadImage("CellTower5b.png");
  route7pic=loadImage("Route7.png");
  route8pic=loadImage("Route8.png");
  route9pic=loadImage("Route9.png");
  route10pic=loadImage("Route10.png");
  darkCave1pic=loadImage("DarkCave1.png");
  darkCave2pic=loadImage("DarkCave2.png");
  darkCave3pic=loadImage("DarkCave3.png");
  darkCave4pic=loadImage("DarkCave4.png");
  finalApic=loadImage("FinalA.png");
  finalBpic=loadImage("FinalB.png");
  finalCpic=loadImage("FinalC.png");
  chris = loadImage("chrisModel.png");
  preschooler = loadImage("Preschooler.png");
  chrisT = new Trainer("Chris",chris, new Dialogue("Lets get this show on the road!"), pikachu.copyPok());
  //chrisT2 = new Trainer("Chris",chris, new Dialogue("Lets get this show on the road!"), infernape.copyPok(), infernape.copyPok());
  emma = new Trainer ("Trainer Emma", loadImage("EmmaS.png"),new Dialogue("My Pokémon may not be strong, but they are so cute!"), bidoof.copyPok(),jigglypuff.copyPok());
  julia = new Trainer("Trainer Julia",loadImage("JuliaO.png"),new Dialogue("My Pachirisu is strong, and my balance is incredible!"),pachirisu.copyPok());
  grace = new Trainer("Psychic Grace",loadImage("GraceP.png"), new Dialogue("Psychic types beat Fighting and Poison types!"),drowzee.copyPok(),kadabra.copyPok());
  michael = new Trainer("Bug-Catcher Michael",loadImage("MichaelB.png"),new Dialogue("Careful, the desert is up ahead!"),caterpie.copyPok(),caterpie.copyPok(),wurmple.copyPok(),wurmple.copyPok());
  mason = new Trainer("Ground-Type Specialist Mason",loadImage("MasonW.png"),new Dialogue("My Flygon packs a punch!"),trapinch.copyPok(),flygon.copyPok());
  paul = new Trainer("Hiker Paul",loadImage("PaulF.png"),new Dialogue("Rock types rule!"), graveler.copyPok(),onix.copyPok());
  hunter = new Trainer("Swimmer Hunter",loadImage("Hunter.png"),new Dialogue("This hot spring is awesome!"),staryu.copyPok(),psyduck.copyPok(),starmie.copyPok());
  ben = new Trainer("Explorer Ben",loadImage("BenS.png"),new Dialogue("See any treasure anywhere?"),krokorok.copyPok(),cofagrigus.copyPok());
  alston = new Trainer("Ranger Alston",loadImage("AlstonS.PNG"),new Dialogue("Duckletts are the best!"),ducklett.copyPok(),ducklett.copyPok(),swanna.copyPok());
  halle = new Trainer("Fairy-Type Specialist Halle",loadImage("HalleT.png"),new Dialogue("Fairy types destroy fighting and dragon types!"),jigglypuff.copyPok(),clefable.copyPok(),cleffa.copyPok());
  sarah = new Trainer("Trainer Sarah",loadImage("SarahT.png"),new Dialogue("You're almost out of the desert!"),maractus.copyPok(),ivysaur.copyPok());
  elizabeth = new Trainer("Trainer Elizabeth",loadImage("ElizabethW.png"),new Dialogue("I love my Altaria!"),swablu.copyPok(),swablu.copyPok(),altaria.copyPok());
  gruntm1 = new Trainer("Team Proto Grunt Brendan",loadImage("ProtoMale.png"),new Dialogue("Team Proto will have its ways."),golbat.copyPok(),nidoking.copyPok(),stunky.copyPok());
  gruntf1 = new Trainer("Team Proto Grunt Shaina",loadImage("ProtoFemale.png"),new Dialogue("I would turn around if I were you."),magneton.copyPok(),nidoqueen.copyPok(),stunky.copyPok());
  gruntm2 = new Trainer("Team Proto Grunt Aidan",loadImage("ProtoMale.png"),new Dialogue("Leave ... or else"),pangoro.copyPok(),stuntank.copyPok());
  gruntf2 = new Trainer("Team Proto Grunt Andie",loadImage("ProtoFemale.png"),new Dialogue("You don't wanna mess with us"),zubat.copyPok(),raichu.copyPok(),stuntank.copyPok());
  gruntm3 = new Trainer("Team Proto Grunt Braedon",loadImage("ProtoMale.png"),new Dialogue("You asked for it..."),nidoking.copyPok(),raichu.copyPok());
  gruntm4 = new Trainer("Team Proto Grunt Luke",loadImage("ProtoMale.png"),new Dialogue("Get out... now"),magnezone.copyPok(),stuntank.copyPok());
  gruntf3 = new Trainer("Team Proto Grunt Sabrina",loadImage("ProtoFemale.png"),new Dialogue("Team Proto does not back down to scums like you"),crobat.copyPok(),raichu.copyPok(),stunky.copyPok());
  gruntm5 = new Trainer("Team Proto Grunt Cameron",loadImage("ProtoMale.png"),new Dialogue("Team Proto's plan will succeed..."),nidoking.copyPok(),nidoqueen.copyPok(),golbat.copyPok());
  gruntm6 = new Trainer("Team Proto Grunt Ryan",loadImage("ProtoMale.png"),new Dialogue("Team Proto does not back down"),magnezone.copyPok(),crobat.copyPok(),steelix.copyPok());
  gruntf4 = new Trainer("Team Proto Grunt Ansley",loadImage("ProtoFemale.png"),new Dialogue("You will regret trying to stop us"),nidoqueen.copyPok(),pangoro.copyPok(),purugly.copyPok());
  gruntf5 = new Trainer("Team Proto Admin Harmoney",loadImage("ProtoFemale.png"),new Dialogue("I'm the last line between you and our leader"),magnezone.copyPok(),steelix.copyPok(),pangoro.copyPok(),stunky.copyPok());
  zaneOP = new Trainer("Team Proto Leader Zane",loadImage("ZaneC.png"),new Dialogue("You stand no chance!"),genesectOP.copyPok());
  zoe = new Trainer("Martial Artist Zoe",loadImage("ZoeR.png"),new Dialogue("Some guy just came through our town, he was very scary"),hitmonlee.copyPok(),hitmonchan.copyPok(),machamp.copyPok());
  zach = new Trainer("Baseball Player Zach",loadImage("ZachH.png"),new Dialogue("Let's play ball!"),rapidash.copyPok(),zebstrika.copyPok(),pangoro.copyPok(),vigoroth.copyPok());
  rob = new Trainer("Baller Rob",loadImage("RobM.png"),new Dialogue("Swish!"),scolipede.copyPok(),electivire.copyPok(),flygon.copyPok());
  hannah = new Trainer("Trainer Hannah",loadImage("HannahS.png"),new Dialogue("My Garchomp doesn't like to lose"),lucario.copyPok(),milotic.copyPok(),garchomp.copyPok());
  garner = new Trainer("Steel-Type Trainer Garner Cochran",loadImage("DrCochran.png"),new Dialogue("Steel types rule!"),magneton.copyPok(),magnezone.copyPok(),magneton.copyPok(),steelix.copyPok());
  dylan = new Trainer("Fisherman Dylan",loadImage("DylanW.png"),new Dialogue("I am getting lots of bites today!"),gyarados.copyPok(),starmie.copyPok(),seaking.copyPok(),gyarados.copyPok());
  isabella = new Trainer("Eevee Trainer Isabella",loadImage("IsabellaD.png"),new Dialogue("Eevees can evolve into so many things!"),vaporeon.copyPok(),jolteon.copyPok(),flareon.copyPok(),eevee.copyPok());
  lexi = new Trainer("Trainer Lexi",loadImage("LexiC.png"),new Dialogue("The Dark Cave is close by, be careful!"),nidoqueen.copyPok(),tyranitar.copyPok(),golbat.copyPok());
  ross = new Trainer("Goofball Ross",loadImage("RossV.png"),new Dialogue("Let's Fight!"),ursaring.copyPok(),rhydon.copyPok(),nidoking.copyPok());
  diego = new Trainer("Bird-Man Diego",loadImage("DiegoT.png"),new Dialogue("Flying types rule!"),pidgeot.copyPok(),staraptor.copyPok(),talonflame.copyPok(),crobat.copyPok());
  bo = new Trainer("Scientist Bo",loadImage("BoD.png"),new Dialogue("Careful, I just saw a scary man walk into the cave."),rotom.copyPok(),porygon2.copyPok(),porygonZ.copyPok());
  gruntm7 = new Trainer("Team Proto Grunt Thomas",loadImage("ProtoMale.png"),new Dialogue("Get out of here!"),nidoking.copyPok(),steelix.copyPok(),pangoro.copyPok(),crobat.copyPok());
  gruntf6 = new Trainer("Team Proto Grunt Charlotte",loadImage("ProtoFemale.png"),new Dialogue("Leave while you can..."),magnezone.copyPok(),steelix.copyPok(),purugly.copyPok(),stuntank.copyPok());
  gruntm8 = new Trainer("Team Proto Grunt Buddy",loadImage("ProtoMale.png"),new Dialogue("Face Team Proto!!"),raichu.copyPok(),tyranitar.copyPok(),pangoro.copyPok());
  gruntf7 = new Trainer("Team Proto Grunt Sadie",loadImage("ProtoFemale.png"),new Dialogue("Zane will not be stopped!"),magnezone.copyPok(),dragonite.copyPok(),beartic.copyPok(),steelix.copyPok());
  gruntm9 = new Trainer("Team Proto Grunt Bear",loadImage("ProtoMale.png"),new Dialogue("HAHAHA!!"),snorlax.copyPok(),ursaring.copyPok(),pangoro.copyPok(),beartic.copyPok());
  gruntf8 = new Trainer("Team Proto Grunt Brooke",loadImage("ProtoFemale.png"),new Dialogue("Prepare to lose..."),electivire.copyPok(),rhyperior.copyPok(),magmortar.copyPok(),magnezone.copyPok());
  gruntm10 = new Trainer("Team Proto Grunt Tyler",loadImage("ProtoMale.png"),new Dialogue("Arceus will be ours!"),electivire.copyPok(),garchomp.copyPok(),lucario.copyPok(),snorlax.copyPok(),pangoro.copyPok());
  gruntf9 = new Trainer("Team Proto Grunt Caitlin",loadImage("ProtoFemale.png"),new Dialogue("Zane will not lose!"),magnezone.copyPok(),rhyperior.copyPok(),stuntank.copyPok(),crobat.copyPok());
  gruntm11 = new Trainer("Team Proto Grunt Harrison",loadImage("ProtoMale.png"),new Dialogue("With Genesect, we are unstoppable!"),steelix.copyPok(),jolteon.copyPok(),magmortar.copyPok(),nidoking.copyPok(),purugly.copyPok());
  gruntf10 = new Trainer("Team Proto Grunt Hannah",loadImage("ProtoFemale.png"),new Dialogue("I would leave while you can!"),pangoro.copyPok(),flareon.copyPok(),umbreon.copyPok(),stuntank.copyPok(),purugly.copyPok());
  gruntm12 = new Trainer("Team Proto Grunt Noah",loadImage("ProtoMale.png"),new Dialogue("You will lose!"),snorlax.copyPok(),steelix.copyPok(),magmortar.copyPok(),beartic.copyPok(),crobat.copyPok());
  gruntf11 = new Trainer("Team Proto Admin Harmoney",loadImage("ProtoFemale.png"),new Dialogue("I am the last line of defense before Zane!"),magnezone.copyPok(),steelix.copyPok(),pangoro.copyPok(),stuntank.copyPok(),rhyperior.copyPok(),crobat.copyPok());
  zane = new Trainer("Team Proto Leader Zane",loadImage("ZaneC.png"),new Dialogue("Arceus will be mine!"),dragonite.copyPok(),rayquaza.copyPok(),mewtwo.copyPok(),kyogre.copyPok(),groudon.copyPok(),genesect.copyPok());
  Wall[] labWall = {new Wall(0,0,29,1100),new Wall(0,0,650,38),new Wall(1064,0,650,36),new Wall(0,622,28,496),new Wall(588,622,28,511),new Wall(36,281,59,324),new Wall(739,281,59,324),new Wall(243,34,54,104),new Wall(38,31,149,124),new Wall(939,31,149,124),
                    new Wall(37,227,54,32),new Wall(37,343,54,32),new Wall(37,567,54,32),new Wall(1031,227,54,32),new Wall(1031,343,54,32),new Wall(1031,567,54,32),new Wall(355,36,76,53),new Wall(558,32,120,160),new Wall(526,237,50,40),new Wall(836,30,56,96)};
  //TrainerHit[] labTrainers = {new TrainerHit(1000,0,650,30,chrisT2)};
  lab = new Terrain(labPic,main,labWall);
  curRoute=lab;
  labStart=true;
  Wall[] route0Wall = {new Wall(0,0,29,1100),new Wall(0,0,650,38),new Wall(0,621,29,1100),new Wall(1062,0,306,38),new Wall(1062,437,213,38),new Wall(93,109,79,192),new Wall(775,92,79,192),new Wall(733,295,36,64),new Wall(914,295,36,64),
                       new Wall(395,42,236,108),new Wall(572,42,236,108),new Wall(433,286,32,28),new Wall(613,286,32,28)};
  route0 = new Terrain(route0pic,main,route0Wall);
  route0Start=true;
  TrainerHit[] route1Trainers = {new TrainerHit(622,249,401,38,emma),new TrainerHit(1001,249,401,38,julia)};
  Wall[] route1Wall = {new Wall(0,0,29,1100),new Wall(0,0,214,38),new Wall(0,345,306,38),new Wall(0,621,29,1100),new Wall(1062,0,214,38),new Wall(1062,345,306,38),new Wall(42,40,174,256),new Wall(432,40,174,256),new Wall(809,40,174,256),new Wall(209,366,79,188),
                           new Wall(709,466,79,188),new Wall(43,374,24,149), new Wall(729,338,24,149),new Wall(504,416,86,80),new Wall(622,201,48,38),new Wall(1001,201,48,38)};
  route1 = new Terrain(route1pic,main,route1Wall,route1Trainers);
  route1Start=true;
  TrainerHit[] route2Trainers = {new TrainerHit(367,0,446,36,grace),new TrainerHit(835,549,165,46,michael)};
  Wall[] route2Wall = {new Wall(0,0,215,38),new Wall(0,345,305,38),new Wall(0,0,29,1100),new Wall(1062,0,650,38),new Wall(0,621,29,847),new Wall(940,621,29,160),new Wall(366,36,36,64),new Wall(932,34,36,64),new Wall(48,333,265,250),new Wall(367,446,54,34),
                       new Wall(338,500,90,90),new Wall(525,499,90,90),new Wall(685,518,94,96),new Wall(126,105,76,83),new Wall(961,521,76,83),new Wall(793,549,46,42)};
  route2 = new Terrain(route2pic,main,route2Wall,route2Trainers);
  TrainerHit[] route3Trainers = {new TrainerHit(724,170,480,34,mason),new TrainerHit(1005,303,347,42,paul)};
  Wall[] route3Wall = {new Wall(0,0,30,189),new Wall(284,0,30,816),new Wall(0,0,650,35),new Wall(0,621,29,1100),new Wall(1066,0,308,34),new Wall(1066,432,218,34),new Wall(97,187,35,33),new Wall(60,274,41,40),new Wall(448,460,91,70), new Wall(556,548,39,38), new Wall(837,448,78,57),
                       new Wall(540,148,80,54),new Wall(720,75,43,42),new Wall(724,117,53,34),new Wall(1005,251,52,42)};
  route3 = new Terrain(route3pic,main,route3Wall,route3Trainers);
  TrainerHit[] route4Trainers = {new TrainerHit(243,187,463,34,hunter),new TrainerHit(679,300,305,34,ben),new TrainerHit(690,550,46,410,alston)};
  Wall[] route4Wall = {new Wall(0,0,30,1100),new Wall(0,0,278,35),new Wall(0,433,217,35),new Wall(0,621,29,728),new Wall(854,621,29,246),new Wall(1066,0,650,34),new Wall(213,63,144,192),new Wall(536,116,75,55),new Wall(675,41,123,127),new Wall(715,186,73,49),new Wall(933,265,46,45),
                       new Wall(139,448,82,60),new Wall(390,460,44,47),new Wall(994,419,84,57),new Wall(679,256,48,34),new Wall(678,550,46,36)};
  route4 = new Terrain(route4pic,main,route4Wall,route4Trainers);
  TrainerHit[] route5Trainers = {new TrainerHit(321,290,360,34,halle),new TrainerHit(446,290,360,36,sarah),new TrainerHit(800,290,360,38,elizabeth)};
  Wall[] route5Wall = {new Wall(0,0,650,35),new Wall(0,0,30,157),new Wall(284,0,30,816),new Wall(0,621,29,1100),new Wall(1066,0,277,34),new Wall(1066,401,249,34),new Wall(345,38,228,188),new Wall(605,0,275,432),new Wall(163,423,74,51),new Wall(613,448,78,54),new Wall(741,462,140,140),
                       new Wall(321,247,48,34),new Wall(446,243,52,36),new Wall(800,252,48,38)};
  route5 = new Terrain(route5pic,main,route5Wall,route5Trainers);
  Wall[] route6aWall = {new Wall(0,0,29,1100),new Wall(0,0,305,36),new Wall(0,436,224,36),new Wall(0,621,29,1100),new Wall(1065,0,305,35),new Wall(1065,436,224,35),new Wall(436,184,258,72),new Wall(588,186,258,72),new Wall(460,0,245,176),new Wall(1036,274,192,24)};
  route6a = new Terrain(route6apic,main,route6aWall);
  Wall[] route6bWall = {new Wall(0,0,29,1100),new Wall(0,0,305,36),new Wall(0,436,224,36),new Wall(0,621,29,1100),new Wall(1065,0,305,35),new Wall(1065,436,224,35),new Wall(436,184,258,72),new Wall(588,186,258,72),new Wall(460,0,245,176)};
  route6b = new Terrain(route6bpic,main,route6bWall);
  TrainerHit[] ct1Trainers = {new TrainerHit(245,440,48,855,gruntm1),new TrainerHit(0,230,50,879,gruntf1)};
  Wall[] ct1Wall = {new Wall(0,0,650,38),new Wall(0,0,29,486),new Wall(566,0,29,534),new Wall(1062,0,650,38),new Wall(0,621,29,505),new Wall(571,621,29,529),new Wall(45,561,58,28),new Wall(54,441,55,178),new Wall(165,233,71,63),new Wall(129,280,24,27),new Wall(239,241,24,27),new Wall(45,33,58,28),new Wall(337,46,54,28),new Wall(475,0,130,14),
                    new Wall(563,0,130,14),new Wall(683,45,54,28),new Wall(750,41,55,120),new Wall(1033,33,58,28),new Wall(930,212,80,96),new Wall(889,406,24,28),new Wall(924,394,72,64),new Wall(1001,435,24,28),new Wall(1032,563,58,28),new Wall(241,440,48,30),new Wall(879,230,50,32)};
  celltower1b = new Terrain(celltower1bpic,main,ct1Wall,ct1Trainers);
  Wall[] ct1aWall = {new Wall(0,0,650,38),new Wall(0,0,29,486),new Wall(566,0,29,534),new Wall(1062,0,650,38),new Wall(0,621,29,505),new Wall(571,621,29,529),new Wall(45,561,58,28),new Wall(54,441,55,178),new Wall(165,233,71,63),new Wall(129,280,24,27),new Wall(239,241,24,27),new Wall(45,33,58,28),new Wall(337,46,54,28),new Wall(475,0,130,14),
                    new Wall(563,0,130,14),new Wall(683,45,54,28),new Wall(750,41,55,120),new Wall(1033,33,58,28),new Wall(930,212,80,96),new Wall(889,406,24,28),new Wall(924,394,72,64),new Wall(1001,435,24,28),new Wall(1032,563,58,28)};
  celltower1a = new Terrain(celltower1apic,main,ct1aWall);
  TrainerHit[] ct2Trainers = {new TrainerHit(358,170,480,28,gruntm2),new TrainerHit(578,165,485,32,gruntf2),new TrainerHit(705,160,590,28,gruntm3)};
  Wall[] ct2aWall = {new Wall(45,561,58,28),new Wall(45,33,58,28),new Wall(1033,33,58,28),new Wall(1032,563,58,28),new Wall(0,0,29,1100),new Wall(0,0,650,38),new Wall(0,621,29,112),new Wall(193,621,29,907),new Wall(1062,0,234,38),new Wall(1062,310,340,38),new Wall(295,50,66,150),new Wall(581,53,54,28),new Wall(706,53,54,28),new Wall(340,446,24,28),
                    new Wall(456,489,24,28),new Wall(718,489,24,28),new Wall(839,458,24,28),new Wall(380,445,72,64),new Wall(766,449,72,64),new Wall(999,311,20,63),new Wall(999,215,20,63)};
  celltower2a = new Terrain(celltower2apic,main,ct2aWall);
  Wall[] ct2bWall = {new Wall(45,561,58,28),new Wall(45,33,58,28),new Wall(1033,33,58,28),new Wall(1032,563,58,28),new Wall(0,0,29,1100),new Wall(0,0,650,38),new Wall(0,621,29,112),new Wall(193,621,29,907),new Wall(1062,0,234,38),new Wall(1062,310,340,38),new Wall(295,50,66,150),new Wall(581,53,54,28),new Wall(706,53,54,28),new Wall(340,446,24,28),
                    new Wall(456,489,24,28),new Wall(718,489,24,28),new Wall(839,458,24,28),new Wall(380,445,72,64),new Wall(766,449,72,64),new Wall(999,311,20,63),new Wall(999,215,20,63),new Wall(358,122,48,28),new Wall(578,115,50,32),new Wall(705,112,48,28)};
  celltower2b = new Terrain(celltower2bpic,main,ct2bWall,ct2Trainers);
  TrainerHit[] ct3Trainers = {new TrainerHit(343,301,349,28,gruntm4),new TrainerHit(400,207,50,609,gruntf3),new TrainerHit(707,117,48,393,gruntm5)};
  Wall[] ct3aWall = {new Wall(0,0,469,38),new Wall(0,541,109,38),new Wall(0,0,29,746),new Wall(827,0,29,273),new Wall(1062,0,650,38),new Wall(0,621,29,1100),new Wall(45,561,58,28),new Wall(45,33,58,28),new Wall(1033,33,58,28),new Wall(1032,563,58,28),new Wall(125,41,80,96),new Wall(320,64,56,180),new Wall(329,136,24,24),new Wall(405,209,24,24),new Wall(327,173,72,64),
                     new Wall(541,351,24,28),new Wall(649,318,24,28),new Wall(579,309,72,64),new Wall(900,287,66,99),new Wall(860,57,22,84),new Wall(728,0,100,14),new Wall(830,0,100,14)};
  celltower3a = new Terrain(celltower3apic,main,ct3aWall);
  Wall[] ct3bWall = {new Wall(0,0,469,38),new Wall(0,541,109,38),new Wall(0,0,29,746),new Wall(827,0,29,273),new Wall(1062,0,650,38),new Wall(0,621,29,1100),new Wall(45,561,58,28),new Wall(45,33,58,28),new Wall(1033,33,58,28),new Wall(1032,563,58,28),new Wall(125,41,80,96),new Wall(320,64,56,180),new Wall(329,136,24,24),new Wall(405,209,24,24),new Wall(327,173,72,64),
                     new Wall(541,351,24,28),new Wall(649,318,24,28),new Wall(579,309,72,64),new Wall(900,287,66,99),new Wall(860,57,22,84),new Wall(728,0,100,14),new Wall(830,0,100,14),new Wall(343,253,48,28),new Wall(1009,207,50,32),new Wall(677,117,48,30)};
  celltower3b = new Terrain(celltower3bpic,main,ct3bWall,ct3Trainers);
  TrainerHit[] ct4Trainers = {new TrainerHit(279,457,48,371,gruntm6),new TrainerHit(324,225,50,395,gruntf4),new TrainerHit(0,106,50,690,gruntf5)};
  Wall[] ct4aWall = {new Wall(0,0,650,38),new Wall(0,0,29,508),new Wall(589,0,29,511),new Wall(1062,0,650,38),new Wall(0,621,29,508),new Wall(589,621,29,511),new Wall(45,561,58,28),new Wall(45,33,58,28),new Wall(1033,33,58,28),new Wall(1032,563,58,28),new Wall(76,444,24,28),new Wall(204,477,24,28),new Wall(119,437,72,64),new Wall(55,221,56,270),new Wall(775,221,56,270),
                     new Wall(378,42,54,28),new Wall(691,42,54,28),new Wall(766,384,24,28),new Wall(894,417,24,28),new Wall(809,377,72,64),new Wall(490,0,100,14),new Wall(592,0,100,14)};
  celltower4a = new Terrain(celltower4apic,main,ct4aWall);
  Wall[] ct4bWall = {new Wall(0,0,650,38),new Wall(0,0,29,508),new Wall(589,0,29,511),new Wall(1062,0,650,38),new Wall(0,621,29,508),new Wall(589,621,29,511),new Wall(45,561,58,28),new Wall(45,33,58,28),new Wall(1033,33,58,28),new Wall(1032,563,58,28),new Wall(76,444,24,28),new Wall(204,477,24,28),new Wall(119,437,72,64),new Wall(55,221,56,270),new Wall(775,221,56,270),
                     new Wall(378,42,54,28),new Wall(691,42,54,28),new Wall(766,384,24,28),new Wall(894,417,24,28),new Wall(809,377,72,64),new Wall(490,0,100,14),new Wall(592,0,100,14),new Wall(251,457,48,28),new Wall(719,225,50,32),new Wall(690,106,50,32)};
  celltower4b = new Terrain(celltower4bpic,main,ct4bWall,ct4Trainers);
  Wall[] ct5aWall = {new Wall(0,0,29,1100),new Wall(0,0,650,38),new Wall(1062,0,650,38),new Wall(0,621,29,508),new Wall(589,621,29,511),new Wall(472,51,116,160)};
  cellTower5a = new Terrain(celltower5apic,main,ct5aWall);
  Wall[] ct5bWall = {};
  cellTower5b = new Terrain(celltower5bpic,main,ct5bWall);
  TrainerHit[] route7Trainers = {new TrainerHit(343,460,190,38,zoe),new TrainerHit(599,377,273,32,zach),new TrainerHit(723,464,186,35,rob)};
  Wall[] route7Wall = {new Wall(0,0,29,1100),new Wall(0,0,214,35),new Wall(0,345,305,35),new Wall(1064,0,214,36),new Wall(1064,345,305,36),new Wall(0,621,29,1100),new Wall(80,86,79,64),new Wall(951,96,79,64),new Wall(186,41,296,324),new Wall(316,337,76,92),new Wall(563,41,296,324),new Wall(693,337,76,92),
                       new Wall(343,408,52,38),new Wall(599,327,50,32),new Wall(723,416,48,35)};
  route7 = new Terrain(route7pic,main,route7Wall,route7Trainers);
  TrainerHit[] route8Trainers = {new TrainerHit(171,290,360,34,hannah),new TrainerHit(534,294,356,34,garner),new TrainerHit(500,146,48,504,dylan)};
  Wall[] route8Wall = {new Wall(0,621,29,1100),new Wall(1064,0,650,36),new Wall(0,0,29,847),new Wall(941,0,29,159),new Wall(0,0,307,35),new Wall(0,438,212,35),new Wall(138,73,172,256),new Wall(502,73,172,256),new Wall(664,238,90,90),new Wall(417,47,79,64),new Wall(123,467,79,64),new Wall(529,461,79,64),new Wall(926,464,79,64),new Wall(977,56,79,64),new Wall(951,198,80,88),
                       new Wall(171,242,48,34),new Wall(534,246,48,34),new Wall(1004,146,48,34)};
  route8 = new Terrain(route8pic,main,route8Wall,route8Trainers);
  TrainerHit[] route9Trainers = {new TrainerHit(0,469,48,667,isabella),new TrainerHit(464,189,461,38,lexi),new TrainerHit(994,201,199,34,ross)};
  Wall[] route9Wall = {new Wall(0,0,29,1100),new Wall(0,0,650,35),new Wall(1064,0,214,36),new Wall(1064,344,306,36),new Wall(0,621,29,188),new Wall(283,621,29,817),new Wall(710,457,90,90),new Wall(813,321,240,250),new Wall(63,62,79,128),new Wall(451,59,79,128),new Wall(913,64,79,128),
                       new Wall(667,469,48,38),new Wall(464,141,48,38),new Wall(994,151,50,34)};
  route9 = new Terrain(route9pic,main,route9Wall,route9Trainers);
  TrainerHit[] route10Trainers = {new TrainerHit(157,315,335,38,diego),new TrainerHit(732,308,342,38,bo)};
  Wall[] route10Wall = {new Wall(0,0,29,1100),new Wall(0,621,29,1100),new Wall(0,0,305,35),new Wall(0,436,214,35),new Wall(1064,0,320,36),new Wall(1064,415,235,36),new Wall(115,71,208,188),new Wall(687,60,208,188),new Wall(346,85,80,88),new Wall(1016,224,32,32),new Wall(1016,282,32,32),new Wall(1017,434,32,32),new Wall(923,69,93,96),new Wall(927,483,93,96),
                        new Wall(157,267,48,38),new Wall(732,260,48,38)};
  route10 = new Terrain(route10pic,main,route10Wall,route10Trainers);
  TrainerHit[] dc1Trainers = {new TrainerHit(305,208,442,28,gruntm7),new TrainerHit(552,161,489,32,gruntf6),new TrainerHit(860,169,481,28,gruntm8)};
  Wall[] dc1Wall = {new Wall(0,0,29,1100),new Wall(0,621,29,1100),new Wall(0,0,393,38),new Wall(0,505,145,38),new Wall(1064,0,140,36),new Wall(1064,228,422,36),new Wall(273,44,106,102),new Wall(707,500,106,102),new Wall(453,477,50,32),new Wall(856,53,50,32),new Wall(551,51,50,32),
                    new Wall(305,160,48,28),new Wall(552,111,50,32),new Wall(860,121,48,28)};
  darkCave1 = new Terrain(darkCave1pic,main,dc1Wall,dc1Trainers);
  TrainerHit[] dc2Trainers = {new TrainerHit(404,197,453,32,gruntf7),new TrainerHit(625,89,561,28,gruntm9),new TrainerHit(620,56,50,334,gruntf8)};
  Wall[] dc2Wall = {new Wall(0,0,420,38),new Wall(0,505,145,38),new Wall(0,0,29,817),new Wall(907,0,29,193),new Wall(1064,0,650,36),new Wall(0,621,29,1100),new Wall(92,150,54,32),new Wall(745,506,54,32),new Wall(1003,53,54,32),new Wall(212,139,30,36),new Wall(505,70,30,36),new Wall(373,40,106,100),new Wall(592,36,88,96),
                    new Wall(404,147,50,32),new Wall(625,41,48,28),new Wall(954,56,50,32)};
  darkCave2 = new Terrain(darkCave2pic,main,dc2Wall,dc2Trainers);
  TrainerHit[] dc3Trainers = {new TrainerHit(99,486,48,1001,gruntm10),new TrainerHit(633,158,492,32,gruntf9),new TrainerHit(1001,94,556,28,gruntm11)};
  Wall[] dc3Wall = {new Wall(0,0,650,38),new Wall(0,0,29,1100),new Wall(0,621,29,224),new Wall(314,621,29,786),new Wall(1064,0,140,36),new Wall(1064,224,426,36),new Wall(50,477,54,32),new Wall(790,397,54,32),new Wall(633,42,54,32),new Wall(326,53,106,100),new Wall(85,79,38,44),new Wall(987,559,38,44),
                    new Wall(99,486,48,30),new Wall(633,108,50,32),new Wall(1001,46,48,28)};
  darkCave3 = new Terrain(darkCave3pic,main,dc3Wall,dc3Trainers);
  TrainerHit[] dc4Trainers = {new TrainerHit(207,175,475,32,gruntf10),new TrainerHit(537,197,453,28,gruntm12),new TrainerHit(560,49,50,389,gruntf11)};
  Wall[] dc4Wall = {new Wall(0,0,29,787),new Wall(877,0,29,223),new Wall(0,0,365,38),new Wall(0,449,201,38),new Wall(0,621,29,1100),new Wall(1064,0,650,36),new Wall(207,60,50,32),new Wall(348,517,50,32),new Wall(996,48,50,32),new Wall(502,39,106,100),
                    new Wall(207,125,50,32),new Wall(537,149,48,28),new Wall(949,49,50,32)};
  darkCave4 = new Terrain(darkCave4pic,main,dc4Wall,dc4Trainers);
  Wall[] finalAWall = {};
  finalA = new Terrain(finalApic,main,finalAWall);
  Wall[] finalBWall = {};
  finalB = new Terrain(finalBpic,main,finalBWall);
  Wall[] finalCWall = {};
  finalC = new Terrain(finalCpic,main,finalCWall);
  arrow = loadImage("Arrow.png");
  treeBack = loadImage("ForestBack.png");
  facBack = loadImage("FactoryBack.png");
  arrowBlack = loadImage("ArrowBlack.png");
  desBack = loadImage("DesertBack.png");
  caveBack = loadImage("CaveBack.png");
}

void draw()
{
  //println(switchValMain);
  switch(switchValMain)
  {
     case 0:
       image(title,0,0);
       //if(!menu.isPlaying())
       //  menu.play();
       break;
     case 1:
       //menu.stop();
       //if(!chrisS.isPlaying())
       //  chrisS.play();
       switch(switchVal2)
       {
         case 0:
          background(0,0,0);
          Dialogue intro = new Dialogue("Hello? { Hello????? { Oh it's you, finally. { Thank you for finally showing up.");
          dialogueReturn=intro.render(dialogueCounter);
          if(dialogueReturn)
          {
            switchVal2++;
            dialogueCounter=0;
          }
          break;
         case 1:
          background(0,0,0);
          image(chris,430,195);
          Dialogue intro2 = new Dialogue("Hi there, I'm Chris! { You are here for a very special purpose. { First of all, where are my manners! { Welcome to the Hack Region! { I had you sent here to help me with a dire task. { I am the owner of HackBerry Lab, the source of all power and research in the entire Hack Region. { Just the other day, an evil man by the name of Zane attacked my lab with his squad of goons and stole all our Arduinos! { Arduinos are the sole source of power for the Hack region and if we don't get them back quickly, the entire region will be in danger! { That my friend, is where you come in. { I will be entrusting you in a Pokémon to help you on your journey to defeat Zane! { In the Hack Region, people love to engage in Pokémon battles. These battles will have your Pokémon fight to see which team is stronger. { During a battle, you can either tell your Pokémon to use an { attacking move, or switch out your Pokémon to another Pokémon you have! (You can do this all using the C key to select, the X key to go back, and the WASD keys to move your arrow around) Moves have a type, power, and accuracy(1 to 100) to determine if that move hits. Typing is very important, so make sure you know your type matchups! { Eventually, you will need to defeat Zane in a battle to get the Arduinos back! { So please, go ahead and pick your starter Pokémon and battle me to practice! { Don't worry, I am not very strong.");
          dialogueReturn=intro2.render(dialogueCounter);
          if(dialogueReturn)
          {
            switchValMain++;
            dialogueCounter=0;
            switchVal2=0;
          }
       }
       break;
      case 2:
       //if(!chrisS.isPlaying())
       //  chrisS.play();
       background(0,0,0);
       fill(255);
       text("Venusuar",30,45);
       text("Blastoise",30,115);
       text("Charizard",30,185);
       text("Meganium",30,255);
       text("Feraligtr",30,325);
       text("Typhlosion",30,395);
       text("Sceptile",30,465);
       text("Swampert",30,535);
       text("Blaziken",30,605);
       image(arrow,7,arrowCounter);
       image(chris,700,350);
       starterList[j].render(700,100);
       break;
      case 3: 
        lab.renderTerrain();
        //startBattle.song.stop();
        if(battleLost)
        {
          mainT.reset();
          //send();
          battleLost=false;
        }
        Dialogue wonChris = new Dialogue("Well done! Now that you understand Pokémon battles, you are ready to begin your adventure! (Move your character around with the WASD keys). An important thing to note is Pokémon battles are so popular in the Hack Region, that other trainers will battle you when you cross their eyes! { Good luck on your journey, I'll keep in touch!");
        dialogueReturn=wonChris.render(dialogueCounter);
        if(dialogueReturn)
        {
          switchValMain++;
          dialogueCounter=0;
        }
        break;
      case 4:
       //grassS.stop();
       //if(!chrisS.isPlaying())
       //  chrisS.play();
        i++;
        if(battleLost)
        {
          main.x=522;
          main.y=330;
          mainT.reset();
          //send();
          battleLost=false;
        }
        for(TrainerHit trainer : lab.trainers)
        {
            trainer.trainer.softReset();
        }
        lab.renderTerrain();
        if(!lab.canMoveLeft())
             main.isMovingLeft = false;
        if(!lab.canMoveRight())
             main.isMovingRight = false;
        if(!lab.canMoveUp())
             main.isMovingUp = false;
        if(!lab.canMoveDown())
             main.isMovingDown = false;
        main.moveLeft();
        main.moveRight();
        main.moveUp();
        main.moveDown();
        hitLab = hitTrainer(lab);
        if(hitLab != null)
          if(!hitLab.defeated)
          {
             startBattle = new Battle(mainT,hitLab,treeBack);
             switchValMainTemp=4;
             switchValMain=7;
          }
        if(main.y > 650)
        {
          main.x=520;
          main.y=300;
          switchValMain++;
          ambianceState=1;
          //send();
        }
        break;
      case 5:
       //chrisS.stop();
       //if(!grassS.isPlaying())
       //  grassS.play();
        i++;
        route0.renderTerrain();
        if(!route0.canMoveLeft())
             main.isMovingLeft = false;
        if(!route0.canMoveRight())
             main.isMovingRight = false;
        if(!route0.canMoveUp())
             main.isMovingUp = false;
        if(!route0.canMoveDown())
             main.isMovingDown = false;
        main.moveLeft();
        main.moveRight();
        main.moveUp();
        main.moveDown();
        if(main.y < 225 && main.x <= 520 && main.x >= 504)
        {
           switchValMain--; 
           main.x=520;
           main.y=600;
        }
        if(main.x > 1100)
        {
          main.x=30;
          main.y=260;
          switchValMain++;
        }
        break;
      case 6:
       //startBattle.song.stop();
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       if(battleLost)
        {
          main.x=30;
          main.y=260;
          mainT.reset();
          ////send();
          battleLost=false;
          for(TrainerHit trainer : route1.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       route1.renderTerrain();
       if(!route1.canMoveLeft())
            main.isMovingLeft = false;
       if(!route1.canMoveRight())
            main.isMovingRight = false;
       if(!route1.canMoveUp())
            main.isMovingUp = false;
       if(!route1.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x < -45)
       {
         main.x=1050;
         main.y=335;
         switchValMain--;
       }
       if(main.x>1100)
       {
         main.x=30;
         main.y=250;
         switchValMain+=2;
       }
       hitr1 = hitTrainer(route1);
        if(hitr1 != null)
          if(!hitr1.defeated)
          {
             startBattle = new Battle(mainT,hitr1,treeBack);
             switchValMainTemp=6;
             switchValMain=7;
          }
       break;
      case 7:
        //chrisS.stop();
        //grassS.stop();
        //desertS.stop();
        //caveS.stop();
        //if(!startBattle.song.isPlaying())
        //  startBattle.song.play();
        renderBattle(battleCounter,startBattle);
        mainCheckPoke();
        main.isMovingLeft = false;
        main.isMovingRight = false;
        main.isMovingUp = false;
        main.isMovingDown = false;
        if(battleCounter==9)
        {
          Dialogue battleChal = new Dialogue(startBattle.enemy.name + " has challenged you to battle!");
          battleChal.render(0);
        }
        if(battleCounter==10)
        {
          Dialogue enPhrase = new Dialogue("\"" + startBattle.enemy.dialogue.message + "\"");
          enPhrase.render(0);
        }
        if(startBattle.battleWon())
        {
          battleCounter=8;
          if(battleDone1)
          {
            battleCounter=11;
            if(!battleDone)
            {
              Dialogue wonBattle = new Dialogue("Congrats! You have won the battle!");
              wonBattle.render(0);
              mainT.reset();
            }
            else
            {
              switchValMain=switchValMainTemp; 
              battleDone=false;
              battleDone1=false;                
              battleCounter=9;  
              //send();
            }
          }
        }    
        if(startBattle.battleLost())
        {
          battleCounter=8;
          if(battleDone1)
          {
            battleCounter=11;
            if(!battleDone)
            {
              Dialogue lostBattle = new Dialogue("Sorry. You have lost the battle. Try again...");
              lostBattle.render(0);
            }
            else
            {
              battleCounter=9;
              battleLost=true;
              switchValMain=switchValMainTemp;
              battleDone=false;
              battleDone1=false;
              //send();
            }
          }
        }
        break;
      case 8:
       //startBattle.song.stop();
       //desertS.stop();
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       if(battleLost)
        {
          main.x=30;
          main.y=250;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : route2.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       route2.renderTerrain();
       if(!route2.canMoveLeft())
            main.isMovingLeft = false;
       if(!route2.canMoveRight())
            main.isMovingRight = false;
       if(!route2.canMoveUp())
            main.isMovingUp = false;
       if(!route2.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x < -45)
       {
         main.x=1050;
         main.y=250;
         switchValMain-=2;
       }
       if(main.y > 650)
       {
         if(pickedSecond)
         {
           switchValMain=11;
           main.x=210;
           main.y=20;
           ambianceState=2;
           //send();
         }
         else
         {
           switchValMain++;
           ambianceState=0;
           //send();
         }
       }
       hitr2 = hitTrainer(route2);
        if(hitr2 != null)
          if(!hitr2.defeated)
          {
             startBattle = new Battle(mainT,hitr2,treeBack);
             switchValMainTemp=8;
             switchValMain=7;
          }
       break;
     case 9:
       //startBattle.song.stop();
       //grassS.stop();
       //if(!chrisS.isPlaying())
       //  chrisS.play();
       background(0,0,0);
       image(chris,430,195);
       Dialogue intro2 = new Dialogue("Well hello again! { You are about to enter the desert! { Trainers in the desert are stronger compared to trainers you have fought so far! { Therefore, we need to increase your team's strength. { You may have noticed different trainers have different numbers of Pokémon. This is because a trainer can have up to six pokemon at a time. { Now I will let you pick a new Pokémon to act as your second { Pokémon on your team! { I would recommend you pick a Pokémon that has a different { typing than your starter so you have more type coverage. { So go ahead and pick!");
       dialogueReturn=intro2.render(dialogueCounter);
       if(dialogueReturn)
       {
         switchValMain++;
         dialogueCounter=0;
         j=0;
         arrowCounter=27;
       }
       break;
     case 10:
       //if(!chrisS.isPlaying())
       //  chrisS.play();
       background(0,0,0);
       fill(255);
       text("Gengar",30,45);
       text("Gardevoir",30,115);
       text("Arcanine",30,185);
       text("Alakazam",30,255);
       text("Heracross",30,325);
       text("Lapras",30,395);
       text("Snorlax",30,465);
       text("Machamp",30,535);
       text("Staraptor",30,605);
       image(arrow,7,arrowCounter);
       image(chris,700,350);
       secondaryList[j].render(700,100);
       break;
     case 11:
       //startBattle.song.stop();
       //grassS.stop();
       //chrisS.stop();
       //if(!desertS.isPlaying())
       //  desertS.play();
       i++;
       if(battleLost)
        {
          main.x=210;
          main.y=20;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : route3.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       route3.renderTerrain();
       if(!route3.canMoveLeft())
            main.isMovingLeft = false;
       if(!route3.canMoveRight())
            main.isMovingRight = false;
       if(!route3.canMoveUp())
            main.isMovingUp = false;
       if(!route3.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.y < 0)
       {
         switchValMain=8;
         main.x=860;
         main.y=590;
         ambianceState=1;
         //send();
       }
       if(main.x>1100)
       {
         main.x=20;
         main.y=330;
         switchValMain++;
       }
       hitr3 = hitTrainer(route3);
        if(hitr3 != null)
          if(!hitr3.defeated)
          {
             startBattle = new Battle(mainT,hitr3,desBack);
             switchValMainTemp=11;
             switchValMain=7;
          }
       break;
     case 12:
       //startBattle.song.stop();
       //grassS.stop();
       //if(!desertS.isPlaying())
       //  desertS.play();
       i++;
       if(battleLost)
        {
          main.x=20;
          main.y=330;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : route4.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       route4.renderTerrain();
       if(!route4.canMoveLeft())
            main.isMovingLeft = false;
       if(!route4.canMoveRight())
            main.isMovingRight = false;
       if(!route4.canMoveUp())
            main.isMovingUp = false;
       if(!route4.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x < -45)
       {
          main.x=1050;
          main.y = 340;
          switchValMain--;
       }
       
       if(main.y > 650)
       {
          main.x=190;
          main.y=20;
          switchValMain++;
       }
       
       hitr4 = hitTrainer(route4);
        if(hitr4 != null)
          if(!hitr4.defeated)
          {
             startBattle = new Battle(mainT,hitr4,desBack);
             switchValMainTemp=12;
             switchValMain=7;
          }
       break;
     case 13:
       //startBattle.song.stop();
       //grassS.stop();
       //dangerS.stop();
       //if(!desertS.isPlaying())
       //  desertS.play();
       i++;
       if(battleLost)
        {
          main.x=180;
          main.y=20;
          mainT.reset();
         // send();
          battleLost=false;
          for(TrainerHit trainer : route5.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       route5.renderTerrain();
       if(!route5.canMoveLeft())
            main.isMovingLeft = false;
       if(!route5.canMoveRight())
            main.isMovingRight = false;
       if(!route5.canMoveUp())
            main.isMovingUp = false;
       if(!route5.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.y < -45)
       {
          main.x=760;
          main.y = 600;
          switchValMain--;
       }
       if(main.x>1100)
       {
         main.x=20;
         main.y=355;
         if(!pickedThird)
         {
           switchValMain++;
           ambianceState=0;
           //send();
         }
         else
         {
           ambianceState=1;
           //send();
           if(cellTower)
             switchValMain=17;
           else 
             switchValMain=16;
         }
       }
       hitr5 = hitTrainer(route5);
        if(hitr5 != null)
          if(!hitr5.defeated)
          {
             startBattle = new Battle(mainT,hitr5,desBack);
             switchValMainTemp=13;
             switchValMain=7;
          }
       break;
     case 14:
       //startBattle.song.stop();
       //desertS.stop();
       //if(!dangerS.isPlaying())
       //  dangerS.play();
       switch(switchVal2)
       {
         case 0:
          background(0,0,0);
          image(preschooler,430,195);
          Dialogue helpKid = new Dialogue("Hey! { Hey you!!!! { Please help me! { I was playing with my little Pokémon infront of the big tower over there and a lot of big and scary people came and I think they were trying to attack the tower. { I don't know what is going on but I am so little and I am so scared!! { Please help!!");
          dialogueReturn=helpKid.render(dialogueCounter);
          if(dialogueReturn)
          {
            switchVal2++;
            dialogueCounter=0;
          }
          break;
         case 1:
          background(0,0,0);
          image(chris,430,195);
          Dialogue chrisWorried = new Dialogue("Oh no, this is not good. { That child must be talking about the cell tower up on the next route! { Those big and scary people have to be Zane and his goons. { The cell tower is home for all broadcasting and cell service in the Hack Region, so there is no telling what Zane will do there, but it can't be good. { Get in there and find out whats going on! { Also, here... { Take another Pokémon to help you out!");
          dialogueReturn=chrisWorried.render(dialogueCounter);
          if(dialogueReturn)
          {
            switchValMain++;
            dialogueCounter=0;
            switchVal2=0;
            j=0;
            arrowCounter=27;
          }
       }
       break;
     case 15:
       //if(!dangerS.isPlaying())
       //  dangerS.play();
       background(0,0,0);
       fill(255);
       text("Gyarados",30,45);
       text("Flygon",30,115);
       text("Shiftry",30,185);
       text("Conkeldurr",30,255);
       text("Manetric",30,325);
       text("Lucario",30,395);
       text("Blissy",30,465);
       text("Florges",30,535);
       text("Pidgeot",30,605);
       image(arrow,7,arrowCounter);
       image(chris,700,350);
       thirdList[j].render(700,100);
       break;
     case 16:
     //desertS.stop();
     //  if(!dangerS.isPlaying())
     //    dangerS.play();
       i++;
       if(battleLost)
        {
          main.x=20;
          main.y=355;
          mainT.reset();
         // send();
          battleLost=false;
          for(TrainerHit trainer : route6a.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       route6a.renderTerrain();
       if(!route6a.canMoveLeft())
            main.isMovingLeft = false;
       if(!route6a.canMoveRight())
            main.isMovingRight = false;
       if(!route6a.canMoveUp())
            main.isMovingUp = false;
       if(!route6a.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x < -45)
       {
          main.x=1050;
          main.y = 315;
          switchValMain=13;
          ambianceState=2;
         // send();
       }
       if(main.y < 442 && main.x <= 587 && main.x >= 508)
       {
          switchValMain=18; 
          main.x=515;
          main.y=600;
          ambianceState=3;
          //send();
       }
       
       hitr5 = hitTrainer(route6a);
        if(hitr5 != null)
          if(!hitr5.defeated)
          {
             startBattle = new Battle(mainT,hitr5,desBack);
             switchValMainTemp=16;
             switchValMain=7;
          }
       break;
     case 17:
       //startBattle.song.stop();
       //desertS.stop();
       //dangerS.stop();
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       if(battleLost)
        {
          main.x=20;
          main.y=355;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : route6b.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       route6b.renderTerrain();
       if(!route6b.canMoveLeft())
            main.isMovingLeft = false;
       if(!route6b.canMoveRight())
            main.isMovingRight = false;
       if(!route6b.canMoveUp())
            main.isMovingUp = false;
       if(!route6b.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x < -45)
       {
          main.x=1050;
          main.y = 315;
          switchValMain=13;
          ambianceState=2;
          //send();
       }
       if(main.y < 442 && main.x <= 587 && main.x >= 508)
       {
          switchValMain=25; 
          main.x=515;
          main.y=600;
          ambianceState=0;
          //send();
       }
       if(main.x > 1100)
       {
          main.x=20;
          main.y=265;
          switchValMain=30;
       }
       hitr5 = hitTrainer(route6a);
        if(hitr5 != null)
          if(!hitr5.defeated)
          {
             startBattle = new Battle(mainT,hitr5,desBack);
             switchValMainTemp=17;
             switchValMain=7;
          }
       break;
     case 18:
       //startBattle.song.stop();
       //if(!dangerS.isPlaying())
       //  dangerS.play();
       i++;
       if(battleLost)
        { 
          main.x=515;
          main.y=600;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : celltower1b.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       celltower1b.renderTerrain();
       if(!celltower1b.canMoveLeft())
            main.isMovingLeft = false;
       if(!celltower1b.canMoveRight())
            main.isMovingRight = false;
       if(!celltower1b.canMoveUp())
            main.isMovingUp = false;
       if(!celltower1b.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.y>650)
       {
         main.x=525;
         main.y=450;
         if(cellTower)
           switchValMain=17;
         else 
           switchValMain=16;
       }
       if(main.y < -45)
       {
         main.x=134;
         main.y=580;
         if(cellTower)
           switchValMain=999;
         else 
           switchValMain=19;
          ambianceState=1;
          //send();
       }
       hitct1 = hitTrainer(celltower1b);
        if(hitct1 != null)
          if(!hitct1.defeated)
          {
             startBattle = new Battle(mainT,hitct1,facBack);
             switchValMainTemp=18;
             switchValMain=7;
          }
       break;
     case 19:
       //startBattle.song.stop();
       //if(!dangerS.isPlaying())
       //  dangerS.play();
       i++;
       if(battleLost)
        {
          main.x=134;
          main.y=580;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : celltower2b.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       celltower2b.renderTerrain();
       if(!celltower2b.canMoveLeft())
            main.isMovingLeft = false;
       if(!celltower2b.canMoveRight())
            main.isMovingRight = false;
       if(!celltower2b.canMoveUp())
            main.isMovingUp = false;
       if(!celltower2b.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.y>650)
       {
         main.x=500;
         main.y=30;
         if(cellTower)
           switchValMain=999;
         else 
           switchValMain=18;
       }
       if(main.x>1060)
       {
         main.x=42;
         main.y=485;
         if(cellTower)
           switchValMain=999;
         else 
           switchValMain=20;
       }
       hitct2 = hitTrainer(celltower2b);
        if(hitct2 != null)
          if(!hitct2.defeated)
          {
             startBattle = new Battle(mainT,hitct2,facBack);
             switchValMainTemp=19;
             switchValMain=7;
          }
       break;
     case 20:
       //startBattle.song.stop();
       //if(!dangerS.isPlaying())
       //  dangerS.play();
       i++;
       if(battleLost)
        {
          main.x=42;
          main.y=485;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : celltower3b.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       celltower3b.renderTerrain();
       if(!celltower3b.canMoveLeft())
            main.isMovingLeft = false;
       if(!celltower3b.canMoveRight())
            main.isMovingRight = false;
       if(!celltower3b.canMoveUp())
            main.isMovingUp = false;
       if(!celltower3b.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x<-45)
       {
         main.x=965;
         main.y=265;
         if(cellTower)
           switchValMain=999;
         else 
           switchValMain=19;
       }
       if(main.y<-45)
       {
         main.x=530;
         main.y=565;
         if(cellTower)
           switchValMain=999;
         else 
           switchValMain=21;
       }
       hitct3 = hitTrainer(celltower3b);
        if(hitct3 != null)
          if(!hitct3.defeated)
          {
             startBattle = new Battle(mainT,hitct3,facBack);
             switchValMainTemp=20;
             switchValMain=7;
          }
       break;
     case 21:
       //startBattle.song.stop();
       //if(!dangerS.isPlaying())
       //  dangerS.play();
       i++;
       if(battleLost)
        {
          main.x=530;
          main.y=565;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : celltower4b.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       celltower4b.renderTerrain();
       if(!celltower4b.canMoveLeft())
            main.isMovingLeft = false;
       if(!celltower4b.canMoveRight())
            main.isMovingRight = false;
       if(!celltower4b.canMoveUp())
            main.isMovingUp = false;
       if(!celltower4b.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.y > 650)
       {
         main.x=765;
         main.y=95;
         if(cellTower)
           switchValMain=999;
         else 
           switchValMain=20;
       }
       if(main.y < -45)
       {
         main.x=526;
         main.y=301;
         if(cellTower)
           switchValMain=999;
         else 
           switchValMain=22;
       }
       hitct4 = hitTrainer(celltower4b);
        if(hitct4 != null)
          if(!hitct4.defeated)
          {
             startBattle = new Battle(mainT,hitct4,facBack);
             switchValMainTemp=21;
             switchValMain=7;
          }
       break;
      case 22: 
       //startBattle.song.stop();
       //if(!dangerS.isPlaying())
       //  dangerS.play();
        cellTower5b.renderTerrain();
        if(battleLost)
        {
          mainT.reset();
          //send();
          switchValMain++;
        }
        Dialogue zaneMonologue = new Dialogue("So... { We finally meet. { You must be the person Chris sent after me... { It's a true shame to tell you that you are too late. { I stole the Arduinos for a reason you know. { Ancient legends tell of a mythical Pokémon that lived in the Hack region that has never been beaten in battle. { This Pokémon goes by the name of Genesect. { Genesect has said to be dormant for over 1000 years! { Legend says in order to summon Genesect, you must go to a very high point in the Hack region and unleash a large amount of { electricity. That is where the Arduinos came in. { So that brings us here... { I'm sorry you missed the light show, but you showed up a bit too late... { GENESECT ATTACK!!");
        dialogueReturn=zaneMonologue.render(dialogueCounter);
        if(dialogueReturn)
        {
          startBattle = new Battle(mainT,zaneOP,facBack);
          switchValMainTemp=22;
          switchValMain=7;
          dialogueCounter=0;
        }
        break;
     case 23:
       //startBattle.song.sto/
       //menu.stop();
       //if(!chrisS.isPlaying())
       //  chrisS.play();
       switch(switchVal2)
       {
         case 0:
          background(0,0,0);
          image(loadImage("ZaneC.png"),430,195);
          Dialogue helpKid = new Dialogue("HAHAHAHAH!!! { You really thought you could stop me. { With Genesect, the whole Hack Region will bow to me!! { Now all I have to do is go town to town showing my strength until I reach the Dark Cave where my plan will fully be complete! { I would recommend you go home and stay out of my way!");
          dialogueReturn=helpKid.render(dialogueCounter);
          if(dialogueReturn)
          {
            switchVal2++;
            dialogueCounter=0;
          }
          break;
         case 1:
          background(0,0,0);
          image(chris,430,195);
          Dialogue chrisWorried = new Dialogue("... { Are you okay?? { Oh my goodness, this is not good... { I have only heard legends of Genesect, but I didn't think they were true. { If Zane's bond with Genesect stays, we are in great danger... I don't know what Zane's plans are, but they can't be good. { You need to get to the Dark Cave and stop whatever he has been planning... { Here, take another Pokémon to help you in your journey to the Dark Cave.");
          dialogueReturn=chrisWorried.render(dialogueCounter);
          if(dialogueReturn)
          {
            switchValMain++;
            dialogueCounter=0;
            switchVal2=0;
            j=0;
            arrowCounter=27;
          }
       }
       break;
     case 24:
       //if(!chrisS.isPlaying())
       //  chrisS.play();
       background(0,0,0);
       fill(255);
       text("Mamoswine",30,45);
       text("Umbreon",30,115);
       text("Altaria",30,185);
       text("Greninja",30,255);
       text("Luxray",30,325);
       text("Haxorus",30,395);
       text("Nidoking",30,465);
       text("Milotic",30,535);
       text("Talonflame",30,605);
       image(arrow,7,arrowCounter);
       image(chris,700,350);
       fourthList[j].render(700,100);
       break;
     case 25:
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       celltower1a.renderTerrain();
       if(!celltower1a.canMoveLeft())
            main.isMovingLeft = false;
       if(!celltower1a.canMoveRight())
            main.isMovingRight = false;
       if(!celltower1a.canMoveUp())
            main.isMovingUp = false;
       if(!celltower1a.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.y>650)
       {
         main.x=525;
         main.y=450;
         switchValMain=17;
         ambianceState=1;
         //send();
       }
       if(main.y < -45)
       {
         main.x=134;
         main.y=580;
         switchValMain=26;
       }
       break;
     case 26:
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       celltower2a.renderTerrain();
       if(!celltower2a.canMoveLeft())
            main.isMovingLeft = false;
       if(!celltower2a.canMoveRight())
            main.isMovingRight = false;
       if(!celltower2a.canMoveUp())
            main.isMovingUp = false;
       if(!celltower2a.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.y>650)
       {
         main.x=500;
         main.y=30;
         switchValMain=25;
       }
       if(main.x>1060)
       {
         main.x=42;
         main.y=485;
         switchValMain=27;
       }
       break;
     case 27:
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       celltower3a.renderTerrain();
       if(!celltower3a.canMoveLeft())
            main.isMovingLeft = false;
       if(!celltower3a.canMoveRight())
            main.isMovingRight = false;
       if(!celltower3a.canMoveUp())
            main.isMovingUp = false;
       if(!celltower3a.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x<-45)
       {
         main.x=965;
         main.y=265;
         switchValMain=26;
       }
       if(main.y<-45)
       {
         main.x=530;
         main.y=565;
         switchValMain=28;
       }
       break;
     case 28:
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       celltower4a.renderTerrain();
       if(!celltower4a.canMoveLeft())
            main.isMovingLeft = false;
       if(!celltower4a.canMoveRight())
            main.isMovingRight = false;
       if(!celltower4a.canMoveUp())
            main.isMovingUp = false;
       if(!celltower4a.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.y > 650)
       {
         main.x=765;
         main.y=95;
         switchValMain=27;
       }
       if(main.y < -45)
       {
         main.x=530;
         main.y=565;
         switchValMain=29;
       }
       break;
      case 29:
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       cellTower5a.renderTerrain();
       if(!cellTower5a.canMoveLeft())
            main.isMovingLeft = false;
       if(!cellTower5a.canMoveRight())
            main.isMovingRight = false;
       if(!cellTower5a.canMoveUp())
            main.isMovingUp = false;
       if(!cellTower5a.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.y > 650)
       {
         main.x=530;
         main.y=110;
         switchValMain=28;
       }
       break;
     case 30:
       //startBattle.song.stop();
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       if(battleLost)
        {
          main.x=20;
          main.y=265;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : route7.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       route7.renderTerrain();
       if(!route7.canMoveLeft())
            main.isMovingLeft = false;
       if(!route7.canMoveRight())
            main.isMovingRight = false;
       if(!route7.canMoveUp())
            main.isMovingUp = false;
       if(!route7.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x < -45)
       {
          main.x=1050;
          main.y = 355;
          switchValMain=17;
       }
       if(main.x > 1100)
       {
          main.x=20;
          main.y = 355;
          switchValMain=31;
       }
       hitr7 = hitTrainer(route7);
        if(hitr7 != null)
          if(!hitr7.defeated)
          {
             startBattle = new Battle(mainT,hitr7,treeBack);
             switchValMainTemp=30;
             switchValMain=7;
          }
       break;
     case 31:
       //startBattle.song.stop();
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       if(battleLost)
        {
          main.x=20;
          main.y = 355;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : route8.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       route8.renderTerrain();
       if(!route8.canMoveLeft())
            main.isMovingLeft = false;
       if(!route8.canMoveRight())
            main.isMovingRight = false;
       if(!route8.canMoveUp())
            main.isMovingUp = false;
       if(!route8.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x < -45)
       {
          main.x=1050;
          main.y = 265;
          switchValMain=30;
       }
       if(main.y < -45)
       {
          main.x=215;
          main.y = 600;
          switchValMain=32;
       }
       hitr8 = hitTrainer(route8);
        if(hitr8 != null)
          if(!hitr8.defeated)
          {
             startBattle = new Battle(mainT,hitr8,treeBack);
             switchValMainTemp=31;
             switchValMain=7;
          }
       break;
     case 32:
       //startBattle.song.stop();
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       if(battleLost)
        {
          main.x=215;
          main.y = 600;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : route9.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       route9.renderTerrain();
       if(!route9.canMoveLeft())
            main.isMovingLeft = false;
       if(!route9.canMoveRight())
            main.isMovingRight = false;
       if(!route9.canMoveUp())
            main.isMovingUp = false;
       if(!route9.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.y > 650)
       {
          main.x=870;
          main.y = 10;
          switchValMain=31;
       }
       if(main.x > 1100)
       {
          main.x=20;
          main.y = 350;
          switchValMain=33;
       }
       hitr9 = hitTrainer(route9);
        if(hitr9 != null)
          if(!hitr9.defeated)
          {
             startBattle = new Battle(mainT,hitr9,treeBack);
             switchValMainTemp=32;
             switchValMain=7;
          }
       break;
     case 33:
       //startBattle.song.stop();
       //caveS.stop();
       //if(!grassS.isPlaying())
       //  grassS.play();
       i++;
       if(battleLost)
        {
          main.x=20;
          main.y = 350;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : route10.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       route10.renderTerrain();
       if(!route10.canMoveLeft())
            main.isMovingLeft = false;
       if(!route10.canMoveRight())
            main.isMovingRight = false;
       if(!route10.canMoveUp())
            main.isMovingUp = false;
       if(!route10.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x < -45)
       {
          main.x=1050;
          main.y = 255;
          switchValMain=32;
       }
       if(main.x > 1080)
       {
          main.x=80;
          main.y = 430;
          if(pickedFifth)
          {
            switchValMain=36;
            ambianceState=4;
            //send();
          }
          else
          {
            switchValMain=34;
            ambianceState=0;
            //send();
          }
       }
       hitr10 = hitTrainer(route10);
        if(hitr10 != null)
          if(!hitr10.defeated)
          {
             startBattle = new Battle(mainT,hitr10,treeBack);
             switchValMainTemp=33;
             switchValMain=7;
          }
       break;
     case 34:
       //startBattle.song.stop();
       //grassS.stop();
       //if(!chrisS.isPlaying())
       //  chrisS.play();
       background(0,0,0);
       image(chris,430,195);
       Dialogue caveEnter = new Dialogue("Pssst... { Hey, its me Chris { You are about to enter the Dark Cave! { Team Proto have already made it here and are causing havoc! { It's all over the news! { Apparently, whatever Zane has planned is causing the whole { region to go out of whack. { This could only mean one thing... { and its not good. { The Dark Cave is rumored to be the gateway between our world and the spirit world. { In the spirit world, the God of all Pokémon, Arceus, lives. { It was told that the only Pokémon to ever rival Arceus was { Genesect! { Somehow, Zane is trying to use Genesect to capture Arceus... If this happens... { Oh my! I couldn't even imagine what would happen. { The whole region could crumble! { You have to put a stop to this! { I have gathered help from people all over the region to lend you a choice between the strongest of Pokémon! { Here, take your pick.");
       dialogueReturn=caveEnter.render(dialogueCounter);
       if(dialogueReturn)
       {
         switchValMain++;
         dialogueCounter=0;
       }
       break;
     case 35:
       //if(!chrisS.isPlaying())
       //  chrisS.play();
       background(0,0,0);
       fill(255);
       text("Dragonite",30,45);
       text("Tyranitar",30,115);
       text("Salamence",30,185);
       text("Metagross",30,255);
       text("Garchomp",30,325);
       text("Hydreigon",30,395);
       text("Volcarona",30,465);
       text("Goodra",30,535);
       text("Noivern",30,605);
       image(arrow,7,arrowCounter);
       image(chris,700,350);
       fifthList[j].render(700,100);
       break;
     case 36:
       //startBattle.song.stop();
       //chrisS.stop();
       //grassS.stop();
       //if(!caveS.isPlaying())
       //  caveS.play();
       i++;
       if(battleLost)
        {
          main.x=80;
          main.y = 430;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : darkCave1.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       darkCave1.renderTerrain();
       if(!darkCave1.canMoveLeft())
            main.isMovingLeft = false;
       if(!darkCave1.canMoveRight())
            main.isMovingRight = false;
       if(!darkCave1.canMoveUp())
            main.isMovingUp = false;
       if(!darkCave1.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x < 25)
       {
          main.x=1000;
          main.y = 350;
          switchValMain=33;
          ambianceState=1;
          //send();
       }
       if(main.x > 1100)
       {
         main.x=20;
         main.y = 435;
         switchValMain=37;
       }
       hitdc1 = hitTrainer(darkCave1);
        if(hitdc1 != null)
          if(!hitdc1.defeated)
          {
             startBattle = new Battle(mainT,hitdc1,caveBack);
             switchValMainTemp=36;
             switchValMain=7;
          }
       break;
     case 37:
       //startBattle.song.stop();
       //if(!caveS.isPlaying())
       //  caveS.play();
       i++;
       if(battleLost)
        {
          main.x=20;
          main.y = 435;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : darkCave2.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       darkCave2.renderTerrain();
       if(!darkCave2.canMoveLeft())
            main.isMovingLeft = false;
       if(!darkCave2.canMoveRight())
            main.isMovingRight = false;
       if(!darkCave2.canMoveUp())
            main.isMovingUp = false;
       if(!darkCave2.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x < -45)
       {
          main.x=1050;
          main.y = 160;
          switchValMain=36;
       }
       if(main.y < -45)
       {
          main.x=245;
          main.y = 600;
          switchValMain=38;
       }
       hitdc2 = hitTrainer(darkCave2);
        if(hitdc2 != null)
          if(!hitdc2.defeated)
          {
             startBattle = new Battle(mainT,hitdc2,caveBack);
             switchValMainTemp=37;
             switchValMain=7;
          }
       break;
     case 38:
       //startBattle.song.stop();
       //if(!caveS.isPlaying())
       //  caveS.play();
       i++;
       if(battleLost)
        {
          main.x=245;
          main.y = 600;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : darkCave3.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       darkCave3.renderTerrain();
       if(!darkCave3.canMoveLeft())
            main.isMovingLeft = false;
       if(!darkCave3.canMoveRight())
            main.isMovingRight = false;
       if(!darkCave3.canMoveUp())
            main.isMovingUp = false;
       if(!darkCave3.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.y > 650)
       {
          main.x=835;
          main.y = 10;
          switchValMain=37;
       }
       if(main.x > 1100)
       {
          main.x=20;
          main.y = 375;
          switchValMain=39;
       }
       hitdc3 = hitTrainer(darkCave3);
        if(hitdc3 != null)
          if(!hitdc3.defeated)
          {
             startBattle = new Battle(mainT,hitdc3,caveBack);
             switchValMainTemp=38;
             switchValMain=7;
          }
       break;
     case 39:
       //startBattle.song.stop();
       //if(!caveS.isPlaying())
       //  caveS.play();
       i++;
       if(battleLost)
        {
          main.x=20;
          main.y = 375;
          mainT.reset();
          //send();
          battleLost=false;
          for(TrainerHit trainer : darkCave4.trainers)
          {
              trainer.trainer.softReset();
          }
        }
       darkCave4.renderTerrain();
       if(!darkCave4.canMoveLeft())
            main.isMovingLeft = false;
       if(!darkCave4.canMoveRight())
            main.isMovingRight = false;
       if(!darkCave4.canMoveUp())
            main.isMovingUp = false;
       if(!darkCave4.canMoveDown())
            main.isMovingDown = false;
       main.moveLeft();
       main.moveRight();
       main.moveUp();
       main.moveDown();
       if(main.x < -45)
       {
          main.x=1050;
          main.y = 155;
          switchValMain=38;
       }
       if(main.y < -45)
       {
          main.x=515;
          main.y = 340;
          switchValMain=40;
          ambianceState=0;
          //send();
          main.isMovingUp = false;
       }
       hitdc4 = hitTrainer(darkCave4);
        if(hitdc4 != null)
          if(!hitdc4.defeated)
          {
             startBattle = new Battle(mainT,hitdc4,caveBack);
             switchValMainTemp=39;
             switchValMain=7;
          }
       break;
      case 40: 
         //startBattle.song.stop();
         //if(!caveS.isPlaying())
         //  caveS.play();
        finalA.renderTerrain();
        startBattle = new Battle(mainT,zane,caveBack);
        if(startBattle.battleWon())
        {
          switchValMain=42;  
        }
        Dialogue zaneMonologue2 = new Dialogue("Well then... { I thought I told you to not follow me! { You shouldn't have come here... { Your a smart guy, I bet you already know my plan... { With Arceus at my command, I could tear down the Hack Region and shape it into a society ruled by Team Proto! { No one will ever stand in our way and true power will be mine! Now Genesect! Use your power to summon Arceus! { GENESECT! { BOOM!!");
        dialogueReturn=zaneMonologue2.render(dialogueCounter);
        if(dialogueReturn)
        {
          switchValMain++;
          switchVal2=0;
          dialogueCounter=0;
          if(!addArceus)
          {
            mainT.addPoke(arceus);  
            addArceus=true;
          }
        }
        break;
      case 41:  //<>//
       //startBattle.song.stop();
       //if(!caveS.isPlaying())
       //  caveS.play();
        if(startBattle.battleWon())
        {
          switchValMain++;  
        }
        if(battleLost)
        {
          mainT.reset();
          //send();
          battleLost=false;
          zane.reset();
          switchValMain=40;
        }
        finalB.renderTerrain();
        Dialogue zaneMonologue4 = new Dialogue("... { ARCEUS!! { *Arceus seems to want to help you defeat Zane* { ARCEUS!! { WHAT!! { Arceus how dare you help this scum! { Fine then, I'll have to do this the hard way. { Bring it on!");
        dialogueReturn=zaneMonologue4.render(dialogueCounter);
        if(dialogueReturn)
        {
          switchValMainTemp=41;
          switchValMain=7;
          dialogueCounter=0;
        }
        break;
     case 42:
       //startBattle.song.stop();
       //if(!caveS.isPlaying())
       //  caveS.play();
       background(0,0,0);
       image(loadImage("ZaneC.png"),430,195);
       Dialogue zaneEnd = new Dialogue("NO!! { This can't be!! { How did you do it? { All my plans... { RUINED!!!!");
       dialogueReturn=zaneEnd.render(dialogueCounter);
       if(dialogueReturn)
       {
         switchValMain++;
         dialogueCounter=0;
       }
       break;
      case 43: 
       //startBattle.song.stop();
       //if(!caveS.isPlaying())
       //  caveS.play();
        finalC.renderTerrain();
        Dialogue chrisFinal = new Dialogue("Well Done! { I knew I could count on you to put a stop to Zane! { You did a great service to the region and every is very thankful! Zane will be locked up and stripped of his Pokémon for a very long time for what he tried to do. { As for Arceus and Genesect, Arceus has already left for the spirit world and took Genesect with him to be locked up. { Well done trainer, you truly made the Hack Region proud!");
        dialogueReturn=chrisFinal.render(dialogueCounter);
        if(dialogueReturn)
        {
          switchValMain++;
          dialogueCounter=0;
        }
        break;
      case 44:
       //startBattle.song.stop();
       //if(!caveS.isPlaying())
       //  caveS.play();
        background(0,0,0);
        Dialogue credits = new Dialogue("Thank you so much for playing Pokémon Hack Version! { This game was made by Riley Croker for his final project in { Physical Computing. { He would like to make sure to shout out the Pokémon Company { for using/altering a lot of their sprites. { Thank you for playing!");
        dialogueReturn=credits.render(dialogueCounter);
        if(dialogueReturn)
        {
          switchValMain++;
          dialogueCounter=0;
        }
        break;
      case 45:
       //startBattle.song.stop();
       if(!caveS.isPlaying())
         caveS.play();
        background(0,0,0);
        break;
       
  }
}

//void send()
//{
//  message = "[" + outgoingBattleState1 + "," + outgoingBattleState2 + "," + outgoingBattleState3 + "," + outgoingBattleState4 + "," + outgoingBattleState5 + "," + outgoingBattleState6 + "," + ambianceState + "]\n";  
//  port.write(message);
//  println("message is: " + message);
//}

//void mousePressed()
//{
//   switch(switchValMain)
//   {
//      case 0:
//        switchValMain++;
//        break;
//      case 1:
//        switchValMain++;
//        break;
//      case 2:
//        switchValMain++;
//        mainT = new Trainer("Main",grassy,new Dialogue(" "),starterList[j].copyPok());
//        break;
//      case 3: 
//        switchValMain++;
//        break;
//      case 4:
//        switchValMain++;
//        break;
//      case 5:
//        switchValMain++;
//        break;
//      case 6:
//        switchValMain+=2;
//        break;
//      case 8:
//        switchValMain++;
//        break;
//      case 9:
//        switchValMain++;
//        break;
//      case 11:
//        switchValMain++;
//        break;
//      case 12:
//        switchValMain++;
//        break;
//      case 13:
//        switchValMain++;
//        break;
//      case 14:
//        switchValMain++;
//        break;
//      case 16:
//        switchValMain=18;
//        break;
//      case 18:
//        switchValMain=19;
//        break;
//      case 19:
//        switchValMain=20;
//        break;
//      case 20:
//        switchValMain=21;
//        break;
//      case 21:
//        switchValMain=22;
//        main.x=530;
//        main.y=301;
//        break;
//      case 22:
//        switchValMain=23;
//        break;
//      case 23:
//        switchValMain=24;
//        break;
//      case 17:
//        switchValMain=30;
//        break;
//      case 30:
//        switchValMain=31;
//        break;
//      case 31:
//        switchValMain=32;
//        break;
//      case 32:
//        switchValMain=33;
//        break;
//      case 33:
//        switchValMain=34;
//        break;
//      case 34:
//        switchValMain=35;
//        break;
//      case 36:
//        switchValMain=37;
//        break;
//      case 37:
//        switchValMain=38;
//        break;
//      case 38:
//        switchValMain=39;
//        break;
//      case 39:
//        main.x=525;
//        main.y = 340;
//        switchValMain=40;
//        break;
//      case 40:
//        switchValMain=41;
//        break;
//      case 41:
//        switchValMain=42;
//        break;
//   }
//}

void mainCheckPoke()
{
  if(mainT.slot1.name == "None")
    outgoingBattleState1=0;
  else if(mainT.slot1.fainted)
    outgoingBattleState1=1;
  else
    outgoingBattleState1=2;
    
  if(mainT.slot2.name == "None")
    outgoingBattleState2=0;
  else if(mainT.slot2.fainted)
    outgoingBattleState2=1;
  else
    outgoingBattleState2=2;
    
  if(mainT.slot3.name == "None")
    outgoingBattleState3=0;
  else if(mainT.slot3.fainted)
    outgoingBattleState3=1;
  else
    outgoingBattleState3=2;
    
  if(mainT.slot4.name == "None")
    outgoingBattleState4=0;
  else if(mainT.slot4.fainted)
    outgoingBattleState4=1;
  else
    outgoingBattleState4=2;
    
  if(mainT.slot5.name == "None")
    outgoingBattleState5=0;
  else if(mainT.slot5.fainted)
    outgoingBattleState5=1;
  else
    outgoingBattleState5=2;
    
  if(mainT.slot6.name == "None")
    outgoingBattleState6=0;
  else if(mainT.slot6.fainted)
    outgoingBattleState6=1;
  else
    outgoingBattleState6=2;
}

void keyPressed()
{
  switch(switchValMain)
   {
      case 0:
        if(key == 'c')
        {
          switchValMain++;
        }
        break;
      case 1:
        switch(switchVal2)
        {
          case 0:
            if(key == 'c')
              dialogueCounter++; //intro
            break;
        case 1:
            if(key == 'c')
              dialogueCounter++; //intro 2
            break;
        }
        break;
      case 2:
        if(key =='w' && arrowCounter > 27)
        {
          j--;
          arrowCounter-=70;
        }
        if(key =='s' && arrowCounter <= 580)
        {
          j++;
          arrowCounter+=70;
        }
        if(key=='c')
        {
          mainT = new Trainer("Main",grassy,new Dialogue(" "),starterList[j].copyPok());
          startBattle = new Battle(mainT,chrisT,facBack);
          switchValMainTemp=3;
          switchValMain=7;
        }
        break;
      case 3:
        if(key == 'c')
          dialogueCounter++; //intro 2
        break;
      case 4: case 5: case 6: case 8: case 11: case 12: case 13: case 16: case 17: case 18: case 19: case 20: case 21: case 25: case 26: case 27: case 28: case 29: case 30: case 31: case 32: case 33: case 36: case 37: case 38: case 39:
        if(switchValMain==4) curRoute=lab;
        else if(switchValMain==5) curRoute=route0;
        else if(switchValMain==6) curRoute=route1;
        else if(switchValMain==8) curRoute=route2;
        else if(switchValMain==11) curRoute=route3;
        else if(switchValMain==12) curRoute=route4;
        else if(switchValMain==13) curRoute=route5;
        else if(switchValMain==16) curRoute=route6a;
        else if(switchValMain==17) curRoute=route6b;
        else if(switchValMain==18) curRoute=celltower1b;
        else if(switchValMain==19) curRoute=celltower2b;
        else if(switchValMain==20) curRoute=celltower3b;
        else if(switchValMain==21) curRoute=celltower4b;
        else if(switchValMain==25) curRoute=celltower1a;
        else if(switchValMain==26) curRoute=celltower2a;
        else if(switchValMain==27) curRoute=celltower3a;
        else if(switchValMain==28) curRoute=celltower4a;
        else if(switchValMain==29) curRoute=cellTower5a;
        else if(switchValMain==30) curRoute=route7;
        else if(switchValMain==31) curRoute=route8;
        else if(switchValMain==32) curRoute=route9;
        else if(switchValMain==33) curRoute=route10;
        else if(switchValMain==36) curRoute=darkCave1;
        else if(switchValMain==37) curRoute=darkCave2;
        else if(switchValMain==38) curRoute=darkCave3;
        else if(switchValMain==39) curRoute=darkCave4;
        if(key == 'a')
        {
          if(main.isMovingLeft && !curRoute.canMoveLeft())
            main.isMovingLeft = false;
          if(curRoute.canMoveLeft()) 
            main.isMovingLeft = true;
          i++;
          if(i>50)
            i=0;
          if(i<25)
            main.setCurrImage(main.leftW1);
          else if(i>=25)
            main.setCurrImage(main.leftW2);
        }
        else if(key == 'd')
        {
           if(curRoute.canMoveRight()) 
             main.isMovingRight = true;
           i++;
           if(i>50)
             i=0;
           if(i<25)
             main.setCurrImage(main.rightW1);
           else if(i>=25)
             main.setCurrImage(main.rightW2);
        }
        else if(key == 'w')
        {
           if(curRoute.canMoveUp())
             main.isMovingUp = true;
           i++;
           if(i>50)
             i=0;
           if(i<25)
             main.setCurrImage(main.backW1);
           else if(i>=25)
             main.setCurrImage(main.backW2);
        }
        else if(key == 's')
        {
           if(curRoute.canMoveDown()) 
             main.isMovingDown = true;
           i++;
           if(i>50)
             i=0;
           if(i<25)
             main.setCurrImage(main.frontW1);
           else if(i>=25)
             main.setCurrImage(main.frontW2);
        }
        break;
      case 7:
        if(battleStart)
        {
          switch(battleCounter)
          {
            case 0:
              if(key=='d')
                battleCounter++;
              else if(key=='c')
              {
                battleCounter+=2;
                arrowCordAtk=247;
              }
              break;
            case 1:
              if(key=='a')
                battleCounter--;
              else if(key=='c')
              {
                battleCounter+=2;
                arrowCordSwt=247;
              }
              break;
            case 2:
              if(key=='x')
                battleCounter-=2;
              else if(key=='w' && arrowCordAtk>247)
                arrowCordAtk-=70;
              else if(key=='s' && arrowCordAtk<457)
                arrowCordAtk+=70;
              else if(key=='c' && arrowCordAtk==247 && startBattle.mainCurr.move1.ppLeft>0)
              {
                battleTurn1(startBattle,startBattle.mainCurr.move1,startBattle.enemyCurr.useRandomMove());
              }
              else if(key=='c' && arrowCordAtk==317 && startBattle.mainCurr.move2.ppLeft>0)
              {
                battleTurn1(startBattle,startBattle.mainCurr.move2,startBattle.enemyCurr.useRandomMove());
              }
              else if(key=='c' && arrowCordAtk==387 && startBattle.mainCurr.move3.ppLeft>0)
              {
                battleTurn1(startBattle,startBattle.mainCurr.move3,startBattle.enemyCurr.useRandomMove());
              }
              else if(key=='c' && arrowCordAtk==457 && startBattle.mainCurr.move4.ppLeft>0)
              {
                battleTurn1(startBattle,startBattle.mainCurr.move4,startBattle.enemyCurr.useRandomMove());
              }
              break;
            case 3:
              if(key=='x')
                battleCounter-=2;
              else if(key=='w' && arrowCordSwt>247)
                arrowCordSwt-=45;
              else if(key=='s' && arrowCordSwt<452)
                arrowCordSwt+=45;
              else if(key=='c' && arrowCordSwt==247 && !mainT.returnPos(1).fainted)
              {
                startBattle.switchMon(1);
                battleCounter-=3;
              }
              else if(key=='c' && arrowCordSwt==292 && !mainT.returnPos(2).fainted)
              {
                startBattle.switchMon(2);
                battleCounter-=3;
              }
              else if(key=='c' && arrowCordSwt==337 && !mainT.returnPos(3).fainted)
              {
                startBattle.switchMon(3);
                battleCounter-=3;
              }
              else if(key=='c' && arrowCordSwt==382 && !mainT.returnPos(4).fainted)
              {
                startBattle.switchMon(4);
                battleCounter-=3;
              }
              else if(key=='c' && arrowCordSwt==427 && !mainT.returnPos(5).fainted)
              {
                startBattle.switchMon(5);
                battleCounter-=3;
              }
              else if(key=='c' && arrowCordSwt==472 && !mainT.returnPos(6).fainted)
              {
                startBattle.switchMon(6);
                battleCounter-=3;
              }
            case 4:
              if(key == ENTER)
              {
                  startBattle.main.checkIfDefeated();
                  if(startBattle.main.defeated)
                    return;
                  arrowCordSwt=247;
                  battleCounter=3;
                  renderBattle(battleCounter,startBattle);
              }
              else if(battleCounter==4)
              { 
                  Dialogue mainFainted = new Dialogue("Your " + startBattle.mainCurr.name + " has fainted, Press Enter to Continue");
                  mainFainted.render(0);
                  //send();
              }
              break;
            case 5:
              if(key == ENTER)
              {
                  startBattle.enemy.checkIfDefeated();
                  if(startBattle.enemy.defeated)
                    return;
                  startBattle.sendRandPok();
                  battleCounter=0;
              }
              else
              {
                  Dialogue enemyFainted = new Dialogue("Enemy " + startBattle.enemyCurr.name + " has fainted, Press Enter to Continue");
                  enemyFainted.render(0);
              }
              break;
            case 6:
               if(arrowCordAtk==247)
               {
                 battleTurn2(startBattle,startBattle.mainCurr.move1,startBattle.enemyCurr.useRandomMove());
               }
               else if(arrowCordAtk==317)
               {
                 battleTurn2(startBattle,startBattle.mainCurr.move2,startBattle.enemyCurr.useRandomMove());
               }
               else if(arrowCordAtk==387)
               {
                 battleTurn2(startBattle,startBattle.mainCurr.move3,startBattle.enemyCurr.useRandomMove());
               }
               else if(arrowCordAtk==457)
               {
                 battleTurn2(startBattle,startBattle.mainCurr.move4,startBattle.enemyCurr.useRandomMove());
               }
               break;
            case 7:
               if(key=='c')
                 battleCounter = 0;
               break;
            case 8:
               if(key=='c')
                 battleDone1=true;
               break; 
            case 9:
               if(key=='c')
               {
                 battleCounter=10;
                 //send();
               }
               break;
             case 10:
               if(key=='c')
                 battleCounter=0;
               break;
             case 11:
               if(key=='c')
               {
                 battleDone=true;
               }
               break;
              
          }  
          break;
        }
        case 9:
          if(key == 'c')
            dialogueCounter++; //intro 2
          break;
        case 10:
          if(key =='w' && arrowCounter > 27)
          {
            j--;
            arrowCounter-=70;
          }
          if(key =='s' && arrowCounter <= 580)
          {
            j++;
            arrowCounter+=70;
          }
          if(key=='c')
          {
            mainT.addPoke(secondaryList[j]);
            pickedSecond = true;
            main.isMovingLeft = false;
            main.isMovingRight = false;
            main.isMovingUp = false;
            main.isMovingDown = false;
            switchValMain++;
            main.x=210;
            main.y=20;
            ambianceState=2;
            //send();
          }
          break;
      case 14:
        if(key == 'c')
          dialogueCounter++; //intro 2
        break;
      case 15:
        if(key =='w' && arrowCounter > 27)
        {
          j--;
          arrowCounter-=70;
        }
        if(key =='s' && arrowCounter <= 580)
        {
          j++;
          arrowCounter+=70;
        }
        if(key=='c')
        {
          mainT.addPoke(thirdList[j]);
          pickedThird = true;
          main.isMovingLeft = false;
          main.isMovingRight = false;
          main.isMovingUp = false;
          main.isMovingDown = false;
          switchValMain++;
          ambianceState=1;
         // send();
        }
        break;
      case 22:
        if(key == 'c')
          dialogueCounter++; 
        break;
      case 23:
        if(key == 'c')
          dialogueCounter++; 
        break;
      case 24:
        if(key =='w' && arrowCounter > 27)
        {
          j--;
          arrowCounter-=70;
        }
        if(key =='s' && arrowCounter <= 580)
        {
          j++;
          arrowCounter+=70;
        }
        if(key=='c')
        {
          mainT.addPoke(fourthList[j]);
          main.isMovingLeft = false;
          main.isMovingRight = false;
          main.isMovingUp = false;
          main.isMovingDown = false;
          switchValMain=17;
          main.x=20;
          main.y=355;
          cellTower=true;
          ambianceState=1;
          //send();
        }
        break;
      case 34:
        if(key == 'c')
          dialogueCounter++; 
        break;
      case 35:
        if(key =='w' && arrowCounter > 27)
        {
          j--;
          arrowCounter-=70;
        }
        if(key =='s' && arrowCounter <= 580)
        {
          j++;
          arrowCounter+=70;
        }
        if(key=='c')
        {
          mainT.addPoke(fifthList[j]);
          pickedFifth=true;
          main.isMovingLeft = false;
          main.isMovingRight = false;
          main.isMovingUp = false;
          main.isMovingDown = false;
          main.x=80;
          main.y = 430;
          switchValMain=36;
          ambianceState=4;
         // send();
        }
        break;
      case 40:
        if(key == 'c')
          dialogueCounter++; //intro 2
        break;
      case 41:
        if(key == 'c')
          dialogueCounter++; //intro 2
        break;
      case 42:
        if(key == 'c')
          dialogueCounter++; //intro 2
        break;
      case 43:
        if(key == 'c')
          dialogueCounter++; //intro 2
        break;
      case 44:
        if(key == 'c')
          dialogueCounter++; //intro 2
        break;
 }
}
   

void keyReleased()
{
  switch(switchValMain)
   {
      case 4: case 5: case 6: case 8: case 11: case 12: case 13: case 16: case 17: case 18: case 19: case 20: case 21: case 25: case 26: case 27: case 28: case 29: case 30: case 31: case 32: case 33: case 36: case 37: case 38: case 39:
        if(key == 'a')
        {
           main.isMovingLeft = false;
           main.setCurrImage(main.leftS);
        }
        else if(key == 'd')
        {
           main.isMovingRight = false;
           main.setCurrImage(main.rightS);
        }
        else if(key == 'w')
        {
           main.isMovingUp = false;
           main.setCurrImage(main.backS);
        }
        else if(key == 's')
        {
           main.isMovingDown = false;
           main.setCurrImage(main.frontS);
        }
        break;
   }
}

void waitD()
  {
    int i = millis();
    while(millis()-i<1000)
     {
     }  
  }
  
Trainer hitTrainer(Terrain aTerrain)
{
    for(TrainerHit trainerHit : aTerrain.trainers)
    {
        if(trainerHit.hitTrainer(main.x,main.y))
          return trainerHit.trainer;
    }
    return null;
}

void battleTurn1(Battle aBattle, Move myMove, Move enemyMove)
{
    if(aBattle.mainCurr.speed >= aBattle.enemyCurr.speed)
    {
      if(myMove.useMove())
      {
        move = new Dialogue("Your " + aBattle.mainCurr.name + " used " + myMove.name);
        move.render(0);
        boolean faint = startBattle.myTurn(myMove);
        if(faint)
          battleCounter=5;
        else
          battleCounter=6;
      }
      else 
      {
         move = new Dialogue("Your " + aBattle.mainCurr.name + " used " + myMove.name + ", but it missed!");
         move.render(0);
         battleCounter=6;
      }
    }
    else
    {
      if(enemyMove.useMove())
      {
        move = new Dialogue("Enemy " + aBattle.enemyCurr.name + " used " + enemyMove.name);
        move.render(0);
        boolean faint = startBattle.enemyTurn(enemyMove);
        if(faint)
          battleCounter=4; 
        else
          battleCounter=6;
      }
      else
      {
         move = new Dialogue("Enemy " + aBattle.enemyCurr.name + " used " + enemyMove.name + ", but it missed!");
         move.render(0);
         battleCounter=6;
      }
    }
}
void battleTurn2(Battle aBattle, Move myMove, Move enemyMove)
{
    
    if(aBattle.mainCurr.speed < aBattle.enemyCurr.speed)
    {
      if(myMove.useMove())
      {
        move = new Dialogue("Your " + aBattle.mainCurr.name + " used " + myMove.name);
        move.render(0);
        boolean faint = startBattle.myTurn(myMove);
        if(faint)
          battleCounter=5;
        else
          battleCounter=7;
      }
      else 
      {
         move = new Dialogue("Your " + aBattle.mainCurr.name + " used " + myMove.name + ", but it missed!");
         move.render(0);
         battleCounter=7;
      }
    }
    else
    {
      if(enemyMove.useMove())
      {
        move = new Dialogue("Enemy " + aBattle.enemyCurr.name + " used " + enemyMove.name);
        move.render(0);
        boolean faint = startBattle.enemyTurn(enemyMove);
        if(faint)
          battleCounter=4; 
        else
          battleCounter=7;
      }
      else
      {
         move = new Dialogue("Enemy " + aBattle.enemyCurr.name + " used " + enemyMove.name + ", but it missed!");
         move.render(0);
         battleCounter=7;
      }
    }
}

void renderBattle(int aBattleCounter,Battle battle)
{
  battleStart=true;
  switch(aBattleCounter)
  {
    case 0:
      battle.renderNormAtk();
      battle.enemy.renderPokeLeft(50,210);
      break;
    case 1:
      battle.renderNormSwt();
      battle.enemy.renderPokeLeft(50,210);
      break;
    case 2:
      battle.renderMoveSelect();
      image(arrowBlack,558,arrowCordAtk);
      battle.enemy.renderPokeLeft(50,210);
      break;
    case 3:
      battle.renderPokemonSwitch();
      image(arrowBlack,558,arrowCordSwt);
      Dialogue switchDi = new Dialogue("Send in a new pokemon!");
      switchDi.render(0);
      battle.enemy.renderPokeLeft(50,210);
      break;
    case 9:
      startBattle.renderBegin();
      break;
    case 10:
      startBattle.renderBegin();
      break;
  }
}
