use <agentscad/mx-screw.scad>
use <agentscad/mx-thread.scad>


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
            screw  = M3();
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
                    if (gewinde == "NO"){cylinder(hoehe, durchmesser_bohrung/2, durchmesser_bohrung/2);}
                    if (gewinde == "YES"){cylinder(hoehe, 1, 1);}
                    }
                }
            }
        }
    }


hoehe_flansch=3;
breite_flansch_unten = 120;
abstand_bohrungen_unten = 105;
bohrung = 4.5;
laenge_cylinder = 40;
laenge_konus = 170;
wandung= 1.5;
durchmesser_ventilator = 117;
durchmesser_ende = 13;
breite_flansch_oben = 65;

difference(){
    union(){
        flansch(breite_flansch_unten, abstand_bohrungen_unten, bohrung, hoehe_flansch);
        translate([-85, 45, 0]){cube([25, 5, hoehe_flansch]);}
        translate([-85, -50, 0]){cube([25, 5, hoehe_flansch]);}
       cylinder(laenge_cylinder, durchmesser_ventilator/2+wandung, durchmesser_ventilator/2+wandung);
        translate([0, 0, laenge_cylinder]){
            cylinder(laenge_konus/2, durchmesser_ventilator/2+wandung, (durchmesser_ventilator-durchmesser_ende)/4+wandung);
            }
        translate([0,0, laenge_cylinder+laenge_konus/2-hoehe_flansch]){
            flansch(breite_flansch_oben, breite_flansch_oben-15, bohrung, hoehe_flansch, "NO");
            }
        }
    union(){
        cylinder(laenge_cylinder, durchmesser_ventilator/2, durchmesser_ventilator/2);
        }    
        translate([0, 0, laenge_cylinder]){
            cylinder(laenge_konus/2, durchmesser_ventilator/2, (durchmesser_ventilator-durchmesser_ende)/4);
            }
    }

