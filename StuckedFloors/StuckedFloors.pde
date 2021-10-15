PImage img;
float difference;
import processing.sound.*;
SoundFile file;
int maxBlocks = 100;
Block[] blocks = new Block[maxBlocks];                                      //declare class and objects
boolean spacePressed;
int i=0;
void setup()
{
  for (int bNum=0; bNum<maxBlocks; bNum++)                                  //initialize objects
  {
    blocks[bNum] = new Block();
    blocks[bNum].whichBlock = bNum;
    blocks[bNum].y = height/2 - bNum*blocks[bNum].hei;
  }
  size(660, 370);
  img = loadImage("brickImg.jpg");
  imageMode (CENTER);
  background (200);
  size (1000, 1000);
  rectMode (CENTER);
  SoundFile sound = new SoundFile (this, "backgroundMusic.mp3");
  sound.play();
}
void draw ()
{
  background(200);
  blocks[i].movingBlock();
  for (int j=0; j<=i; j++)
    blocks[j].displayBlock();
}
void keyPressed ()
{
  if (key == ' ')
  {
    if (i!=0)                                                                            //if is not the first block
    {
      if (blocks[i].x < blocks[i-1].x)                                                   //new.centre on the left   {
      {
        if ((blocks[i].x-(blocks[i].wid/2)>(blocks[i-1].x-(blocks[i-1].wid/2))))           //centre left, inside
        {
          println("center on left, inside");
        } else if ((blocks[i].x-(blocks[i].wid/2)<(blocks[i-1].x-(blocks[i-1].wid/2))))    //centre left, outside
        {
          println("center on left, outside");
          difference = abs((blocks[i].x-(blocks[i].wid/2)-(blocks[i-1].x-(blocks[i-1].wid/2))));
        }
      } //left till here
      else if (blocks[i].x > blocks[i-1].x)                                              //new.centre on the right
      {
        if ((blocks[i].x+(blocks[i].wid/2)<(blocks[i-1].x+(blocks[i-1].wid/2))))           //centre right, inside
        {
          println("center on right, inside");
          difference = abs((blocks[i].x+(blocks[i].wid/2)-(blocks[i-1].x+(blocks[i-1].wid/2))));
        }
        if ((blocks[i].x+(blocks[i].wid/2)>(blocks[i-1].x+(blocks[i-1].wid/2))))           //centre right, outside
        {
          println("center on right, outside");
        }
      }//right till here
    }
    println(difference);

    SoundFile sound = new SoundFile (this, "BrickSound3.wav");
    sound.play();
    blocks[i].wid-=difference;
    i++;
  }
}
