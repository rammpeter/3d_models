$fn = 100;

hoehe = 110;
breite = 85;
rohr_durchmesser = 50;
einrueck_hoch = 10;
abstand = 72;
difference(){
    union(){
        cube([breite,abstand + einrueck_hoch, hoehe]);   
        translate([breite/2, einrueck_hoch, 0]){
            cylinder(hoehe, rohr_durchmesser/2, rohr_durchmesser/2);
            }        
        }
    union(){
        rotate([0, 90, 0]){
            translate([-hoehe/2, abstand + einrueck_hoch,0]){
                cylinder(breite, rohr_durchmesser/2, rohr_durchmesser/2);
            }
        }
    }
}

