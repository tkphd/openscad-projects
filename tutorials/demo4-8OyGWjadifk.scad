// OpenSCAD demo after https://www.youtube.com/watch?v=ZUoBw1WR1S0
$fn=128;

rotate_extrude() translate([4, 0, 0]) circle(r=1);

rotate_extrude() {
    polygon( points=[[0,0],[2,1],[1,2],[1,3],[3,4],[0,5]] );
}
