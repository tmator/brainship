/**

Shipbrain tmator

 */

int time;
int wait = 1000;
int sec=60;
   
int run=0; //0 départ, 1 jeux, 2 score

//le vaisseau
Ship myShip;

//le mechant
Bad theBad;

//compteur
int total=0;

//temps
   
void setup() {
  size(1000, 600);
  noStroke();
  background(0);

  myShip = new Ship();
  theBad = new Bad();
  
}

void draw() { 
  
  if (run==1)
  {
    // keep draw() here to continue looping while waiting for keys
    background(0);
    
    //affichage du compteur et temps
    textSize(32);
    fill(255,255,255);
    text("Résultat : "+total, 430, 30); 
    text("Restant : "+sec, 430, 550);


    myShip.display();
    if (theBad.display(myShip.xshootpos, myShip.yshootpos))
    {
      myShip.resetShoot();
      total++;
    }
    
    //check the difference between now and the previously stored time is greater than the wait interval
    if (millis() - time >= wait && sec > 0) {
    time = millis();//also update the stored time
    sec--;
    
    if (sec==0)
      run=2;
  }
  }
  else if (run==0)
  {
    textSize(20);
    fill(255,255,255);
    text("Utilisez votre mental pour déplacer le vaisseau et la barre espace pour tirer, vous avez une minute.", 0, 200);
    text("Appuyez sur a pour démarrer.", 0, 250); 
  }
  else if (run==2)
  {
    background(0);
    textSize(20);
    fill(255,255,255);
    text("Vous avez eu "+total, 0, 200);
    text("Appuyez sur a pour re-démarrer.", 0, 250); 
  }
  


  
}


void keyPressed() {
  
  if (keyCode == UP)
  {
    myShip.ypos-=5;
  }
  else if (keyCode == DOWN)
  {
   myShip.ypos+=5; 
  } 
  
  //shoot
  if (key == ' ')
  {
    myShip.shoot=true;
  }
  else if (key == 'a')
  {
    run=1;
    sec=60;
    total=0;
  }
}
