import processing.pdf.*;

boolean record;

PGraphics pg; //Für die Landschaft
PGraphics pgGradient; //Für den Verlauf

PGraphics moonpg, moonmask; //Für den Mond

PGraphics planetpg, planetmask; //Für den Planeten

//Farben
//Blautöne
public color colorsBlue[];
//Rottöne
public color colorsRed[];
//Allgemein
color colors[];

//Verlauf
Gradient gradient = new Gradient();

//Variablen für die Sonne
Sun sun = new Sun();
int sunSize = (int)random(90, 150);
float sunX;
float sunY;
int sunRotate = 0;
int sunSpeed = 30;

//Variablen für den Mond
Moon moon = new Moon();
float moonSize = 100;
float moonX;
float moonY;

//Variablen für den Planeten
Planet planet = new Planet();
float planetSize = 100;
float planetX;
float planetY;

//Sterne
Star star = new Star();

//Landschaft
Landscape landscape = new Landscape();

//Schrift
Font font = new Font();

void setup() {
  setColor();
  size(595, 842, P2D, "Data/Test"+frameCount+".pdf");
 // beginRecord(PDF, "foto-" + nf(3, 3) + ".pdf"); 
  sunX = width/2;
  setMoon();
  setPlanet();
  setSun();
  //Grafiken erstellen, damit man 3D und 2D mischen kann und mit Masken arbeiten kann
  pg = createGraphics(595, 842, P3D);
  pgGradient = createGraphics(595, 842, P2D);
  moonpg = createGraphics(width, height, P2D);
  moonmask = createGraphics(width, height, P2D);
  planetpg = createGraphics(width, height, P2D);
  planetmask = createGraphics(width, height, P2D);
}

void draw() {
if (record) {
    beginRaw(PDF, "output.pdf");
  }
  //Show-Funktionen erzeugen hier die Klassen
  gradient.show(colors[0], colors[1]);
  star.show(colors[2]);
  //animateSun(); //Falls die Sonne sich bewegen soll
  sun.show(sunX, sunY, sunSize, colors[0], colors[1], sunRotate);
  moon.show(moonpg, colors[1]);
  maskMoon();
  planet.show(planetpg, colors[2], colors[1]);
  maskPlanet();
  landscape.show(pg, colors[1]);
  image(pg, 0, 250);
  font.show(20, height-50, 32, colors[1]);
  
   if (record) {
    endRaw();
    record = false;
  }
}

//Erstellt eine Maske für den Mond
void maskMoon() {
  moonmask.beginDraw();
  moonmask.noStroke();
  moonmask.ellipse(moonX, moonY, moonSize, moonSize);
  moonmask.endDraw();

  moonpg.mask(minAlphas(moonpg, moonmask));
  image(moonpg, 0, 0);
}

//Erstellt eine Maske für den Planeten
void maskPlanet() {
  planetmask.beginDraw();
  planetmask.noStroke();
  planetmask.ellipse(planetX, planetY, planetSize, planetSize);
  planetmask.endDraw();

  planetpg.mask(minAlphas(planetpg, planetmask));
  image(planetpg, 0, 0);
  
  noFill();
  stroke(colors[2]);
  strokeWeight(5);
  ellipse(planetX, planetY, planetSize+5, planetSize+5);
  noStroke();

}

//Subtrahiert den Hintergrund
int[] minAlphas(PImage _pg, PImage _mask) {
  _pg.loadPixels();
  _mask.loadPixels();
  int[] a = new int[_pg.pixels.length];
  for (int i =0; i<_pg.pixels.length; i++) {
    a[i] = min(_pg.pixels[i] >> 24 & 0xFF, _mask.pixels[i] >> 24 & 0xFF);
  }
  return a;
}

//Setzt die Farben
void setColor() {
  //BlaueFarben
  colorsBlue = new color[3];
  colorsBlue[0] = color(49, 84, 140);
  colorsBlue[1] = color(60, 151, 163);
  colorsBlue[2] = color(142, 203, 190);
  
  //RoteFarben
  colorsRed = new color[3];
  colorsRed[0] = color(219, 129, 77);
  colorsRed[1] = color(245, 196, 81);
  colorsRed[2] = color(250, 158, 77);
  
  colors = new color[3];
  //Tagsüber rot-orange, Nachts blau
  if(hour()>=6 && hour() <=18){
    colors[0]=colorsRed[0];
    colors[1]=colorsRed[1];
    colors[2]=colorsRed[2];
  }
  else{
    colors[0]=colorsBlue[0];
    colors[1]=colorsBlue[1];
    colors[2]=colorsBlue[2];
  }
}

//Falls nicht auskommentiert, dann bewegt sich die Sonne
void animateSun() {
  sunY = sunY - sunSpeed;
  sunRotate = sunRotate + 10;
  if (sunY < -700) {
    sunY=1000;
  }
}

//Setzt die Sonnenposition
void setSun(){
  sunY = hour();
  sunY = map(sunY, 0, 23, 0, 500);
}

//Setzt die Mondposition
void setMoon() {
  moonSize = hour();
  moonSize = map(moonSize, 0, 23, 50, 150);
  moonX = minute();
  moonX = map(moonX, 0, 59, moonSize, width-moonSize);
  moonY = second();
  moonY = map(moonY, 0, 59, moonSize, 430);
}

//Setzt die Planetenposition
void setPlanet() {
  planetSize = month();
  planetSize = map(planetSize, 1, 12, 50, 150);
  /*planetX = day();
  planetX = map(planetX, 1, 31, planetSize, width-planetSize);
  planetY = day();
  planetY = map(planetY, 1, 31, planetSize, 430);*/
  /*planetX = sunX + 40;
  planetY = sunY + 40;*/
  planetX = random(sunX,width);
  planetY = random(sunY,450);
}

void mousePressed() {
  saveFrame("Data/line-######.png");
  //beginRecord(PDF, "Data/frame-####.pdf"); 
  //beginRaw(PDF,"Data/raw.pdf");
  //endRecord();
  //beginRaw(PDF, "Data/Raw"+frameCount+".pdf");
}

void mouseReleased(){
  //endRecord();
  //endRaw();
//  endRaw();
 // exit();
}

void keyPressed() {
  if (key == 'r') {
    record = true;
  }
}
