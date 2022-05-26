// OpenSCAD LED neon line tracing (SVG)
//
// You need to draw the graphivs or text you want to trace
// as lines of neglectable width (e.g. in Inkscape) first
// and then use the module lineframe3d to generate the
// 3D frame.
//
// Please make sure that there are no pointed angles
// between any lines. Either round them off first
// (convert them to arcs of suitable size)
// or make sure that the angles are more or less
// 90 degrees, so that you can butt two (or three)
// pieces of LED neon together at the crossing point.
//
// Also, you need to make sure you do not create a
// closed area. You need to make sure that you
// have an open path, not a closed area. At
// all corners, there should be only one single
// point. Otherwise, the transitions between the
// segments of the path might look odd.
// See "graphics/7seg.svg" for an examaple.
// This example does not have rounded corners,
// so it is not well-suited for LED neon, but
// shows the concept of a closed form represented
// as an open path. The path is open right in the
// middle of the right side. 

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

///////////////////////////

$fn = 60;

include <include/LEDneon.scad>;

lineframe3d(ww=ww, sw=sw, h=h, fl=fl)
    import(file="graphics/line-Sweet.svg");
