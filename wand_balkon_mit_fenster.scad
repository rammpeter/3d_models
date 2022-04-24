laenge_balken=3610;
dicke_balken=120;
hoehe_unterkante_balken1=170;
hoehe_unterkante_balken2=1145;
hoehe_unterkante_balken3=2110;
dicke_brett=20;
breite_brett=170;
hoehe_brett=hoehe_unterkante_balken3+dicke_balken;
anzahl_bretter=14;
breite_ansatz=1000;
anzahl_bretter_ansatz=4;
brett_mittenabstand = (laenge_balken-breite_brett)/(anzahl_bretter-1);
versatz_aussenbrett=brett_mittenabstand- (brett_mittenabstand-breite_brett)/2 - breite_brett/2;

breite_fenster=1200;
hoehe_fenster=700;
dicke_glas=6;
ueberstand_glas = 10;
mitte_x_fenster_1=laenge_balken/4;
mitte_x_fenster_2=laenge_balken/4*3;
mitte_y_fenster=(hoehe_unterkante_balken2 + dicke_balken + hoehe_unterkante_balken3)/2;



module wand(){
    // Wand frontal
    translate([0,0,hoehe_unterkante_balken1]){cube([laenge_balken, dicke_balken, dicke_balken]);}
    translate([0,0,hoehe_unterkante_balken2]){cube([laenge_balken, dicke_balken, dicke_balken]);}
    translate([0,0,hoehe_unterkante_balken3]){cube([laenge_balken, dicke_balken, dicke_balken]);}
    translate([-dicke_balken,0,0]){cube([dicke_balken, dicke_balken, hoehe_unterkante_balken3+dicke_balken]);}
    translate([laenge_balken,0,0]){cube([dicke_balken, dicke_balken, hoehe_unterkante_balken3+dicke_balken]);}

    for (i = [0 : anzahl_bretter-1]) {
        translate([brett_mittenabstand * i, -dicke_brett ,0]) { 
            cube([breite_brett, dicke_brett, hoehe_brett]); 
            }
        }
    for (i = [0 : anzahl_bretter-2]) {
        translate([brett_mittenabstand * i + versatz_aussenbrett, -dicke_brett*2 ,0]) { 
            cube([breite_brett, dicke_brett, hoehe_brett]); 
            }
        }

    //Wand links
    translate([laenge_balken,dicke_balken,hoehe_unterkante_balken1]){cube([dicke_balken, breite_ansatz, dicke_balken]);}
    translate([laenge_balken,dicke_balken,hoehe_unterkante_balken2]){cube([dicke_balken, breite_ansatz, dicke_balken]);}
    translate([laenge_balken,dicke_balken,hoehe_unterkante_balken3]){cube([dicke_balken, breite_ansatz, dicke_balken]);}

    for (i = [0 : anzahl_bretter_ansatz-1]) {
        translate([laenge_balken+dicke_balken, brett_mittenabstand * i+dicke_balken ,0]) { 
            cube([dicke_brett, breite_brett, hoehe_brett]); 
            }
        }
    for (i = [0 : anzahl_bretter_ansatz-2]) {
        translate([laenge_balken+dicke_balken+dicke_brett, brett_mittenabstand * i + dicke_balken + versatz_aussenbrett, 0]) { 
            cube([dicke_brett, breite_brett, hoehe_brett]); 
            }
        }

    // wand rechts
    translate([-dicke_balken,dicke_balken,hoehe_unterkante_balken1]){cube([dicke_balken, breite_ansatz, dicke_balken]);}
    translate([-dicke_balken,dicke_balken,hoehe_unterkante_balken2]){cube([dicke_balken, breite_ansatz, dicke_balken]);}
    translate([-dicke_balken,dicke_balken,hoehe_unterkante_balken3]){cube([dicke_balken, breite_ansatz, dicke_balken]);}

    for (i = [0 : anzahl_bretter_ansatz-1]) {
        translate([-dicke_brett-dicke_balken, brett_mittenabstand * i+dicke_balken ,0]) { 
            cube([dicke_brett, breite_brett, hoehe_brett]); 
            }
        }
    for (i = [0 : anzahl_bretter_ansatz-2]) {
        translate([-dicke_brett*2-dicke_balken, brett_mittenabstand * i + dicke_balken + versatz_aussenbrett, 0]) { 
            cube([dicke_brett, breite_brett, hoehe_brett]); 
            }
        }
    }
    
    
module fenster_loch(mitte_x, mitte_y){
    translate([mitte_x-breite_fenster/2+ueberstand_glas, -dicke_brett*2-10, mitte_y-hoehe_fenster/2+ueberstand_glas]) { 
        cube([breite_fenster-ueberstand_glas*2, dicke_brett*2+20, hoehe_fenster-ueberstand_glas*2]); }    
    }   
   
module fenster_glas(mitte_x, mitte_y){
    translate([mitte_x-breite_fenster/2, 0, mitte_y-hoehe_fenster/2]) { 
        color([0.5,0.5,0.5,0.4]) { 
            cube([breite_fenster, dicke_glas, hoehe_fenster]); 
            }
        }
    }    

difference(){
    wand();
    union(){
        fenster_loch(mitte_x_fenster_1, mitte_y_fenster);
        fenster_loch(mitte_x_fenster_2, mitte_y_fenster);
        }
    }
fenster_glas(mitte_x_fenster_1, mitte_y_fenster);
fenster_glas(mitte_x_fenster_2, mitte_y_fenster);
    





