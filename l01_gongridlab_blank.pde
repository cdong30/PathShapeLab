//worked with Ivan Lin
int GRID_ROWS = 5;
int GRID_COLS = 5;
int POPULATION_SIZE = GRID_COLS * GRID_ROWS;

//A shape should always fit within a MAX_SIZE x MAX_SIZE square
int MAX_SIZE = 100;
//This allows us to account for the gridlines that will be drawn
int OFFSET = 1;


//Used when we need to check what kind of PathShape to use
int REGS = 0;
int TRIS = 1;
int PATHS = 2;

//Array of PathShapes to work with
PathShape population[];

void settings() {
  size(GRID_COLS*MAX_SIZE + (GRID_COLS-1)*OFFSET, 
    GRID_ROWS*MAX_SIZE + (GRID_ROWS-1)*OFFSET);
}
/* ============================
 ============================ */
void setup() {
  //this is calculated based on GRID_COLS, GRID_ROWS, MAX_SIZE and OFFSET
  //size(403, 302);
  background(255);
  population = new PathShape[POPULATION_SIZE];
  populate(REGS);
}//setup

/* ============================
 ============================ */
void draw() {
  background(255);
  drawGrid();
  drawPop();
}

/* ============================
 Loop through the population array and call
 display on each object.
 ============================ */
void drawPop() {
  //TODO
  for (int i = 0; i < POPULATION_SIZE; i++) {
    population[i].display();
  }
}//drawPop

/* ============================
 Fills the population array by calling
 makeShape with the correct parameters.
 ============================ */
void populate(int type) {
  for(int i = 0; i < POPULATION_SIZE; i++){
    population[i] = makeShape(type, i%GRID_COLS * MAX_SIZE, i/GRID_ROWS * MAX_SIZE);
  }
}//populate

/* ============================
 Calls the correct shape making and isValid
 method for the given shape type and position.
 
 The coordinates should represent the top-left
 corener of a MAX_SIZE x MAX_SIZE square that
 will contain the shape.
 
 RegularGons made according to the instructions for
 makeRegularGon are always valid.
 ============================ */
PathShape makeShape(int type, int left_x, int top_y) {
  PathShape ps = null;
  boolean valid = false;
  //TODO
  if (type == 0) {
    int sides = 0;
    int radius = 0;
    ps = new RegularGon(left_x, top_y, MAX_SIZE, MAX_SIZE, sides, radius);
    ps.randomize();
    valid = ps.isValid();
  }
  if(type == 1){
    //ps = new TriangleGon();
  }
  if(type == 2){
    ps = new PathShape(left_x, top_y, MAX_SIZE, MAX_SIZE);
    ps.randomize();
    valid = ps.isValid();
    //print("test");
  }
  while (!valid) { 
    //TODO
    // Regenerate shapes until we get a valid one
    int sides = 0;
    int radius = 0;
    ps = new RegularGon(left_x, top_y, MAX_SIZE, MAX_SIZE, sides, radius);
    ps.randomize();
  }
  return ps;
}


/* ============================
 ============================ */
void drawGrid() {
  stroke(0);
  for (int i=1; i < GRID_COLS; i++) {
    int x = i * (MAX_SIZE + OFFSET);
    line(x, 0, x, height-1);
  }//row dividers

  for (int i=1; i < GRID_ROWS; i++) {
    int y = i * (MAX_SIZE + OFFSET);
    line(0, y, width-1, y);
  }//column dividers
}//drawGrid


void keyPressed() {
  if (key == 'r') {
    populate(REGS);
  } else if (key == 't') {
    populate(TRIS);
  } else if (key == 'p') {
    populate(PATHS);
  } else if (key == ' ') {
    saveFrame("l01_.png");
  }
}
