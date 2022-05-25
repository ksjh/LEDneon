// OpenSCAD LED neon clover leaf
//

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//Heart width
hw = 160-rr-2*ww;

//Heart height
hh = 140-rr-2*ww;

//Rounding radius
rr = 20;

///////////////////////////
$fn=60;

include <include/shapes2D.scad>;
include <include/LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
    heart2d(w=hw, h=hh);
}
