class Ship {
  
  float     xpos;
  float     ypos;
  boolean   shoot;
  float     xshootpos;
  float     yshootpos;  
  
  Ship() {
    xpos      = 20;
    ypos      = height/2;
    shoot     = false;
    yshootpos = 9999;
  }
  
  void display() {
    fill(0,200,0);
    triangle (xpos, ypos-20, xpos, ypos+20, xpos+20, ypos);
    if (shoot)
    {
      fill(200,0,0);
      
      if (yshootpos==9999)
      {
        yshootpos=ypos;
        xshootpos=xpos+20;
        rect(xshootpos,yshootpos-2,15,4);
      }
      else
      {
        
        //if pas contact et pas depassé le mechant
        if (xshootpos<width)
        {
          rect(xshootpos+=10,yshootpos-2,15,4);
        }
        else
        {
          shoot=false;
          yshootpos = 9999;
        }
      }
      
    } 

  }

  void reset() {
    xpos   = 20;
    ypos   = height/2;
    shoot  = false;  
  }  
  
  void resetShoot() {
      shoot=false;
      yshootpos=9999;
      xshootpos=0;
  }  
  
}
