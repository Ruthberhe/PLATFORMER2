void play() {
  background(black);
  loadWorld(FINALMAP1);
  drawWorld();

  loadPlayer();
  actWorld();
}


void loadPlayer() {
  player = new Fplayer();
  world.add(player);
}



void loadWorld(PImage img) {
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y=0; y<img.height; y++) {
    for (int x=0; x<img.width; x++) {
      color c=img.get(x, y);//current
      color s= img.get(x, y+1); //below
      color w= img.get(x-1, y);//west of pixel
      color e= img.get(x+1, y);//east of pixel

      FBox b= new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);

      if (c== dbrown) {
        b.attachImage(brick);
        b.setFriction(4);
        b.setName("stone");
        world.add(b);
      } else if (c==dgrey) {
        b.attachImage(brick);
        b.setFriction(2);
        b.setName("wall");
        world.add(b);
      } else if (c==cyan) {
        b.attachImage(ice);
        b.setFriction(2);
        b.setName("ice");
        world.add(b);
      } else if (c==black) {
        b.attachImage(spike);

        b.setName("spike");
        world.add(b);
      } else if (c==lbrown) {
        b.attachImage(treetrunk);
        b.setSensor(true);
        b.setName("treetrunk");
        world.add(b);
      } else if (c==green && s== lbrown ) { //intersection
        b.attachImage(treeintersect);
        //   b.setSensor(true);
        b.setName("treetop");
        world.add(b);
      } else if (c==green && w==green && e==green) { //midpiece
        b.attachImage(treetopc);
        // b.setSensor(true);
        b.setName("treetop");
        world.add(b);
      } else if (c==green && w!=green) { //west
        b.attachImage(treetopw);
        //  b.setSensor(true);
        b.setName("treetop");
        world.add(b);
      } else if (c==green && e!= green) { //east
        b.attachImage(treetope);
        // b.setSensor(true);
        b.setName("treetop");
        world.add(b);
      } else if ( c==purple) {
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        b.attachImage(bridgec);
        b.setName("bridge");
        terrain.add(br);
        world.add(br);
      } else if (c==yellow) {
        b.attachImage(trampoline);
        b.setRestitution(2);
        b.setName("trampoline");
        world.add(b);
      } else if (c==lgreen ) {
        b.attachImage(dirtc);

        b.setName("dirt");
        world.add(b);
      } else if  (c==green && e!= green) {
        b.attachImage(dirtse);
        b.setName("dirt");
        world.add(b);
      } else if (c==lpink) {
        b.attachImage(checkpoint);
        b.setName("checkpoint1");
        world.add(b);
      } else if (c==lpink) {
        b.attachImage(checkpoint);
        b.setName("checkpoint2");
        world.add(b);
      } else if (c==lpink) {
        b.attachImage(checkpoint);
        b.setName("checkpoint3");
        world.add(b);
      } else if (c==red) {
        FLava la = new FLava(x*gridSize, y*gridSize);
        la.setName("lava");
        terrain.add(la);
        world.add(la);
      } else if (c==grey) {
        FGoomba gmb = new FGoomba(x*gridSize, y*gridSize);
        gmb.setName("goomba");
        enemies.add(gmb);
        world.add(gmb);
      } else if (c==pink) {
        FHammerbro hmr = new FHammerbro(x*gridSize, y*gridSize);
        hmr.setName("hammerbro");
        enemies.add(hmr);
        world.add(hmr);
      } else if (c==burgindi) {
        FThwomp thw = new FThwomp(x*gridSize, y*gridSize);
        thw.setName("thwomp");
        enemies.add(thw);
        world.add(thw);
      }
    }
  }
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

void actWorld() {
  player.act();
  for (int i=0; i<terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for (int i=0; i<enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}
