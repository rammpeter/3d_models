$fn = 100;

hoehe = 90;
breite = 85;
rohr_durchmesser = 50;
einrueck_hoch = 7;
abstand = 62;
difference(){
    union(){
        cube([breite,abstand + einrueck_hoch, hoehe]);   
        translate([breite/2, einrueck_hoch, 0]){
            cylinder(hoehe, rohr_durchmesser/2, rohr_durchmesser/2);
            }        
        }
    union(){
        rotate([27, 90, 0]){
            translate([-hoehe/2, abstand + einrueck_hoch, -30]){
                cylinder(200, rohr_durchmesser/2, rohr_durchmesser/2);
            }
        }
        translate([-20, abstand+15, 0]){
            rotate([0, 0, -27]){
                cube([200,100, 100]);
                }
            }
        translate([-195, 50, 0]){
            rotate([0, 0, -15]){
                cube([200,100, 100]);
                }
            }
        }
    }

