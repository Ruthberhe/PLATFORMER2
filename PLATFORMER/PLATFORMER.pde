import fisica.*;
FWorld world;


color white        =#FFFFFF;
color black        =#000000;   //spike
color green        =#0DFF00;
color red          =#FF0000;
color yellow       =#FFFF00;   //trampoline
color blue         =#0000FF;
color  purple      =#6F3198;
color  grey        =#A1A1A1;
color cyan          =#00BBFF;  //ice
color dblue         =#0905F7;
color  lpink        =#FFA3B1;
color dbrown       =#765339;    //normal ground
color lbrown       =#FFAD60;
color   pink    =#F700B9;
color   burgindi =#592B2B;
color   dgrey    =#545454;
color    lgreen   =#8BC34A;  //dirt
color middleGreen  =#00FF00;
color leftGreen    =#009F00;
color rightGreen   =#006F00;
color centerGreen  =#004F00;
color treeTrunkBrown  =#FF9500;
color  orange   =#FF8400;

Gif mariogif;
Button begin;

final int INTRO    = 0;
final int PLAY     = 1;
final int GAMEOVER = 2;
final int OPTIONS  = 3;

int mode;
boolean mouseReleased;
boolean wasPressed;

PImage MAP3, MAP4, MAP41, MAP412, FINALMAP1, MAPPY43, dirtc, dirts, dirtse, dirtsw, brick, checkpoint, ice, spike, treetrunk, treeintersect, treetopc, treetope, treetopw, bridgec, bridgee, bridgew, bridgeRailsc, bridgeRailse, bridgeRailsw, trampoline, lava0, lava1, lava2, lava3, lava4, lava5, goomba0, goomba1, goomba2, idle0, idle1, jump0, runright1, runright2, hammer, hammerbro0, hammerbro1, thwomp0, thwomp1;
//Gif lva;
PImage[] lava;
PImage[] goomba;
PImage[] hammerBro;
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] action;
int gridSize =32;
float zoom=0.5;
int lives, score;

Fplayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;


boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey, spacekey;

void setup() {
  // size(600, 400);
  fullScreen();
  Fisica.init(this);
//loadWorld(FINALMAP1);
  initializeModes();
  initializegifandbutton();
  initializevariables();
}



void initializeModes() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode=INTRO;
}
void initializevariables() {
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();


  checkpoint= loadImage("checkpoint.png");
  dirts= loadImage("dirt_s.png");
  dirtse= loadImage("dirt_se.png");
  dirtsw= loadImage("dirt_sw.png");
  dirtc= loadImage("dirt_center.png");
  FINALMAP1= loadImage("FINALMAP3.png");
  MAP41= loadImage("MAP4.1.png");
  MAP412= loadImage("MAP4.12.png");
  MAPPY43= loadImage("MAPPY432100.png");
  spike= loadImage("spike.png");
  brick= loadImage("brick.png");
  treetrunk= loadImage("tree_trunk.png");
  treeintersect= loadImage("tree_intersect.png");
  treetopc= loadImage("treetop_center.png");
  treetope= loadImage("treetop_e.png");
  treetopw= loadImage("treetop_w.png");
  ice= loadImage("blueBlock.png");
  bridgec= loadImage("bridge_center.png");
  bridgew= loadImage("bridge_w.png");
  bridgee= loadImage("bridge_e.png");
  bridgeRailsc= loadImage("bridgeRails_center.png");
  bridgeRailsw= loadImage("bridge_w.png");
  bridgee= loadImage("bridge_e.png");
  trampoline= loadImage("trampoline.png");
  hammer = loadImage("hammer.png");

  thwomp0 = loadImage("thwomp0.png");
  thwomp1 = loadImage("thwomp1.png");

  //lava
  lava= new PImage[6];

  lava[0] = loadImage("lava0.png");
  lava[1] = loadImage("lava1.png");
  lava[1] = loadImage("lava2.png");
  lava[3] = loadImage("lava3.png");
  lava[4] = loadImage("lava4.png");
  lava[5] = loadImage("lava5.png");


  //player
  idle = new PImage[2];
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");

  jump = new PImage[1];
  jump[0] = loadImage("jump0.png");


  run= new  PImage[3];
  run[0] = loadImage("runright0.png");
  run[1] = loadImage("runright1.png");
  run[2] =  loadImage("runright2.png");

  action= idle;

  //goomba
  goomba= new PImage[3];
  goomba[0] = loadImage("goomba0.png");
  goomba[1] = loadImage("goomba1.png");
  goomba[2] = loadImage("goomba2.png");

  //hammerbro
  hammerBro= new PImage[3];
  hammerBro[0] = loadImage("hammerbro0.png");
  hammerBro[1] = loadImage("hammerbro1.png");

  //score and lives
  lives=2;
  score=0;
}

void initializegifandbutton() {
  mariogif= new Gif("mariogif/frame_", "_delay-0.1s.gif", 5, 2, width/2, 3*height/2, 200, 200);
  //introgif= new Gif ("introgif/frame_", "_delay-0.15s.gif", 34, 1, width/2, height/2, width, height);

  begin = new Button("BEGIN", 700, height/2, 300, 100, white, black);
}
void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if ( mode== OPTIONS) {
    options();
  }
}



void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && mousePressed == false) {
    mouseReleased = true;
    wasPressed = false;
  }
}
