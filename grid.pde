

class Grid{

  Grid( int _cols, int _rows, int _spacingX, int _spacingY, int _paddingX, int _paddingY ) {
    cols = _cols;
    rows = _rows;
    spacingX = _spacingX;
    spacingY = _spacingY;
    paddingX = _paddingX;
    paddingY = _paddingY;
  }
  
  float getX(int _i){   
    int x = paddingX + _i% cols * spacingX;
    return x;    
  }
  
  float getY(int _i){
    int y = paddingY + floor( _i / cols ) * spacingY;
    return y;    
  }
  
  int cols, rows, paddingX, paddingY, spacingX, spacingY;

}
