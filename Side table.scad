
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees


translate([0, 0, 0]) leg(h=50); // 25 or 50
translate([30, 0, 0]) leg(h=65);
translate([0, 30, 0]) leg(h=65);
translate([30, 30, 0]) leg(h=65);

// top
translate([0, 0, 65]) cube([33, 33, 1.5]);
translate([0, 33/2, 65]) cylinder(h=1.5, r=33/2);

// top support
color("blue")translate([0, 15, 50]) leg(h=15); // hide or show


// middle
translate([0, 0, 50]) cube([33, 33, 1.5]);
translate([33/2, 0, 50]) cylinder(h=1.5, r=33/2);

// bottom
// flat_bottom();
slanted_bottom();

module slanted_bottom() {
translate([0, 0, 25]) rotate([-30, 0 , 0]) cube([33, 24, 1.5]);
translate([0, 20, 13]) rotate([60, 0 , 0]) cube([33, 15, 1.5]);
translate([0, 0, 25]) cube([3, 33, 3]);
translate([30, 0, 25]) cube([3, 33, 3]);
}

module flat_bottom() {
translate([0, 0, 25]) cube([33, 33, 1.5]);
translate([33/2, 33, 25]) cylinder(h=1.5, r=33/2);
}

module leg(h=50) {
    cube([3, 3, h]);
}
