$fn = 96;
difference(){
    translate([87, -76.5, -0]) {
        scale([3,3,3]){
            import("/Users/pramm/Downloads/Coffee machine _ Kaffeevollautomat 1_14 - 4557217/files/Kaffeevollautomat.stl");
            }
        };
    translate([-33, 80 ,25]){
        rotate([90,0,0]){
            cylinder(65, 15, 15);
        };
    };
}
rotate([0, 0, 0])
    translate([-43,63,67])
        linear_extrude(height=5)
            text("Happy", size=5);
rotate([0, 0, 0])
    translate([-41,56.5,67])
        linear_extrude(height=5)
            text("Sixty", size=5);
