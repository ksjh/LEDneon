// OpenSCAD LED neon waning moon
//

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//Moon diameter
moondia = 200-rr-2*ww;

//Fullness (0 to 1)
fullness = 0.25;

//Rounding radius
rr = 20;

///////////////////////////
$fn=60;

include <include/shapes2D.scad>;
include <include/LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
    moon2d(moondia=moondia, fullness=fullness);
}
