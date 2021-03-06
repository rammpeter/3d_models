$fn = 50;

module flansch(breite_flansch, abstand_bohrungen, durchmesser_bohrung, hoehe, gewinde="NO"){
    radius_abrundung=(breite_flansch-abstand_bohrungen)/2;
    difference(){
        union(){
            translate([-breite_flansch/2, -breite_flansch/2+radius_abrundung, 0]){
                cube([breite_flansch, breite_flansch-2*radius_abrundung, hoehe]);
                }
            translate([-breite_flansch/2+radius_abrundung, -breite_flansch/2, 0]){
                cube([breite_flansch-2*radius_abrundung, breite_flansch, hoehe]);
                }
            for(x = [-1, 1]){
                for (y = [-1, 1]){
                    translate([x * (breite_flansch/2-radius_abrundung), y * (breite_flansch/2-radius_abrundung), 0]){
                        cylinder(hoehe, radius_abrundung, radius_abrundung);
                        }
                        if (gewinde == "YES"){mxThreadInternal(screw,hoehe);}                         
                    }
                }
            }
        for(x = [-1, 1]){
            for (y = [-1, 1]){
                translate([x * (breite_flansch/2-radius_abrundung), y * (breite_flansch/2-radius_abrundung), 0]){
                    cylinder(hoehe, durchmesser_bohrung/2, durchmesser_bohrung/2);
                    }
                }
            }
        }
    }


hoehe_flansch=1;
breite_flansch_unten = 120;
abstand_bohrungen_unten = 105;
bohrung = 4.5;
wandung= 4;
durchmesser_ventilator = breite_flansch_unten-2*8;
durchmesser_ende = 13;
vertiefung = 2;

difference(){
    union(){
        flansch(breite_flansch_unten, abstand_bohrungen_unten, bohrung, hoehe_flansch);
        cylinder(hoehe_flansch+vertiefung, durchmesser_ventilator/2+wandung, durchmesser_ventilator/2+wandung);
        }
    union(){
        cylinder(hoehe_flansch+vertiefung, durchmesser_ventilator/2, durchmesser_ventilator/2);
        }    
    }

