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

  // your code here

  return nextGrid;
}

int countNeighbors(int y, int x) {
  int n = 0; // don't count yourself!
  
  // your code here
  
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
      square(x * SPACING, i * SPACING, SPACING);
    }
  }
}
