
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

rotate([0, -90, 0])
union() {
    base();
    frame(5, 9, 1);
    translate([-4, -2.5, 1]) color("green") cube([1, 5, .5]);
}

module base() {
translate([-4, -7, 0])
    cube([9, 14, 1]);
}


//translate([0, -2.5, 9]) color("red") cube([4, 5, 1]);


module frame(opening_width, opening_height, thickness) {
    depth = 4;
    translate([-depth, - (opening_width + 2 * thickness) / 2, 0]) 
        difference() {
            cube([depth, opening_width + 2 * thickness, opening_height + 2 * thickness]);
            color("blue") translate([-1, thickness, thickness])
                cube([7, opening_width, opening_height]);
        }
}