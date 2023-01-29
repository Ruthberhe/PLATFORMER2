class  FThwomp extends FGameObject{
  
  
  FThwomp(float x, float y){
    super();
    setPosition(x, y);
    setName("thwomp");
    setStatic(true);
     setRotatable(false);
    attachImage(thwomp0);
  
}

void act(){

  if (isTouching("player")) {
      attachImage(thwomp1);
      setStatic(false);
      }
}
}
