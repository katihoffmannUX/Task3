//Die Klasse erzeugt als Hintergrund einen Verlauf

class Gradient {
  color colors[];
  Gradient() {
    //Farben Array, wo 2 Farben gespeichert werden können
    colors = new color[2];
  }

  void show(color _c1, color _c2) {
    //Farben werden aus dem Hauptsketch übernommen
    colors[0] = _c1;
    colors[1] = _c2;
    background(0);
    
    int h = height;
    
    //Erstellung des Verlaufes
    for (int i = 0; i < h; i++) {
      float fraction = (float)(i) / height;
      color c = lerpColor(colors[0], colors[1], fraction);
      stroke(c);
      //Verlauf geht von oben nach unten
      line(height, i, 0, i);
    }
  }
}
