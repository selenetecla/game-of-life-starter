final int SPACING = 20; // each cell's width/height //<>// //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid; // the 2D array to hold 0's and 1's

void setup() {
  size(800, 600); // adjust accordingly, make sure it's a multiple of SPACING
  noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
  grid = new int[height / SPACING][width / SPACING];

  // populate initial grid
  for(int i = 0; i < grid.length; i++) {
    for(int x = 0; x < grid[i].length; x++) {
      if(random(1) < DENSITY) {
        grid[i][x] = 1; // sets that element in the array to be a living cell
      } else {
        grid[i][x] = 0; // sets that element in the arrat to be a dead cell
      }
    }
  }
  // your code here

}

void draw() {
  showGrid();
  grid = calcNextGrid();
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];
////For a space that is populated (1):

//Each cell with one or no neighbors dies, as if by solitude.
//Each cell with four or more neighbors dies, as if by overpopulation.
//Each cell with two or three neighbors survives.
//For a space that is unpopulated (0):

//Each cell with three neighbors becomes populated.
//Otherwise, the cell remains unpopulated.
  // your code here
  for (int i = 0; i < grid.length; i++) {
    for(int x = 0; x < grid[x].length; x++) {
      int neighbors = countNeighbors(i, x);
      if(grid[i][x] == 1) {
        if(neighbors == 1 || neighbors == 0 || neighbors >= 4) {
          nextGrid[i][x] = 0;
        } else { 
          nextGrid[i][x] = 1;
        }
      } else { //for a space that is unpopulated
        if(neighbors == 3) {
          nextGrid[i][x] = 1;
        } else {
          nextGrid[i][x] = 0;
        }
      }
    }
  }
          

  return nextGrid;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!
  
  // your code here
  for(int i = -1; i <= 1; i++) {
    for(int j = -1; j <= 1; j++) {
      int row = (y + i) % y; //find whats wrong
      int column = (x + j + grid[0].length);
      n += grid [row][column];
    }
  }
  n -= grid[y][x]; // ensures that you don't count yourself
  // don't check out-of-bounds cells

  return n;
}

void showGrid() {
  background(0);
  for(int i = 0; i < grid.length; i++) {
    for(int x = 0; x < grid[i].length; x++) {
      if(grid[i][x] == 1) {
        fill(255, 0, 0); // fills red for live cells
      } else {
        fill(0); // fills black for dead cells
      }
      square(x * SPACING, i * SPACING, SPACING); // (x, y, extent)
    }
  }
}
