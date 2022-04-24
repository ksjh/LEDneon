// OpenSCAD LED triangle
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

//Number of edges
n = 3;

//Radius
r = 100 - rr / 2 - ww;

///////////////////////////
$fn=60;

include <shapes2D.scad>;
include <LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h) {
    ngon2d(n=n, r=r);
}
