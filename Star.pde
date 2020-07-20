//Die Klasse erzeugt im Hintergrund einen Sternenhimmel

class Star {
  //Anzahl der Sternen
  int n = (int)random(15, 50);
  //Positionen Größen, die in Arrays dann gespeichert werden
  float x[] = new float[n];
  float y[] = new float[n];
  float radius[] = new float[n];
  Star() {
    setArray();
  }

  void setArray() {
    for (int i = 0; i<n; i++) {
      x[i] = random(0, 595);
      y[i] = random(0, 842);
      radius[i] = random(1, 10);
    }
  }

  //Als Parameter wird eine Farbe übergeben
  void show(color _c) {
    for (int i = 0; i<n; i++) {
      fill(_c,150);
      noStroke();
      //Sterne werden gezeichnet
      circle(x[i], y[i], radius[i]+5);
      fill(_c);
      circle(x[i], y[i], radius[i]);
    }
  }
}
