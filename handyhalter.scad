$fn = 50;
    union(){
        cube([110,10,5]);           /* Querbalken */
        translate([0,-10]){
            cube([5,60,5]);         /* Längsbalken 1 */ 
            }
        rotate(a=90, v=[0,1,0]){    /* Knoten 1 */
            linear_extrude(5){
                polygon([[0,0], [0,20], [-20,20]]);
                }    
            }   
        translate([105,-10]){
            cube([5,60,5]);         /* Längsbalken 2 */ 
            rotate(a=90, v=[0,1,0]){    /* Knoten 1 */
                linear_extrude(5){
                    polygon([[0,10], [0,30], [-20,30]]);
                    }    
                }   
            }
        translate([0,0]){
            rotate(a=45, v=[1,0,0]){
                cube([5,40,5]);     /* Schrägbalken 1 */
                translate([0,-5, 5]){
                    cube([5,5,10]);      /* Stopper 1 1 cm breit */
                    } 
                translate([0, -5, 15]){
                    cube([5,8,3]);      /* Haken 1  */
                    } 
                }
            }           
        translate([105,0]){
            rotate(a=45, v=[1,0,0]){
                cube([5,40,5]);      /* Schrägbalken 2 */ 
                translate([0,-5, 5]){
                    cube([5,5,10]);      /* Stopper 1 1 cm breit */
                    } 
                translate([0, -5, 15]){
                    cube([5,8,3]);      /* Haken 1  */
                    } 
                }
            }
        }
    
