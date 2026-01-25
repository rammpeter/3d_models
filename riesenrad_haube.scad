// Nullpunkt ist die Knickkante zum Überhang auf der Innenseite
$fn = 500;
// Maße innen
breite = 76;
laenge = 80;
// Höhe incl. Überhang
hoehe = 32;
dicke = 1.5;
ueberhang = 16; 
bogen_radius = 64;
x_verschiebung_cylinder = bogen_radius-(hoehe-ueberhang);
loch_durchmesser = 9;

module seitenwand(z){
    difference(){
       translate([-(hoehe-ueberhang+dicke), -laenge/2-dicke,z]){
            cube([hoehe+dicke, laenge+2*dicke, dicke]);            
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
        cube([ueberhang+dicke, dicke, breite]);
    };
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
    translate([bogen_radius*1.5, -bogen_radius*1.5, 0]){
        cube([hoehe*2, bogen_radius*3, breite+2*dicke]);
    };
    
}

difference(){
    grund();
    aussen();
};
