boolean nextButton;
class Block
{
  float x, y, wid, hei, velX, centerX, centerY, ranNum, difference;
  int whichBlock;
  Block()                                                   //initialize the objects
  {

    ranNum = random (5, 10);
    velX = ranNum;
    rectMode (CENTER);
    textAlign (CENTER, CENTER);
    textSize (60);
    centerX = width/2;
    centerY = height/2;
    x = centerX;
    y = 800;
    wid = 200;
    hei = 100;
  }
  void movingBlock()
  {
    fill (255);
    if ((x-wid/2)<0) //go right
    {
      velX = ranNum;
    }
    if ((x+wid/2)>width) //go left
    {
      velX= (-1)*ranNum;
    }
    x = x+velX;
  }

  void displayBlock()
  {
    rect (x, y + hei, wid, hei);
    image(img, x, y + hei, wid, hei);
    text (whichBlock, x, y + hei);
  }
}
