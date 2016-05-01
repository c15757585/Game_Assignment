int _width = 7;
int _height = 6;
int block = 100; 
int player = 1; //two players
int stage; //level variable for intro and game

//If I had more knowledge I would highlight the winning combination before going to the game over screen.
//Perhaps more animations like a dropping token or a mouseover before you click based off of mouseover.
//array for board
int [][] board = new int [_height] [_width];

void setup()
  {
  
    size(700, 600);
    stage = 1;
    background(0);
    //Make sure the ellipse draws correctly
    ellipseMode(CORNER);
    
  }

int getWinner() 
  { 
    for (int y = 0; y < _height; y++)
      for (int x = 0; x < _width; x++)
        if (token(y, x) != 0 && token(y, x) == token(y, x+1) && token(y, x) == token(y, x+2) && token(y, x) == token(y, x+3)) 
          return token(y, x);
  
    for (int y = 0; y < _height; y++)
      for (int x = 0; x < _width; x++)
        if (token(y, x) != 0 && token(y, x) == token(y+1, x) && token(y, x) == token(y+2, x) && token(y, x) == token(y+3, x)) 
          return token(y, x);
  
    for (int y = 0; y < _height; y++)
      for (int x = 0; x < _width; x++)
        for (int dir= -1; dir <= 1; dir++)
          if (token(y, x) != 0 && token(y, x) == token(y + 1 * dir, x + 1) && token(y, x) == token(y + 2 * dir, x + 2) && token(y, x) == token(y + 3 * dir, x + 3)) 
            return token(y, x);
            
    for (int y = 0; y < _height; y++)
      for (int x = 0; x < _width; x++)
        if (token(y, x) == 0) 
          return 0;
          
    return -1; //tie
  }

int token( int y, int x) {
   // shortcut for if structure
  return (y < 0|| x < 0 || y >= _height|| x >= _width)?0:board[y][x];
}

int nextSpace(int x) {
  for (int y = _height - 1; y >= 0; y --) 
    if (board[y]  [x] ==0)
      return y;
  return -1;
}
void mousePressed() {
  int x = mouseX / block, y = nextSpace(x);
  if (y >= 0) {
    board[y][x] = player;
    player = player==1?2:1;
  }
}

void draw() {
  if(keyPressed && key == ' ')
  {
    stage = 2;
  }
  if(stage == 1)
  {
    textAlign(CENTER);
    text("Connect Four", height/2 +50, width/2 -100);
    text("Press Spacebar to Play", height/2 +50, width/2 );
    //need to fix the mouseclick 
  }
  if(stage == 2)
  {
      if(getWinner() == 0) 
      {
        for (int j = 0; j < _height; j++) 
        for (int i = 0; i < _width; i ++)
      {

        fill(10,90,150);
        rect(i*block, j*block, block, block);
        
        if (board [j][i] > 0) 
        {
          // shortcut for if structure
          fill(board[j][i] == 1?255:0, board[j][i] == 2?255:0, 0);
          
          ellipse(i * block, j * block, block, block);
        }
      }
    
}
  
else {
  background(0);
  fill(255);
  text("The winner is Player "+getWinner(), width/2, height/2 -50);
  text(" press space to restart!", width/2, height/2);
  if (keyPressed && key == ' ')  
  {
    player=1; 
    for(int y = 0; y < _height; y++)
    for(int x = 0; x < _width; x++)
    board[y][x] = 0;
  }
}
  }
}

