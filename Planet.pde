//Die Klasse erstellt ein Streifenmuster, das man auf dem Planeten sehen kann

class Planet {
  float[] randomNumbers = new float[500];
  Planet() {
  }

//erstellt ein Streifenmuster, welches sich an der yAchse wiederholt
  void show(PGraphics _p, color _c1, color _c2) {
    _p.beginDraw();
    for (int i=0; i<50; i++) {
      _p.pushMatrix();
      _p.translate(0, i*15);
      float yoff = 0;
      for (int o=0; o<100; o++) {
        randomNumbers[o] = map(noise(yoff), 0, 1, (-50), (50));
        yoff = yoff + 0.5;
      }

      _p.beginShape();
      _p.strokeWeight(3);
      _p.stroke(_c1);
      _p.noFill();
      for (int o=0; o<100; o++) {
        _p.vertex(o*width/100, randomNumbers[o]);
      }

      _p.endShape();
      _p.noStroke();
      _p.popMatrix();
    }
    _p.endDraw();
  }
}
