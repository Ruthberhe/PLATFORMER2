class FHammerbro extends FGameObject {

  //int direction =L;
  int direction =L;
  int speed =50;
  int frame=0;

  FHammerbro(float x, float y) {
    super();
    setPosition(x, y);
    setName("hammerbro");
    setRotatable(false);

  }
  
   void act() {
    animate();
    collide();
    move();
    
     }


  void collide() {
    if (isTouching("wall")) {
      direction *=-1;
      setPosition(getX()+direction, getY());
    }

    if (isTouching("player")) {
      world.remove(this);
      enemies.remove(this);
    }
  }


  void animate() {
    if (frame >= action.length) frame=0;
    if (frameCount % 5==0) {
      if (direction==R)  attachImage(hammerBro[frame]);
    //  if (direction==L)  attachImage(reverseImage(hammerBro[frame]));
      frame++;
    }
  }

  void move() {
    float vy= getVelocityY();
    setVelocity(speed*direction, vy);
  }

}
