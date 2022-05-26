// OpenSCAD LED neon 7 segment display cube
// 
// A cube with slots for pieces of LED neon
// as segments of a 7-segment display

//Height of a single vertical segment
segh = 50;

//Width of a horizontal segment
segw = 50;

//Thickness of lines of the segment
//i.e., LED neon tape width
segt = 5;

//Gap between segments
segg = 5;

//Depth of the slots
segd = 12;

//Hole offset horizontal
hoh = 25;

//Hole offset vertical
hov = 25;

//Floor height
fl = 1.2;

//Border top and bottom
btb = 15;

//Border left and right
blr = 10;

///////////////////////////
//Z-fight
zf = 0.01;

module onesegh() {
    cube([segw, segt, segd+zf]);
}

module holeh() {
    translate([hoh-segt/2,0,-zf])
        cube([segt, segt, fl+3*zf]);           
}

module onesegv() {
    cube([segt, segh, segd+zf]);
}

module holev() {
    translate([0,hov-segt/2,-zf])
        cube([segt, segt, fl+3*zf]);
}

module sevensegslots() {
    translate([segg,-segt/2,0])
        onesegh();
    translate([-segt/2,segg,0])
        onesegv();
    translate([segg,segh+2*segg-segt/2,0])
        onesegh();
    translate([-segt/2,segh+3*segg,0])
        onesegv();
    translate([segg,2*segh+4*segg-segt/2,0])
        onesegh();
    translate([segw+2*segg-segt/2,segg,0])
        onesegv();
    translate([segw+2*segg-segt/2,segh+3*segg,0])
        onesegv();
}

module drillholes() {
    translate([segg,-segt/2,0])
        holeh();
    translate([-segt/2,segg,0])
        holev();
    translate([segg,segh+2*segg-segt/2,0])
        holeh();
    translate([-segt/2,segh+3*segg,0])
        holev();
    translate([segg,2*segh+4*segg-segt/2,0])
        holeh();
    translate([segw+2*segg-segt/2,segg,0])
        holev();
    translate([segw+2*segg-segt/2,segh+3*segg,0])
        holev();
}

difference(){
    translate([-segt/2-blr,-segt/2-btb,0])
        cube([2*blr+segt+segw+2*segg,2*btb+segt+2*segh+4*segg,fl+segd]);
    translate([0,0,fl+zf])
        sevensegslots();
    drillholes();
}