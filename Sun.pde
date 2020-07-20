//Erzeugt die Klasse Sonne, die einen Kreis mit einem Verlauf und Strahlen erstellt.

class Sun {
  //Speicherarray für Farben
  color colors[];

  Sun() {
    //Festlegung der Größe des Farben-Arrays
    colors = new color[2];
  }

  //Position, Größe, Farben und Rotation wird als Parameter übergeben
  void show(float _x, float _y, int _size, color _color1, color _color2, int _rotate) {

    //Zwei Farben die man 
    colors[0] = _color1;
    colors[1] = _color2;

    //Zeichnet die Sonnenstrahlen ein
    drawSunshine(_x, _y, _rotate);

    //Erfasst die Größe des Kreises
    for (int i=_size; i< width; i+=width) {
      for (int j =_size; j< height/2; j+=width) {
        drawGradient(i+_x-_size, j+_y-_size, _size, colors[0], colors[1]);
      }
    }
  }

  //Erstellung eines runden Verlaufes
  void drawGradient(float _i, float _j, float _size, color _c1, color _c2) {
    float px;
    float py;
    float angle = 0;

    // Berechnung der Unterschiede der Farben
    float red = red(_c2)-red(_c1);
    float green = green(_c2)-green(_c1);
    float blue = blue(_c2)-blue(_c1);
    //Lücken-Füller
    float filler = 32.0;

    //Erstekkung des runden Verlaufes
    for (int i=0; i< _size; i++) {
      for (float j=0; j<360; j+=1.0/filler) {
        px = _i+cos(radians(angle))*i;
        py = _j+sin(radians(angle))*i;
        angle+=1.0/filler;
        //Farbe des jeweiligen Zeitpunktes in der Forschleifen
        color c = color((red(_c1)+(i)*(red/_size)), (green(_c1)+(i)*(green/_size)), (blue(_c1)+(i)*(blue/_size)));
        //Pixel wird mit der richtigen Farbe eingefärbt
        set(int(px), int(py), c);
      }
    }
  }

  //Erstellung der Sonnenstrahlen
  void drawSunshine(float _x, float _y, int _rotate) {
    pushMatrix();
    translate(_x, _y);

    //Linie wird erstellt und gedreht
    for (int i=0; i<360; i+=36)
    {
      pushMatrix();
      stroke(colors[1]);
      strokeWeight(3);
      rotate(radians(i+_rotate));
      line(0, 0, 0, 500);
      popMatrix();
    }

    popMatrix();
    noStroke();
  }
}
