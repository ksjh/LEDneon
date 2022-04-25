// OpenSCAD LED neon BCDC logo (DXF)
//
// Theoretically, you can vectorize bitmaps in Inkscape,
// convert the resulting object to a path, then convert all
// segments of the path to lines and export a DXF file which
// can be imported into OpenSCAD.
// Unfortunately, for sensible values of "rr", the 2D shape
// has to be scaled up so much that you cannot print it with
// commonly available 3D printers in one piece. Otherwise,
// you would lose way too many details or would create too
// sharp edges for the LED tape.
// This one here might even be printable on some printers,
// since it consists of multiple separate shapes. Just use
// intersection() with a cube to select the respective parts.
// Feel free to expriment with the parameters.

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>


///////////////////////////

$fn = 60;

include <include/LEDneon.scad>;

translate([-240,85,0])
    frame3d(ww=ww, sw=sw, rr=rr, h=h) {
        scale([12,12,1])
        import(file="graphics/BCDC.dxf");
    }