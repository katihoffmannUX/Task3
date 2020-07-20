//Klasse setzt den Schriftzug "procedural landscapes"
class Font {
  //Position
  float xFont; 
  float yFont;
  //Größe
  float sizeFont;
  //Farbe der Schrift
  color rgb = color(255);
  Font() {
  }

  void show(float _xF, float _yF, float _sizeF, color _backgroundC) {
    xFont = _xF;
    yFont = _yF;
    sizeFont = _sizeF;
    //Hintergrund der Schrift
    fill(_backgroundC);
    rect(xFont-10, yFont-32, 350, 45);
    //Festlegung der Schriftart
    PFont font;
    font = createFont("Shree Devanagari 714.ttf", 32);
    textFont(font);
    //Farbe der Schrift
    fill(rgb);
    //Größe
    textSize(sizeFont);
    //Text
    text("procedural landscapes", xFont, yFont);
  }
}
