class Food {

  float x;
  float y;

  Food () {
    x = ((int)random (1, 26))*grid;
    y = ((int)random (3, 26))*grid;
  }
  void show()
  {
    fill (200);
    rect (x, y, grid, grid, 7);
  }
}
