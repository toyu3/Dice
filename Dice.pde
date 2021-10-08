int count;
void setup()
{
  size(450, 500);
  noLoop();
}
void draw()
{
  count = 0;
  background(255);
  for (int y = 0; y <= 450; y = y + 65) {
    //columns 
    for (int x = 0; x <= 450; x = x + 65) {
      Die bob = new Die(x, y, 60);
      count = count + bob.dRandom; //counter
      bob.show();
      bob.roll();
    }
  }
  textSize(20);
  text("Sum: " + count, 0, 480);
}
void mousePressed() {
  redraw();
}
class Die {
  //single dice  
  //variable declarations
  int myX, myY;
  int dRandom;
  int size;
  int w = 10;
  Die(int x, int y, int z) {
    //constructor
    myX = x;
    myY = y;
    size = z;
    roll();
  }
  void roll() {
    dRandom = (int)((Math.random()*6)+1);
  }
  void show() {
    fill(255, 255, 255);
    rect(myX, myY, size, size);
    fill(0);
    if (dRandom == 1)
      for (int i = 1; i <= dRandom; i++) {
        ellipse(myX + (size/2), myY + (size/2), w, w);
      } else if (dRandom <= 3) {
      for (int i = 1; i <= dRandom; i++) {
        ellipse(myX + (15 + (15*(dRandom-2))) + (15 * (i-(dRandom-1))), myY + (15 + (15*(dRandom-2))) + (15 * (i-(dRandom-1))), w, w);
      }
    } else if (dRandom == 5) {
      for (int i = 1; i <= 2; i++) {
        for (int j = 1; j <= 2; j++) {
          ellipse(myX + 15 + (30 * (i-1)), myY + 10 + (40 * (j-1)), w, w);
        }
      }
      ellipse(myX + (size/2), myY + (size/2), w, w);
    } else if (dRandom == 4) {
      for (int j = 1; j <= 2; j++) {
        for (int i = 1; i <= 2; i++) {
          ellipse(myX + 15 + (30 * (i - 1)), myY + 15 + (30 * (j - 1)), w, w);
        }
      }
    } else {
      for (int j = 1; j <= 3; j++) {
        for (int i = 1; i <= 2; i++) {
          ellipse(myX + 15 + (30 * (i - 1)), myY + 30 + (15 * (j - 2)), w, w);
        }
      }
    }
  }
}
