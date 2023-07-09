$fn = 41;
dicke_flach = 5;
radius_dick = 14;
radius_vorn_aussen = 5.8;
radius_vorn_innen = 3.6;
laenge_flach = 20;
breite = 49;
breite_zwick = 26;
// Radius der Minkowski-Kugel
mn=1.4;

module grundkoerper(){
    difference(){
        union(){
            // Grundplatte
            cube([breite-2*mn,laenge_flach,dicke_flach-2*mn]);
            // Aussenzylinder klein
            translate([0, 0, radius_vorn_aussen-mn]){
                rotate([0,90,0]){
                    cylinder(breite-2*mn, radius_vorn_aussen-mn, radius_vorn_aussen-mn);
                    };
                };
            // Aussenzylinder groß    
            translate([0,laenge_flach,radius_dick-mn]){
                rotate([0,90,0]){
                    cylinder(breite-2*mn, radius_dick-mn, radius_dick-mn);
                    };
                };    
            };
        // Beginn difference    
        union(){
            // Ausschnitt Innenzylinder groß
            translate([0, laenge_flach, radius_dick-mn]){
                rotate([0,90,0]){
                    cylinder(breite-2*mn, radius_dick-dicke_flach+mn, radius_dick-dicke_flach+mn);
                    };
                };
           // Entfernen Dreivierteilkreis unten    
           translate([0,6,dicke_flach-2*mn]){
               cube([breite,14,80]);
               };     
            };      
          // Entfernen Dreiviertelkreis oben  
           translate([0,6,radius_dick-mn]){
               cube([breite,80,80]);
               };     
           // Ausschnitt links   
           translate([-mn, -mn, dicke_flach-2*mn]){
               cube([(breite-breite_zwick)/2+mn,10,40]);
               };     
           // Ausschnitt rechts    
           translate([breite-(breite-breite_zwick)/2-2*mn, -mn,dicke_flach-2*mn]){
               cube([(breite-breite_zwick)/2+mn,10,40]);
               };  
        };
    // Rundung Viertelkreis oben    
    translate([0, laenge_flach+radius_dick-dicke_flach/2, radius_dick-mn]){
        rotate([0,90,0]){
            cylinder(breite-2*mn, dicke_flach/2-mn, dicke_flach/2-mn);
            };
        };

    };

module scharf_diff(){
    translate([-mn, 0, radius_vorn_aussen-mn]){
        rotate([0,90,0]){
            cylinder(breite, radius_vorn_innen, radius_vorn_innen);
            };
        };    
    // Schlitzausschnitt   
    translate([-mn,-3.2,5-mn]){
        rotate([30, 0, 0]){
            cube([breite, 6, 10]);
            };
        };   
    };
    
difference(){
    minkowski(){
        grundkoerper();
        sphere(mn);
        };
    scharf_diff();
    };    
