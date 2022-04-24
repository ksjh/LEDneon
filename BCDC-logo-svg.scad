// OpenSCAD LED neon BCDC logo (SVG)
//
// Newer versions of OpenSCAD support the direct import of
// SVG files.
// Unfortunately, for sensible values of "rr", the 2D shape
// has to be scaled up so much that you cannot print it with
// commonly available 3D printers in one piece. Otherwise,
// you would lose way too many details or would create too
// sharp edges for the LED tape.
// This one here might even be printable on some printers,
// since it consists of multiple separate shapes. Just use
// intersection() with a cube to select the respective parts.
// Feel free to expriment with the parameters.

//Rounding radius
rr = 18;

//Slot (tape) width (<rr/2)
sw = 5;

//Total height (incl. floor)
h = 10;

//Wall width
ww = 1.2;

//Floor height
fl = 1.2;

///////////////////////////

$fn = 60;

include <LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h) {
    scale([3.2,3.2,1])
    import(file="BCDC.svg");
}