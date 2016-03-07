SHORT_LEG = 50;
LONG_LEG = 65;

LEG_LENTH = 3;
LEG_WIDTH = 3;

TOP_Z_OFFSET = 65;
TOP_WIDTH = 33;
TOP_DEPTH = 33;
TOP_HEIGHT = 1.5;

TOP_SUPPORT_HEIGHT = 15;

MIDDLE_Z_OFFSET = 50;  

module legs() {
	positions = [[0, 0, 0], [30, 0, 0], [0, 30, 0], [30, 30, 0]];
	heights = [SHORT_LEG, LONG_LEG, LONG_LEG, LONG_LEG];

	for (index = [0:len(positions)]) {
		translated_leg(positions[index], heights[index]);
	}
}

module composite_top() {
	composite_cube([0, 0, TOP_Z_OFFSET], [TOP_WIDTH, TOP_DEPTH, TOP_HEIGHT]);
	composite_cylinder([0, TOP_WIDTH/2, TOP_Z_OFFSET], TOP_HEIGHT, TOP_WIDTH/2);
}

module top_support() {
	
	position = [0, 15, MIDDLE_Z_OFFSET];

	color("blue")
		translated_leg(position, TOP_SUPPORT_HEIGHT);
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
	bottom_panels();
	bottom_supports();
}

module bottom_panels() {
	
	positions = [[0, 0, 25], [0, 20, 13]];
	rotations = [[-30, 0 , 0], [60, 0 , 0]];
	dimensions = [[TOP_WIDTH, 24, 1.5], [TOP_WIDTH, 15, 1.5]];

	for (index = [0:len(positions)]) {
		bottom_panel(positions[index], rotations[index], dimensions[index]);
	}
}

module bottom_panel(position, rotation, dimensions) {
	translate(position) 
		rotate(rotation) 
			cube(dimensions);
}

module bottom_supports() {
	
	positions = [[0, 0, 25], [30, 0, 25]];

	for (position = positions) {
		bottom_support(position);
	}
}

module bottom_support(position) {
	
	dimensions = [3, TOP_DEPTH, 3];
	
	translate(position) 
		cube(dimensions);
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



