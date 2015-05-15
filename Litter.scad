
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

slice() 
    complete();


module slice() {
    intersection() {
        translate([0, 10, 0]) cube([400, 35, 100]);
        children();
    }
}

module complete() {
    punchedGrid(162, 1.5);
    seat();
}

module punchedGrid(size, ratio) {
    intersection() {
        translate([-size/2, -size * ratio/2, 0]) 
            grid(size, size * ratio, 4.5, 20, 1.5);
        scale([1,ratio,1]) cylinder(h=4, d=size, center = true);
    }
}

module seat() {
    skirt_height = 20;
    outter = 200;
    mid = 140;
    inner = 80;
    
    skirt(outter, 1.5, skirt_height, 1.5);
    translate([0, 0, skirt_height - 1.5]) ring(outter, mid, 1.5, 1.5);
    
    skirt(mid, 1.5, skirt_height, 1.5);
    translate([0, 0, 0]) ring(mid, inner, 1.5, 1.5);
    
}


module ring(size, hole, ratio, thickness) {
    scale([1,ratio,1])
        difference() {
            cylinder(h=thickness, r=size, $fn=100);
            translate([0, 0, -1]) cylinder(h=thickness+2, r=hole,  $fn=100);
        }
}

module skirt(size, ratio, height, thickness) {
    scale([1,ratio,1])
        difference() {
            cylinder (h = height, r=size,  $fn=100);
            translate([0, 0, -1]) cylinder (h = height+2, r=size-thickness,  $fn=100);
        };
    }



module grid(x_area, y_area, step_width, step_depth, thickness) {
    x_iterations = x_area / step_width;
    y_iteration = y_area / step_depth;
    

    for (x_index = [ 0: 1 : x_iterations ])
        for (y_index = [ 0: 1 : y_iteration ])
            gridElement(x_index * step_width, y_index * step_depth, 
                        step_width, step_depth, thickness);
    
}

//color("blue") gridElement(0, 0, 10, 10, 1.5);
//color("red") cube([1.5, 1.5, 1.5]);

module gridElement(x, y, gridWidth, gridDepth, thickness) {
        translate([x, y, 0]) 
            cube([thickness, gridDepth, thickness]);
    
    translate([x, y, 0])
        cube([gridWidth, thickness, thickness]);
}


