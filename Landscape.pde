//Die Klasse erstellt eine 3D Landschaft, die dann im Hauptsketch in eine 2D Graphik umgewandelt wird

class Landscape {
  //Gitternetz-Variablen
  int cols; 
  int rows;
  //Größe der Netzstruktur
  int scl = 20;
  //Weite und Breite des Netzes
  int w = 2000;
  int h = 1600;
  //x,y von der Umgebung werden dort gespeichert
  float [][] landscapes;

  Landscape() {
    //Größe der Flächen
    cols = w/scl;
    rows = h/scl;
    landscapes = new float[cols][rows];
  }

  //Erstellt eine 3D Landschaft, die dann im Hauptsketch in eine 2D-Graphik umgewandelt wird
  void show(PGraphics _p, color _c) {
    _p.beginDraw();
    float yoff = 0;
    for (int y = 0; y < rows; y++) {
      float xoff =0; 
      for (int x=0; x < cols; x++) {
        //Geht jede Reihe und Spalte durch, um eine hügelige Landschaft zu erschaffen --> Speichert die Höhe
        landscapes[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
        xoff += 0.2;
      }
      yoff += 0.2;
    }
    _p.strokeWeight(1);
    _p.stroke(255);

    _p.translate(width/2, height/2+100);
    //Dreht die Landschaft an der Z-Achse
    _p.rotateX(PI/3);
    _p.translate(-w/2, -h/2);
    for (int y = 0; y < rows-1; y++) {
      _p.beginShape(TRIANGLE_STRIP);
      for (int x=0; x < cols; x++) {
        //Erstellt das Gitternetz und füllt dieses mit Farbe 
        _p.fill(_c);
        _p.vertex(x*scl, y*scl, landscapes[x][y]);
        _p.vertex(x*scl, (y+1)*scl, landscapes[x][y+1]);
      }
      _p.endShape();
    }
    _p.endDraw();
  }
}
