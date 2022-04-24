// OpenSCAD LED square
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

//Size
size = 200 - rr - 2 * ww;

///////////////////////////
$fn=60;

include <shapes2D.scad>;
include <LEDneon.scad>;

translate([rr/2+ww, rr/2+ww, 0])
    frame3d(ww=ww, sw=sw, rr=rr, h=h) {
        square(size=size);
}
