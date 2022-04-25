// OpenSCAD LED neon circle
//

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//Radius
r = 100 - rr / 2 - ww;

///////////////////////////
$fn=60;

include <include/shapes2D.scad>;
include <include/LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h) {
    circle(r=r);
}
