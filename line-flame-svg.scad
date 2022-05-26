// OpenSCAD LED neon line flame (SVG)
//
// Flame modelled in Inkscape as an open path
// after a photo of an existing LED neon sign.

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

///////////////////////////

$fn = 120;

include <include/LEDneon.scad>;

lineframe3d(ww=ww, sw=sw, h=h, fl=fl)
    import(file="graphics/line-flame.svg");
