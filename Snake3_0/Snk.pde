class Snk {

  float[] snakex = new float [50];
  float[] snakey = new float [50];
  float xspeed = 1;
  float yspeed = 0;
  float dx;
  float dy;
  int total = 1;

  Snk (float x, float y)
  {
    snakex[1] = x;
    snakey[1] = y;
  }

  void checkCrash()
  {
    for (int i = total; i > 0; i--)
    {
      if (i > 1) { 
        if (snakex[i] == snakex[1] && snakey[i] == snakey[1]){
          dead = true;
          //println ("game over: crashed into body");
        }
      } else {
        if (snakex[1] < grid || snakex[1] > width-grid*2 || snakey[1] < grid*3 || snakey[1] > height-grid*2){
          dead = true;
          //println ("game over: crashed into wall");
        }
      }
    }
  }
  void move (float xspeed, float yspeed)
  {
    move = true;
    this.xspeed = xspeed;
    this.yspeed = yspeed;
  }

  void update()
  {
    for (int i = total; i > 0; i--)
    {
      fill (255);
      if (i != 1) {
        snakex[i] = snakex [i-1];
        snakey[i] = snakey [i-1];
      } else {
        snakex[1] = snakex[1] + xspeed * grid;
        snakey[1] = snakey[1] + yspeed * grid;
      }
    }
  }
  void show()
  {
    fill (255);
    for (int i = total; i > 0; i--) {
      //println ("snakex: " + snakex[i]);
      //println ("snakey: " + snakey[i]);
      rect(snakex[i], snakey[i], grid, grid, 7);
    }
  }

  boolean intersects (Food food)
  {
    dx = abs(snakex[1] - food.x);
    dy = abs(snakey[1] - food.y);
    if (dx == 0 && dy == 0) {
      total++;
    }
    return (dx == 0 && dy == 0);
  }
}
