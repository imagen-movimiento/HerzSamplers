class Reloj {
  Reloj(){
    players = new ArrayList();
  }
  
  
  void draw(){
    strokeWeight( 4 );
    
    float grados_posicion = float(position * 360 ) / ( num_segundos * 1000 );
    float rads_posicion = grados_posicion * PI/180;
  
    
    
    int num_eventos = players.size();
    float grados_paso =  360 / num_eventos;
    



    for( int i = 0; i < num_eventos; i++ ) {
                  
      float rads_paso = grados_paso * i * PI/180;
      
      if ( grados_posicion > grados_paso * i && grados_posicion < grados_paso * (i + 1 ) ) {
        
        int ultimo_indice = mod( (i-1) , num_eventos );       
        if( ! players.get(i) ) {
          fill_anim = 255;
          trigger();
        }
        players.set(i, true);
        players.set( ultimo_indice, false );
        if(fill_anim > 0 )
          fill(fill_anim);
        else
          noFill();
      }
      else
        noFill(); 
       
       
      
      ellipse( x + cos(rads_paso) * s / 2, y + sin(rads_paso) * s / 2, s / 5, s / 5 );    
    }
    
    line( x, y, x + cos(rads_posicion) * s/2, y + sin(rads_posicion) * s/2 );    
    if(fill_anim > 0 ) {
      fill_anim -= 10;
    }
    else {
      fill_anim = 0;
      noFill();
    }

    stroke(255);
    noFill();

    ellipse(x,y,s,s);  
    
    
  }



  void setX ( int _x ) {
    x = _x;
  }
  void setY ( int _y ) {
    y = _y;
  }  
  void setS ( int _s ) {
    s = _s;
  }
  
  void setXYS( int _x, int _y, int _s ) {
    x = _x; y = _y; s = _s;
  }
  
  void setXYS( float _x, float _y, int _s ) {
    x = (int)_x; y = (int)_y; s = _s;
  }
    
  
  void setHz( float _hz ) {
    hz = _hz;
    int num_eventos = int ( hz * num_segundos );    
    crear_players( num_eventos );    
  }

  void setPosition( int _pos ) {
    position = _pos % ( num_segundos * 1000 );
  }
  
  void crear_players( int _n ) {
    players.clear();
    for( int i = 0; i < _n; i++ )
      players.add(false);
  }
  
  void trigger() {
    
    if ( minim != null ) {
      
      if ( sampler != null ) {
        sampler.trigger();
        println( "play: " + filename );
      }
      else {
        println( "player not set" );      
      }
      
    }
    else {
      println( "minim not set" );     
    }    
      
  }
  
  void setMinim( Minim _minim ){
    minim = _minim;
  }
  
  void setSampler( String _filename ) {
    filename = _filename;
    if( minim != null )
      sampler = minim.loadSample( filename );      
    
    
  }


  float hz;
  int position;
  int x, y, s;
  ArrayList<Boolean> players;
  
  int fill_anim;
  
  Minim minim;
  AudioSample sampler;
  String filename;
  
}
