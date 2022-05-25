// OpenSCAD LED neon clover leaf
//

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//Clover leaves
n = 3;

//Clover diameter
cd = 200-rr-2*ww;

//Cloveleaf width factor
clwf = 1;

//Rounding radius
rr = 18;

///////////////////////////
$fn=60;

include <include/shapes2D.scad>;
include <include/LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
        nclover2d(n=n, cd=cd, clwf=clwf);
}
