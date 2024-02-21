final int SPACING = 5; // each cell's width/height //<>//
final float DENSITY = 0.1; // how likely each cell is to be alive at the start
int[][] grid; // the 2D array to hold 0's and 1's
final int DEAD = 0;
final int ALIVE = 1;
final int pinkColor = color(255, 105, 180);
final int redColor = color(220, 0, 0);

void setup() {
  size(800, 600); // adjust accordingly, make sure it's a multiple of SPACING
  noStroke(); // don't draw the edges of each cell
  frameRate(10); // controls speed of regeneration
  grid = new int[height / SPACING][width / SPACING];

  // populate initial grid
  for(int i = 0; i < grid.length; i++) {
    for(int x = 0; x < grid[0].length; x++) {
      if(random(1) < DENSITY) {
        grid[i][x] = ALIVE; // sets that element in the array to be a living cell
      } else {
        grid[i][x] = DEAD; // sets that element in the arrat to be a dead cell
      }
    }
  }
}

void draw() {
  showGrid();
  grid = calcNextGrid();
}

int[][] calcNextGrid() {
  int[][] nextGrid = new int[grid.length][grid[0].length];
  // your code here
  for (int i = 0; i < grid.length; i++) {
    for(int x = 0; x < grid[0].length; x++) {
      int neighbors = countNeighbors(i, x);
      if(grid[i][x] == ALIVE) {
        if(neighbors == 1 || neighbors == 0 || neighbors >= 4) {
          nextGrid[i][x] = DEAD;
        } else { 
          nextGrid[i][x] = ALIVE;
        }
      } else { //for a space that is unpopulated
        if(neighbors == 3) {
          nextGrid[i][x] = ALIVE;
        } else {
          nextGrid[i][x] = DEAD;
        }
      }
    }
  }
  return nextGrid;
}


int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!
  
  for(int i = -1; i <= 1; i++) {
    for(int j = -1; j <= 1; j++) {
      int neighborRow = (y + i + grid.length) % grid.length; //wraps around the living cell in more of a sphere shape instead of grid
      int neighborColumn = (x + j + grid[0].length) % grid[0].length;
      
      if(grid[neighborRow][neighborColumn] == 1) { 
        n++; // adds to the number of neighbors for every live cell in neighboring cells
      }
    }
  }
  n -= grid[y][x]; // ensures that you don't count yourself

  return n;
}

void showGrid() {
  background(0);
  for(int i = 0; i < grid.length; i++) {
    for(int x = 0; x < grid[0].length; x++) {
      if(grid[i][x] == 1) {
        if(random(2) < 1) {
          fill(pinkColor);
        } else {
          fill(redColor);
        }
      } else {
        fill(0); // fills black for dead cells
      }
      square(x * SPACING, i * SPACING, SPACING);
    }
  }
}
