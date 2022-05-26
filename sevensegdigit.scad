// OpenSCAD LED neon 7 segment display connected slots
// 
// A set of connected slots for pieces of LED neon
// as segments of a 7-segment display

//Height of a single vertical segment
segh = 50;

//Width of a horizontal segment
segw = 50;

//Thickness of lines of the segment
//i.e., LED neon tape width
segt = 5;

//Gap between segments
segg = 6;

//Depth of the slots
segd = 10;

//Floor height
fl = 2.4;

//Slot wall thickness
wt = 2.4;

//Connector thinckness
ct = segd + fl;

//Hole offset horizontal
hoh = 25;

//Hole offset vertical
hov = 25;

///////////////////////////
//Prevent planefighting
pf = 0.01;

sh=segh+2*wt;
sw=segw+2*wt;
st=segt+2*wt;

module onesegh() {
    difference() {
        cube([segw+2*wt, segt+2*wt, segd+fl]);
        translate([wt,wt,fl])
            cube([segw, segt, segd+pf]);
    }

}

module holeh() {
    translate([wt+hoh-segt/2,wt,-pf])
        cube([segt, segt, fl+2*pf]);           
}

module onesegv() {
    difference() {
        cube([segt+2*wt, segh+2*wt, segd+fl]);
        translate([wt,wt,fl])
            cube([segt, segh, segd+pf]);
    }
}

module holev() {
    translate([wt,wt+hov-segt/2,-pf])
        cube([segt, segt, fl+2*pf]);
}

module sevensegslots() {
    translate([segg,-st/2,0])
        onesegh();
    translate([-st/2,segg,0])
        onesegv();
    translate([segg,sh+2*segg-st/2,0])
        onesegh();
    translate([-st/2,sh+3*segg,0])
        onesegv();
    translate([segg,2*sh+4*segg-st/2,0])
        onesegh();
    translate([sw+2*segg-st/2,segg,0])
        onesegv();
    translate([sw+2*segg-st/2,sh+3*segg,0])
        onesegv();
}

module segconn() {
    linear_extrude(height=ct) {
        polygon([[-st/2,segg],[st/2,segg],[segg,st/2],[segg,-st/2]]);
        polygon([[2*segg+sw-st/2,segg],[2*segg+sw+st/2,segg],[segg+sw,-st/2],[segg+sw,st/2]]);
        polygon([[-st/2,segg+sh],[segg-st/2,2*segg+sh],[-st/2,sh+3*segg],[st/2,sh+3*segg],[segg,2*segg+sh+st/2],[segg,2*segg+sh-st/2],[st/2,segg+sh]]);
        polygon([[-st/2,2*sh+3*segg],[st/2,2*sh+3*segg],[segg,4*segg+2*sh-st/2],[segg,4*segg+2*sh+st/2]]);
        polygon([[segg+sw,4*segg+2*sh-st/2],[segg+sw,4*segg+2*sh+st/2],[2*segg+sw+st/2,2*sh+3*segg],[2*segg+sw-st/2,2*sh+3*segg]]);
        polygon([[2*segg+sw-st/2,segg+sh],[segg+sw,2*segg+sh-st/2],[segg+sw,2*segg+sh+st/2],[2*segg+sw-st/2,sh+3*segg],[2*segg+sw+st/2,sh+3*segg],[segg+sw+st/2,2*segg+sh],[2*segg+sw+st/2,segg+sh]]);
    }
}

module drillholes() {
    translate([segg,-st/2,0])
        holeh();
    translate([-st/2,segg,0])
        holev();
    translate([segg,sh+2*segg-st/2,0])
        holeh();
    translate([-st/2,sh+3*segg,0])
        holev();
    translate([segg,2*sh+4*segg-st/2,0])
        holeh();
    translate([sw+2*segg-st/2,segg,0])
        holev();
    translate([sw+2*segg-st/2,sh+3*segg,0])
        holev();
}

difference() {
    union() {
        sevensegslots();
        segconn();
    }
    drillholes();
}