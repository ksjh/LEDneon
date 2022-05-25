// OpenSCAD LED neon line tracing (SVG)
//
// You need to draw the graphivs or text you want to trace
// as lines of neglectable width (e.g. in Inkscape) first
// and then use the module lineframe3d to generate the
// 3D frame. 
// Please make sure that there are no pointed angles
// between any lines. Either round them off first
// (convert them to arcs of suitable size)
// or make sure that the angles are more or less
// 90 degrees, so that you can butt two (or three)
// pieces of LED neon together at the crossing point.

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

///////////////////////////

$fn = 60;

include <include/LEDneon.scad>;

lineframe3d(ww=ww, sw=sw, h=h, fl=fl)
    import(file="graphics/line-Sweet.svg");
