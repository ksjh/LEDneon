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
// For a better alternative, take a look at
// BCDC-logo-parts-svg.scad

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

///////////////////////////

$fn = 60;

include <include/LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
    scale([3.2,3.2,1])
    import(file="graphics/BCDC.svg");
}