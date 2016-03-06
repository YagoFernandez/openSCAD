SHORT_LEG = 50;
LONG_LEG = 65;

LEG_LENTH = 3;
LEG_WIDTH = 3;

TOP_Z_OFFSET = 65;
TOP_WIDTH = 33;
TOP_DEPTH = 33;
TOP_HEIGHT = 1.5;

MIDDLE_Z_OFFSET = 50;  

module legs() {
	translated_leg([0, 0, 0]);
	translated_leg([30, 0, 0], LONG_LEG);
	translated_leg([0, 30, 0], LONG_LEG);
	translated_leg([30, 30, 0], LONG_LEG);
}

module composite_top() {
	composite_cube([0, 0, TOP_Z_OFFSET], [TOP_WIDTH, TOP_DEPTH, TOP_HEIGHT]);
	composite_cylinder([0, TOP_WIDTH/2, TOP_Z_OFFSET], TOP_HEIGHT, TOP_WIDTH/2);
}

module top_support() {
	color("blue")
		translated_leg([0, 15, 50], 15);
} 

module composite_middle() {
	composite_cube([0, 0, MIDDLE_Z_OFFSET], [TOP_WIDTH, TOP_DEPTH, TOP_HEIGHT]);
	composite_cylinder([TOP_WIDTH/2, 0, MIDDLE_Z_OFFSET], TOP_HEIGHT, TOP_WIDTH/2);
}

module composite_cube(position, dimensions) {
	translate(position) 
		cube(dimensions);
}

module composite_cylinder(position, heigth, radius) {
	translate(position) 
		cylinder(h=heigth, r=radius);
}

module slanted_bottom() {
	translate([0, 0, 25]) rotate([-30, 0 , 0]) cube([33, 24, 1.5]);
	translate([0, 20, 13]) rotate([60, 0 , 0]) cube([33, 15, 1.5]);
	translate([0, 0, 25]) cube([3, 33, 3]);
	translate([30, 0, 25]) cube([3, 33, 3]);
}

module translated_leg(position, height=SHORT_LEG) {
	translate(position) 
		leg(height);		
}

module leg(height=SHORT_LEG) {
	cube([LEG_LENTH, LEG_WIDTH, height]);	
}

legs(); 

composite_top();
top_support();

composite_middle();

slanted_bottom();



