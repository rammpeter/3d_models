// Nullpunkt ist die Knickkante zum Überhang auf der Innenseite
$fn = 250;
// Maße innen
breite = 76;
laenge = 80;
// Höhe incl. Überhang
hoehe = 32;
dicke = 1;
ueberhang = 16; 
bogen_radius = 60;
x_verschiebung_cylinder = bogen_radius-(hoehe-ueberhang);
loch_durchmesser = 9;
sinuskante_breite = 4;

module sinuskante(laenge, breite, dicke) {
  // echo("länge", laenge);
  // echo ("breite", breite);
  // echo("Dicke", dicke);
  segments = 200;
  points = [for (i = [0:segments]) 
      let(
      x = i * laenge / segments,
          y = breite/2*0.95*sin(90 + x * 360/laenge * round(laenge/10))
      )
      [x, y]
      ];
  
  linear_extrude(dicke)
    polygon(concat(points, [[laenge, breite], [0, breite]]));
}


module seitenwand(z){
    difference(){
       union(){
           translate([-(hoehe-ueberhang+dicke), -laenge/2-dicke,z])
                cube([hoehe+dicke-sinuskante_breite, laenge+2*dicke, dicke]);  
            translate([ueberhang+dicke-sinuskante_breite/2, -laenge/2-dicke, z])
                rotate([0,0,90])
                    sinuskante(laenge+2*dicke, sinuskante_breite, dicke);         
       };   
       union(){
           translate([ueberhang-loch_durchmesser ,-loch_durchmesser/2, z]){
                cube([loch_durchmesser, loch_durchmesser, dicke]);
           };
           translate([ueberhang-loch_durchmesser , 0, z]){
                cylinder(dicke, loch_durchmesser/2, loch_durchmesser/2);
           };
           
       }; 
    };
}

module vorhang(y){
    translate([-dicke, y, dicke]){
        cube([ueberhang+dicke-sinuskante_breite, dicke, breite]);
    };
    translate([ueberhang+dicke-sinuskante_breite/2, y, 2*dicke+breite])
        rotate([270,90,0])
            sinuskante(breite+2*dicke, sinuskante_breite, dicke);         
}

module grund(){
    // Kreisbogen
    translate([x_verschiebung_cylinder, 0, dicke]){
        difference(){
           cylinder(breite, bogen_radius+dicke, bogen_radius+dicke);
           cylinder(breite, bogen_radius, bogen_radius);
        };
    };
    // Seitenteile
    seitenwand(0);
    seitenwand(breite+dicke);
    vorhang(-(laenge/2+dicke));
    vorhang(laenge/2);
}

// die Umgebung die vom Grund abgeschnitten wird
module aussen(){
    // äusserer Kreisbogen
    translate([x_verschiebung_cylinder, 0, 0]){
        difference(){
           cylinder(breite+2*dicke, bogen_radius+hoehe, bogen_radius+hoehe);
           cylinder(breite+2*dicke, bogen_radius+dicke, bogen_radius+dicke);
        };
    };
    // Zylinderrest entferen
    translate([-10, -hoehe*2-(laenge/2+dicke), 0]){
        cube([bogen_radius*3, hoehe*2, breite+2*dicke]);
    };
    translate([-10, laenge/2+dicke, 0]){
        cube([bogen_radius*3, hoehe*2, breite+2*dicke]);
    };
    translate([bogen_radius*1.2, -bogen_radius*1.5, 0]){
        cube([hoehe*2, bogen_radius*3, breite+2*dicke]);
    };
    
}

module haelfte(){
    translate([-20, -50, (breite+dicke)/2])
        cube([50, 100, 50]);
}

difference(){
    difference(){
        grund();
        aussen();
    };
    haelfte();
};
