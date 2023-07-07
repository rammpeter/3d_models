$fn = 50;
dicke_flach = 6;
radius_dick = 14;
radius_vorn_aussen = 5.5;
laenge_flach = 20;
breite = 45;
breite_zwick = 26;
difference(){
    union(){
        cube([45,laenge_flach,dicke_flach]);
        translate([0, 0, 5.5]){
            rotate([0,90,0]){
                cylinder(breite, radius_vorn_aussen, radius_vorn_aussen);
                };
            };
        translate([0,laenge_flach,radius_dick]){
            rotate([0,90,0]){
                cylinder(45, radius_dick, radius_dick);
                    cylinder(breite, 8, 8);
                };
            };    
        };
    union(){
        rotate([0,90,0]){
            translate([-radius_vorn_aussen, 0, 0]){
                cylinder(breite, 3.5, 3.5);
                };
            translate([-radius_dick, laenge_flach, 0]){
                cylinder(breite, radius_dick-dicke_flach, radius_dick-dicke_flach);
                };
            };
       translate([0,6,dicke_flach]){
           cube([breite,14,80]);
           };     
        };        
       translate([0,6,radius_dick]){
           cube([breite,80,80]);
           };     
       translate([0, 0, dicke_flach]){
           cube([(breite-breite_zwick)/2,10,80]);
           };     
       translate([breite-(breite-breite_zwick)/2,0,dicke_flach]){
           cube([(breite-breite_zwick)/2,10,80]);
           };  
        translate([0,-3.2,5]){
            rotate([30, 0, 0]){
                cube([breite, 6, 10]);
                };
            };   
    };
rotate([0,90,0]){
    translate([-radius_dick, laenge_flach+radius_dick-dicke_flach/2, 0]){
        cylinder(45, dicke_flach/2, dicke_flach/2);
        };
    };
