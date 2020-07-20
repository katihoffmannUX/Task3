//Die Klasse erstellt ein Muster aus zwei Farben das mit Noise erstellt wird. Um ein Mond zu bekommen, wird die das Muster im Hauptsketch maskiert

class Moon {

  float noiseScale = 0.05;
  Moon() {
  }

  void show(PGraphics _p, color _c) {
    _p.beginDraw();
    _p.loadPixels();
    //Erstellt eine "Noise-Graphik"/ein Rauschen aus zwei Farben
    for (int x = 0; x<width; x++) {
      for (int y = 0; y<height; y++) {
        float col = 255*noise(noiseScale*x, noiseScale*y);
        //Zwei Farben werden hier getrennt
        if (col<125) {
          col = blue(_c)+10;
        } else {
          col = blue(_c)+30;
        }
        //Jedes Pixel wird mit der jeweiligen Farbe gefärbt
        _p.pixels[x + width*y] = color(red(_c), green(_c), col);
      }
    }
    _p.updatePixels();
    _p.endDraw();
  }
}
