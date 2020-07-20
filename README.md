# Task3
3. Aufgabe
Die Aufgabe war es ein generatives Poster zu erstellen. Dafür sollte man eine Wortkombination aus einer Auswahl auswählen. Ich habe mich für procedural landscapes entschieden, da ich gerne eine Landschaft mit einem Sternenhimmel kombinieren wollte.
Generative Punkte:
• Hügellandschaft unten im Poster wird generativ erstellt. Dabei werden die Hügel durch Noise     
  erstellt
• Die Sonne bewegt sich je nach Stunde in der yAchse entlang. Falls man animateSun() nicht 
  auskommentiert, bewegte sich die Sonne automatisch nach oben. Nach unten bewegt sie
  im Laufe eines Tages, wenn man diese nicht animieren würde
• Es gibt zwei Hauptfarben-Kategorien. Das heißt, dass die Farben rötlichorange werden, falls 
  es tagsüber ist und bläulich falls es Nacht ist
• Sterne werden durch Zufall im Hintergrund verteilt. Der Radius ist auch Zufall
• Ein Planet mit einem wiederholendem Streifenmuster wird auch in eine Zufallsposition gestetzt
• Der Mond bekommt eine fleckige Zufallsoberfläche durch Noise. Die xAchse wird durch die
  Minute bestimmt, wo es erstellt worden ist. Die yAchse wird durch die Anfangssekundenzahl 
  bestimmt
