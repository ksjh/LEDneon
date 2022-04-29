// OpenSCAD LED neon square
//

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//You can change the global settings for individual shapes:
//Rounding radius
rr = 20;

//Size
size = 200 - rr - 2 * ww;

///////////////////////////
$fn=60;

include <include/shapes2D.scad>;
include <include/LEDneon.scad>;

translate([rr/2+ww, rr/2+ww, 0])
    frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
        square(size=size);
}
