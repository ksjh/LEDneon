// OpenSCAD LED neon shamrock
//
// Total height: 1.5 times parameter "cd"
//

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//Clover diameter
cd = 160-rr-2*ww;

//Rounding radius
rr = 18;

///////////////////////////
$fn=60;

include <include/shapes2D.scad>;
include <include/LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
        shamrock2d(cd=cd);
}
