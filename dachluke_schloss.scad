use <agentscad/mx-screw.scad>
use <agentscad/mx-thread.scad>

$fn = 50;
radius_aussen=4.8;
/* Not really connected with screw at inner radius = 2.9 */
radius_innen=2.8;
hoehe = 49;
hoehe_gewinde = 33;
breite = 11.8;
translate([0,0,hoehe]) rotate([0,180,0]){
difference(){
    cylinder(hoehe, radius_aussen, radius_aussen);
    cylinder(hoehe_gewinde, radius_innen, radius_innen);
}
    
difference(){
    translate([0,-breite/2,hoehe]){
        rotate([-90,0,0]){
            linear_extrude(breite){
                polygon([[0,0], [20-radius_aussen,0], [0,20-radius_aussen]]);
                }    
        }
    }
    union(){
        linear_extrude(hoehe){
            polygon([[0,radius_aussen], [0, breite/2+1], [breite/2-radius_aussen+3, breite/2+1]]);
            }
        linear_extrude(hoehe){
            polygon([[0,-radius_aussen], [0, -breite/2-1], [breite/2-radius_aussen+3, -breite/2-1]]);
            }
        }
}

screw  = M6();
mxThreadInternal(screw,hoehe_gewinde);
}
