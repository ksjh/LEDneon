// OpenSCAD LED neon line flame (SVG)
//
// Flame modelled in Inkscape as an open path
// after a photo of an existing LED neon sign.
// Uses another new line tracing method for
// visually closed shapes. But in reality,
// the path in the SVG file still needs to be
// open.


//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

///////////////////////////

$fn = 120;

include <include/LEDneon.scad>;

lineframe3dr(ww=ww, sw=sw, h=h, fl=fl)
    import(file="graphics/line-flame.svg");