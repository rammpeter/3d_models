union(){
linear_extrude(height = 8) {
text("Ramm", size=35, font="Arial:style=Bold");
};
translate([10,10,0]) cube([130,5,3]);
translate([2,2,8]){
    linear_extrude(height = 1) {
        text("Ramm", size=30, font="Arial");
        }
}
}
