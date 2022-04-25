// OpenSCAD LED neon BCDC logo in parts (SVG)
//
// Newer versions of OpenSCAD support the direct import of
// SVG files.
// You can use Inkscape to split the complete logo
// into individual parts to be printed separately.
// You can also modify the shapes there slightly for
// better results.
//
// This one here might even be printable on commonly
// available printers.
// Just select the part you want to print between
// 1 and 5 in the parameter "part" and create
// individual STL files.

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//Select part to print (1 to 5)
part = 1;

//Scaling factor
sf = 1.8;

///////////////////////////

$fn = 60;

include <include/LEDneon.scad>;

filename=str("graphics/BCDC-part",part,".svg");

frame3d(ww=ww, sw=sw, rr=rr, h=h) {
    scale([sf,sf,1])
    import(file=filename);
}
