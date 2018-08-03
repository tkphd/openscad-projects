// OpenSCAD demo after https://www.youtube.com/watch?v=eq5ObNeiAUw

// Surface facets
$fn=32;

// Primitives
// cube(3);
// sphere(3);
// cylinder(h=2, r=1);

// Combinations
// union()
// difference()
/*
intersection()
{
    cube([6, 6, 6], center=true);
    cylinder(h=3, r=3.5);
}
*/

// Modifications
// translate([1, 1, 5])
/*
scale(1.2)
{
    cube([5,5,1], center=true);
}
*/

// Exercise 1
translate([-4.5, 0, 0]) {
    color([1, 0, 0]) {
        cube([3, 3, 3], center=true);
    }
}
translate([0, 0, 0]) {
    color([0, 1, 0]) {
        cylinder(h=3, r=1.5);
    }
}
translate([4.5, 0, 1.5]) {
    color([0, 0, 1]) {
        sphere(1.5);
    }
}

// Exercise 2a
translate([8, 8, 0]) {
    color([1, 0, 0]) {
        difference() {
            cube(8, center=true);
            sphere(4);
        }
    }   
}

// Exercise 2b
translate([-8, 8, 0]) {
    color([0, 1, 0]) {
        difference() {
            sphere(4.125);
            cube(8, center=true);
        }
    }
}