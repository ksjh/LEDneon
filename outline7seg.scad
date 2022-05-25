// OpenSCAD LED neon upright 7 segment display outlines
// 
// The segments are intended to be printed separately
// for really large seven segment displays.

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//Height of a single vertical segment
segh = 200-rr-2*ww;

//Width of a horizontal segment
segw = 200-rr-2*ww;

//Thickness of lines of the segment 
segt = 50-rr-2*ww;

//Gap between segments
//(not needed for printing individual segments)
segg=20;

///////////////////////////
$fn=60;

include <include/shapes2D.scad>;
include <include/LEDneon.scad>;

translate([segg,0,0])
    frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl)
        seg7uh2d(segw=segw, segt=segt);
translate([0,segg,0])
    frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl)
        seg7uv2d(segh=segh, segt=segt);
translate([segg,segh+2*segg,0])
    frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl)
        seg7uh2d(segw=segw, segt=segt);
translate([0,segh+3*segg,0])
    frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl)
        seg7uv2d(segh=segh, segt=segt);
translate([segg,2*segh+4*segg,0])
    frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl)
        seg7uh2d(segw=segw, segt=segt);
translate([segw+2*segg,segg,0])
    frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl)
        seg7uv2d(segh=segh, segt=segt);
translate([segw+2*segg,segh+3*segg,0])
    frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl)
        seg7uv2d(segh=segh, segt=segt);
