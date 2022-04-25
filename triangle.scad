// OpenSCAD LED neon triangle
//

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//You can change the global settings for individual shapes:
//Rounding radius
rr = 20;

//Number of edges
n = 3;

//Radius
r = 100 - rr / 2 - ww;

///////////////////////////
$fn=60;

include <include/shapes2D.scad>;
include <include/LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h) {
    ngon2d(n=n, r=r);
}
