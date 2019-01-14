import ddf.minim.*;
Snk snk;
Food food;
AudioPlayer player;
Minim minim;

int grid = 20;
int time = 0;
int topBorderHeight = 40;
boolean move;
boolean dead;
int score = 0;
int highScore = 0;
int direction = 0; //1 = up, 2 = right, 3 = down, 4 = left
int BGR = 255;
int BGG = 147;
int BGB = 216;
int BGO = 133;

void setup()
{
  //munch = new SoundFile (this, "apple_bite.mp3");
  size (540, 580);
  snk = new Snk(grid + 100, topBorderHeight + grid + 100);
  food = new Food();
  dead = false;
  move = false;
  score = 0; //reset score
  minim = new Minim (this);
  player = minim.loadFile("neko.mp3", 2000);
  player.loop();
}

void draw()
{
  background (255);
  fill (BGR, BGG, BGB, BGO);
  rect (0, 0, width, topBorderHeight);
  rect (0 + grid, topBorderHeight + grid, width - 2*grid, height - (topBorderHeight + 2*grid) );
  textSize (25);
  fill (0);
  textAlign (LEFT);
  text ("score: " + score, 10, 35);
  text ("high score: " + highScore, 350, 35);

  if (dead == true) {
    textAlign (CENTER);
    fill (0, 125);
    rect (width/2 - 85, (height - grid*3)/2 - 25, 170, 120);
    textSize (18);
    fill (255);
    text ("Womp womp. \nScore: " + score + "\nPress backspace to try again.", width/2 - 75, (height - grid*3)/2 - 20, 150, 120);
    if (score > highScore) {
      highScore = score;
    }
  } else {
    if (snk.intersects(food)) {
      //munch.play();
      food = new Food ();
      food.show();
      score++;
    }
    if (move == false) {
      fill (0, 125); //starting notice
      rect (width/2 - 85, (height - grid*3)/2 - 20, 170, 100);
      textAlign (CENTER);
      textSize (18);
      fill (255);
      text ("Use the arrow keys to move the snake.", width/2 - 75, (height - grid*3)/2 - 10, 150, 110);
    } else if (move == true) {
      time +=1;
      if ((time % 5) == 0) {
        snk.update();
      }
    }
  }
  snk.checkCrash();

  food.show();
  snk.show();
}

void keyPressed() //1 = up, 2 = right, 3 = down, 4 = left
{
  if (keyCode == UP && direction != 3) {
    direction = 1;
    snk.move (0, -1);
  } else if (keyCode == RIGHT && direction != 4) {
    direction = 2;
    snk.move (1, 0);
  } else if (keyCode == DOWN && direction != 1) {
    direction = 3;
    snk.move (0, 1);
  } else if (keyCode == LEFT && direction != 2) {
    direction = 4;
    snk.move (-1, 0);
  } else if (key == BACKSPACE) {
    player.close();
    setup();
  }
}
