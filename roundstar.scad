// OpenSCAD LED rounded star
//

//Rounding radius
rr = 20;

//Slot (tape) width (<rr/2)
sw = 5;

//Total height (incl. floor)
h = 10;

//Wall width
ww = 1.2;

//Floor height
fl = 1.2;

//Points of the star
points = 5;

//Star outer radius
ro= 100 - rr / 2 - ww;

//Star inner radius
ri = 30;

///////////////////////////
$fn=60;

include <shapes2D.scad>;
include <LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h) {
    star2d(points=points, ro=ro, ri=ri);
}
