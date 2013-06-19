/*
tenía un problema con JAVA en UBUNTU, que hacía imposible
a Minim reproducir más de un sample. la solución está aquí: 

http://importgeek.wordpress.com/2013/05/10/play-more-than-one-audio-sample-in-processing/
*/

/*
PENDIENTES: 
1. 
*/


// variables globales:

float hz [] = { 23.3, 1.2, 0.25, 0.4, 0.7, 1.2, 0.25, 0.4, 0.7, 1.2, 0.25, 0.4 };

String filenames [] = { "heart1.wav", "heart2.wav" };

int num_segundos = 5;



import ddf.minim.*;


// funcion mod para arreglar que % (modulo) en java arroja num negativos:
int mod( int a, int b ) {
  return ( ( a % b ) + b ) % b;
}



ArrayList<Reloj> relojes;
Grid grid;
Minim m;



void setup() {
  
  size(600, 600);
  strokeWeight( 1 );

  m = new Minim(this);

  //AudioSample p = m.loadSample("heart1.wav");
  //p.trigger();
  
  grid = new Grid( 3, 3, width/5, width/5, width/10, width/10 );
  
  relojes = new ArrayList<Reloj>();
  
  int num_relojes = hz.length;


  for ( int i = 0; i < num_relojes; i++) {    
    
    Reloj r = new Reloj();

    r.setXYS( grid.getX(i), grid.getY(i), 30);
    r.setHz( hz[i] );
    
    r.setMinim( m );
    r.setSampler( filenames [ mod( i, filenames.length ) ] );
    
    relojes.add( r );
    
  }

}



int  v[] = { 1, 2, 3 };

void draw() {

  background(0);
  color(255);
  for ( int i = 0; i < relojes.size(); i++) {
    relojes.get(i).setPosition(  ( millis() ) % ( num_segundos * 1000 )  );
    relojes.get(i).draw();    
  }
}

