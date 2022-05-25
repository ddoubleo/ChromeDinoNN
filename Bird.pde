class Bird {
  float w = 60;
  float h = 50;
  float posX;
  float posY;
  int flapCount = 0;
  int typeOfBird;
  Bird(int type) {
    posX = width;
    typeOfBird = type;
    switch(type) {
    case 0://low
      posY = 10 + h/2;
      break;
    case 1://in the middle
      posY = 100;
      break;
    case 2:// high
      posY = 180;
      break;
    }
  }

  //actually show the bird
  void show() {
    flapCount++;
    
    if (flapCount < 0) {//wings flapping
      image(bird,posX-bird.width/2,height - groundHeight - (posY + bird.height-20));
    } else {
      image(bird1,posX-bird1.width/2,height - groundHeight - (posY + bird1.height-20));
    }
    if(flapCount > 15){
     flapCount = -15; 
      
    }
  }
  void move(float speed) {
    posX -= speed;
  }

  //detects collision with the player
  boolean collided(float playerX, float playerY, float playerWidth, float playerHeight) {

    float playerLeft = playerX - playerWidth/2;
    float playerRight = playerX + playerWidth/2;
    float thisLeft = posX - w/2 ;
    float thisRight = posX + w/2;

    if ((playerLeft<= thisRight && playerRight >= thisLeft ) || (thisLeft <= playerRight && thisRight >= playerLeft)) {
      float playerUp = playerY + playerHeight/2;
      float playerDown = playerY - playerHeight/2;
      float thisUp = posY + h/2;
      float thisDown = posY - h/2;
      if (playerDown <= thisUp && playerUp >= thisDown) {
        return true;
      }
    }
    return false;
  }
}