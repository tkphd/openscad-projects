// OpenSCAD demo after https://www.youtube.com/watch?v=sw3I1xxjMWE
$fn=64;

// Simple plate with a hole
/*
difference() {
    cube([5, 5, 1]);
    translate([2.5, 2.5, -0.1]) {
        cylinder(r=1, h=1.2);
    }
}
*/

// Module: name an object
module plate(l, w, h) {
difference() {
        cube([l, w, h]);
        translate([l/2, w/2, -0.1]) {
            cylinder(r=0.5, h=h+.2);
        }
    }
}

/*
rotate(a=60, v=[1, 1, 1]) {
    translate ([-3, -3, 0]) {
        plate();
    }
}
*/

// Scaling
plate(5, 5, 1);

// OpenSCAD demo after https://www.youtube.com/watch?v=6gBMm6r28vM
module bracket(l, w, h) {
    plate(l, w, h);
    rotate(a=90, v=[1, 0, 0]) {
        plate(l, w+h, h);
    }
}

translate([12, 0, 0]) {
    bracket(5, 5, 1);
}