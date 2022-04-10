radius_aussen=4.8;
radius_innen=2.75;
hoehe = 49;
breite = 17;
difference(){
    cylinder(hoehe, radius_aussen, radius_aussen);
    cylinder(33, radius_innen, radius_innen);
}
    
difference(){
    translate([0,-8.5,49]){
        rotate([-90,0,0]){
            linear_extrude(breite){
                polygon([[0,0], [20,0], [0,20]]);
                }    
        }
    }
    union(){
        linear_extrude(hoehe){
            polygon([[0,radius_aussen], [0, breite/2], [breite/2-radius_aussen, breite/2]]);
            }
        linear_extrude(hoehe){
            polygon([[0,-radius_aussen], [0, -breite/2], [breite/2-radius_aussen, -breite/2]]);
            }
        }
}

