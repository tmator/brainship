class Bad {
  
  float     xpos;
  float     ypos;

  
  Bad() {
    xpos      = width-100;
    ypos   = random(40, height-40);
  }
  
  boolean display(float xshot, float yshot) {

    if (xshot>=xpos && yshot < ypos+25 && yshot > ypos-25)
    {
 
      fill(255,255,0);
      ellipse(xpos, ypos, 50, 50);
      this.reset();
      return true;
    }
    else
    {
      fill(0,0,200);
      ellipse(xpos, ypos, 50, 50);
      return false;
    }

  }

  void reset() {
    xpos   = width-100;
    ypos   = random(40, height-40);
  }  
  

  
}
