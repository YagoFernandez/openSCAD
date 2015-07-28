

translate([0, 0, 7]) leaf(long=false);

translate([0, 0, 30]) leaf(long=true);
rotate([0, 0, -120]) translate([0, 0, 40]) leaf(long=true);
rotate([0, 0, -240]) translate([0, 0, 50]) leaf(long=true);

rotate([0, 0, 0]) translate([16, 0, 0]) cylinder(r=1.2, h=50, $fn=100);
rotate([0, 0, 120]) translate([16, 0, 0]) cylinder(r=1.2, h=50, $fn=100);
rotate([0, 0, 240]) translate([16, 0, 0]) cylinder(r=1.2, h=50, $fn=100);

module leaf(long=false) {
    intersection() {
        rotate([0, 0, 0]) translate([15, 0, 0])cylinder(r=30, h=1);
        rotate([0, 0, 120]) translate([15, 0, 0])cylinder(r=30, h=1);
        if (long==false) {
            rotate([0, 0, 240]) translate([15, 0, 0])cylinder(r=30, h=1);
        }
    }
}
