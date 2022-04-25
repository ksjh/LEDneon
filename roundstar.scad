// OpenSCAD LED neon rounded star
//

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//You can change the global settings for individual shapes:
//Rounding radius
rr = 20;

//Points of the star
points = 5;

//Star outer radius
ro= 100 - rr / 2 - ww;

//Star inner radius
ri = 30;

///////////////////////////
$fn=60;

include <include/shapes2D.scad>;
include <include/LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h) {
    star2d(points=points, ro=ro, ri=ri);
}
