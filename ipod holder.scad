


//translate([-10, -70, -1]) cube([20, 140, 1]);
translate([-10, -57.5, 0]) cube([20, 115, 1]);


difference() {
    topBase();
    ipod(30, 3);
}


module topBase() {


translate([3, 55, 0]) rotate([0, 0, 180]) foot(-30, -1, 7);
translate([3, -55, 0]) rotate([0, 0, 180]) foot(-30, -1, 7);


translate([0, 55, 0]) foot(30, 3, 10);
translate([0, -55, 0]) foot(30, 3, 10);
}



module ipod(angle, offset) {
thickness = 6.3;
length = 123.4;
    translate([offset, 0, 0])
    rotate([0, -angle, 0])
translate([-thickness/2, -length/2, -4]) color("red") cube([thickness, length, 60]);

}

module foot(angle, offset, radius) {
    thickness = 5;
    
    difference() {
        translate([0, -thickness/2, 0])
        rotate([-90, 0, 0])
            difference() {
                cylinder(thickness, r=radius);
                translate([-11, 0, -1]) color("blue") cube([22, 22, thickness+2]);
            }
        
            translate([offset, 0, 0])
        rotate([0, -angle, 0])
        translate([0, -(thickness+2)/2, -(radius+1)]) 
            color("green") cube([4*radius, thickness+2, 4*radius]);
        }
}

// 123.4 mm
// 58.6 mm
// 6.1 mm (thick)