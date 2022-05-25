// OpenSCAD LED neon line tracing (SVG)
//

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

///////////////////////////

$fn = 60;

include <include/LEDneon.scad>;

lineframe3d(ww=ww, sw=sw, h=h, fl=fl)
    import(file="graphics/line-Sweet.svg");
