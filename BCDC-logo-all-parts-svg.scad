// OpenSCAD LED neon BCDC logo all parts (SVG)
//
// Just for control purposes to see how the
// parts fit together.
// Use BCDC-logo-parts-svg.scad for 3D printing.


//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//Scaling factor
sf = 1.8;

///////////////////////////

$fn = 60;

include <include/LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
    scale([sf,sf,1])
    import(file="graphics/BCDC-part1.svg");
}

translate([24*sf,64*sf,0])
frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
    scale([sf,sf,1])
    import(file="graphics/BCDC-part2.svg");
}


translate([0,123*sf,0])
frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
    scale([sf,sf,1])
    import(file="graphics/BCDC-part3.svg");
}

translate([5*sf,167*sf,0])
frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
    scale([sf,sf,1])
    import(file="graphics/BCDC-part4.svg");
}

translate([94*sf,100*sf,0])
frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
    scale([sf,sf,1])
    import(file="graphics/BCDC-part5.svg");
}