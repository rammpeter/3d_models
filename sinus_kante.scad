module sinuskante(laenge, breite, dicke) {
  segments = 100;
  echo("start", points);
  points = [for (i = [0:segments]) 
      let(
      x = i * laenge / segments,
          y = breite*0.95*sin(90 + x * 360/laenge * round(laenge/10))
      )
      [x, y]
      ];
  
  linear_extrude(height = dicke)
    polygon(concat(points, [[laenge, breite], [0, breite]]));
}



  sinuskante(laenge=60, breite=3, dicke=1);
