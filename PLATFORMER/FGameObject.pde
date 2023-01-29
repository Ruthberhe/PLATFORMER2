class FGameObject extends FBox {
  
   final int L = -1;
  final int R =1;
  
  FGameObject() {
    super(gridSize, gridSize);
  }
  
  void act(){
    
  }
  
  boolean isTouching(String n) {
    ArrayList<FContact> contacts = getContacts();
    for (int i=0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains(n)) {
        return true;
      } 
    }
    return false;
  }
  
  
  //PImage reverseImage( PImage image ) {
  //  PImage reverse;
  //  reverse = createImage(image.width, image.height, ARGB );

  //  for ( int i=0; i < image.width; i++ ) {
  //    for (int j=0; j < image.height; j++) {
  //      int xPixel, yPixel;
  //      xPixel = image.width - 1 - i;
  //      yPixel = j;
  //      reverse.pixels[yPixel*image.width+xPixel]=image.pixels[j*image.width+i] ;
  //    }
  //  }
  //  return reverse;
  //}
}
