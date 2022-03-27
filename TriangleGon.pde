class TriangleGon extends PathShape {

  int MIN_AREA = 300;
  int MAX_RANDOM_POINTS = 3; //Overrides pathshape

  TriangleGon(int lx, int ty, int sw, int sh) {
    super(lx, ty, sw, sh);
  }

/* ============================
  Generate a random TriangleGon with the following constraints:

  The TriangleGon should fit inside a single MAX_SIZE x MAX_SIZE square.
  You should create the TriangleGon by generating 3 random points that
  satisfy the condition above.
  ============================ */
  //This randomize() Should just work for free!
  //We inherit PathShape randomize(), and override MAX_RANDOM_POINTS to 3

/* ============================
  A valid TriangleGon has an area of at least 300.
  Returns true/false based on that condition.
  ============================ */
  boolean isValid() {
    return false;//TODO
  }//isValid

  void addPoint(int x, int y) {
    if (xs.size() < 3) {
      super.addPoint(x, y);
    }
  }

  void setCentroid() {
    int sumX = 0;
    int sumY = 0;

    for (int i=0; i < xs.size(); i++) {
      sumX+= xs.get(i);
      sumY+= ys.get(i);
    }
    centroid[0] = sumX / 3;
    centroid[1] = sumY / 3;
  }//setCentroid

/*  void setArea() {
    if (xs.size() == 3) {
     area = xs.get(0) * (ys.get(1)-ys.get(2));
     area+= xs.get(1) * (ys.get(2)-ys.get(0));
     area+= xs.get(2) * (ys.get(0)-ys.get(1));
     area = abs(area / 2);
   }
   else {
     area = 0;
   }
  }//setArea

*/
}//TriangleGon
