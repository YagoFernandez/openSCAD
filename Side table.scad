
MIN_FACET = 0.1;
MAX_ANGLE = 5;

SHORT_LEG = 50;
LONG_LEG = 65;

$fs = MIN_FACET;  
$fa = MAX_ANGLE;    

legs();

module legs() {
	translated_leg([0, 0, 0]);
	translated_leg([30, 0, 0], LONG_LEG);
	translated_leg([0, 30, 0], LONG_LEG);
	translated_leg([30, 30, 0], LONG_LEG);
}

// top
translate([0, 0, 65]) cube([33, 33, 1.5]);
translate([0, 33/2, 65]) cylinder(h=1.5, r=33/2);

top_support();

module top_support() {
	color("blue")
		translated_leg([0, 15, 50], 15);
} 
 


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

module translated_leg(position, height=SHORT_LEG) {
	translate(position) 
		leg(height);		
}

module leg(height=SHORT_LEG) {
	cube([3, 3, height]);	
}

