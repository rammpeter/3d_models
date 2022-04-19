$fn = 50;

module flansch(breite_flansch, abstand_bohrungen, durchmesser_bohrung, hoehe){
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


hoehe_flansch=3;
bohrung = 4.5;
laenge_konus = 170;
wandung= 2;
durchmesser_ventilator = 117;
durchmesser_ende = 13;
breite_flansch_oben = 65;
laenge_cylinder = 30;

difference(){
    union(){
        flansch(breite_flansch_oben, breite_flansch_oben-15, bohrung, hoehe_flansch);
        cylinder(laenge_konus/2, (durchmesser_ventilator-durchmesser_ende)/4+wandung, durchmesser_ende/2+wandung);
        translate([0,0,laenge_konus/2-20]){
            cylinder(laenge_cylinder+20, 10, 10);
            }            
        }
    union(){
        cylinder(laenge_konus/2, (durchmesser_ventilator-durchmesser_ende)/4, durchmesser_ende/2);
        translate([0,0,laenge_konus/2]){
            cylinder(laenge_cylinder, 16/2, 16.5/2);
            }
        }
    }

