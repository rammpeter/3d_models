laenge_balken=3610;
dicke_balken=120;
hoehe_unterkante_balken1=150;
hoehe_unterkante_balken2=1150;
hoehe_unterkante_balken3=2100;
dicke_brett=20;
breite_brett=170;
hoehe_brett=hoehe_unterkante_balken3+dicke_balken;
anzahl_bretter=14;
breite_ansatz=1000;

// Wand frontal
translate([0,0,hoehe_unterkante_balken1]){cube([laenge_balken, dicke_balken, dicke_balken]);}
translate([0,0,hoehe_unterkante_balken2]){cube([laenge_balken, dicke_balken, dicke_balken]);}
translate([0,0,hoehe_unterkante_balken3]){cube([laenge_balken, dicke_balken, dicke_balken]);}
translate([-dicke_balken,0,0]){cube([dicke_balken, dicke_balken, hoehe_unterkante_balken3+dicke_balken]);}
translate([laenge_balken,0,0]){cube([dicke_balken, dicke_balken, hoehe_unterkante_balken3+dicke_balken]);}

//Wand links
translate([laenge_balken,dicke_balken,hoehe_unterkante_balken1]){cube([dicke_balken, breite_ansatz, dicke_balken]);}
translate([laenge_balken,dicke_balken,hoehe_unterkante_balken2]){cube([dicke_balken, breite_ansatz, dicke_balken]);}
translate([laenge_balken,dicke_balken,hoehe_unterkante_balken3]){cube([dicke_balken, breite_ansatz, dicke_balken]);}

// wand rechts
translate([-dicke_balken,dicke_balken,hoehe_unterkante_balken1]){cube([dicke_balken, breite_ansatz, dicke_balken]);}
translate([-dicke_balken,dicke_balken,hoehe_unterkante_balken2]){cube([dicke_balken, breite_ansatz, dicke_balken]);}
translate([-dicke_balken,dicke_balken,hoehe_unterkante_balken3]){cube([dicke_balken, breite_ansatz, dicke_balken]);}


brett_mittenabstand = (laenge_balken-breite_brett)/(anzahl_bretter-1);

//echo(brett_mittenabstand-breite_brett);

for (i = [0 : anzahl_bretter-1]) {
    translate([brett_mittenabstand * i, -dicke_brett ,0]) { 
        cube([breite_brett, dicke_brett, hoehe_brett]); 
        }
    }
for (i = [0 : anzahl_bretter-2]) {
    translate([brett_mittenabstand * i + brett_mittenabstand- (brett_mittenabstand-breite_brett)/2 - breite_brett/2, -dicke_brett*2 ,0]) { 
        cube([breite_brett, dicke_brett, hoehe_brett]); 
        }
    }

