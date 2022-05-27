// OpenSCAD LED neon 7 segment display plate
// 
// A plate with slots for pieces of LED neon
// as segments of a 7-segment display
//
// ATTENTION:
// This is not a classic LEDneon frame and
// DOES *NOT* USE THE CENTRAL CONFIG FILE
/////////////////////////////////////////////////////////

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
segd = 6;

//Hole offset horizontal
hoh = 25;

//Hole offset vertical
hov = 25;

//Floor height
fl = 2.4;

//Slot wall thickness
wt = 1.2;

//Border top and bottom
btb = 5;

//Border left and right
blr = 5;

///////////////////////////
//Prevent planefighting
pf = 0.01;

sh=segh+2*wt;
sw=segw+2*wt;
st=segt+2*wt;

// mode = 0: generate slots
// mode = 1: generate holes

module onesegh(mode=0) {
    if(mode==0) {
        difference() {
            cube([segw+2*wt, segt+2*wt, segd+fl]);
            translate([wt,wt,fl])
                cube([segw, segt, segd+pf]);
        }
    } else {
        translate([wt+hoh-segt/2,wt,-pf])
            cube([segt, segt, fl+2*pf]);
    }
}

module onesegv(mode=0) {
    if(mode==0) {
        difference() {
            cube([segt+2*wt, segh+2*wt, segd+fl]);
            translate([wt,wt,fl])
                cube([segt, segh, segd+pf]);
        }
    } else {
        translate([wt,wt+hov-segt/2,-pf])
            cube([segt, segt, fl+2*pf]);
    }
}

module sevensegplate(mode=0) {
    translate([segg,-st/2,0])
        onesegh(mode=mode);
    translate([-st/2,segg,0])
        onesegv(mode=mode);
    translate([segg,sh+2*segg-st/2,0])
        onesegh(mode=mode);
    translate([-st/2,sh+3*segg,0])
        onesegv(mode=mode);
    translate([segg,2*sh+4*segg-st/2,0])
        onesegh(mode=mode);
    translate([sw+2*segg-st/2,segg,0])
        onesegv(mode=mode);
    translate([sw+2*segg-st/2,sh+3*segg,0])
        onesegv(mode=mode);
    if(mode==0) {
        translate([-st/2-blr,-st/2-btb,0])
            cube([2*blr+st+sw+2*segg,2*btb+st+2*sh+4*segg,fl-pf]);
    }
}

difference() {
    sevensegplate(mode=0);
    sevensegplate(mode=1);
}