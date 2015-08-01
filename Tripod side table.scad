

rotate([0, 0, -120]) translate([0, 0, 27]) leaf(long=true);
rotate([0, 0, 0]) translate([0, 0, 19]) leaf(long=true);
rotate([0, 0, -240]) translate([0, 0, 11]) leaf(long=true);

translate([0, 0, 2]) leaf(long=false);

rotate([0, 0, 0]) translate([6, 0, 0]) post();
rotate([0, 0, 120]) translate([6, 0, 0]) post();
rotate([0, 0, 240]) translate([6, 0, 0]) post();

rotate([0, 0, 0]) foot();
rotate([0, 0, 120]) foot();
rotate([0, 0, 240]) foot();

/*
color("red") rotate([0, 0, 60]) foot();
color("red") rotate([0, 0, 180]) foot();
color("red") rotate([0, 0, 300]) foot();
*/

module post() {
    color("Wheat")
    cylinder(d=1.75, h=27, $fn=100);
    
    
    translate([0, 0, 2]) support();
    translate([0, 0, 11]) support();
    translate([0, 0, 19]) support();
    translate([0, 0, 27]) support();
    
    //translate([-1, 0, 0]) cube([2, 1, 26]);
}

module support() {
    color("DarkGoldenrod")
    rotate_extrude(convexity = 10, $fn = 100)
    translate([1, 0, 0])
    circle(r = 1, $fn = 100);
    
    // Is it an option to support with hidden screws instead?
    
    //color("DarkGoldenrod") cylinder(r=1.75, h=1, $fn=100);
}
module foot() {
    color("Wheat")
    
    intersection() {
    translate([-3, 0.5, -5]) rotate([90, 0, 0]) rotate([0, 0, 120]) leaf(long=true);
        
    translate ([-50, -50, 0]) cube([100, 100, 100]);    
    }
    
    //translate([0, 0, 1.2]) rotate([0, -90, 0]) cylinder(r=1.2, h=14, $fn=100);
}

module leaf(long=false) {
    color("DarkGoldenrod")
    intersection() {
        rotate([0, 0, 0]) translate([7, 0, 0])cylinder(r=14, h=1);
        rotate([0, 0, 120]) translate([7, 0, 0])cylinder(r=14, h=1);
        if (long==false) {
            rotate([0, 0, 240]) translate([7, 0, 0])cylinder(r=14, h=1);
        }
    }
}
