// OpenSCAD LED neon 7 segment display connected slots
// 
// A set of connected slots for pieces of LED neon
// as segments of a 7-segment display with or
// without base plate
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

//Add a baseplate?
plate = true;

//Plate border top and bottom
btb = 5;

//Plate border left and right
blr = 5;

///////////////////////////
//Prevent planefighting
pf = 0.01;

sh=segh+2*wt;
sw=segw+2*wt;
st=segt+2*wt;

totalw = (plate?2*blr:0)+st+sw+2*segg;
totalh = (plate?2*btb:0)+st+2*sh+4*segg;
totald = segd+fl;

echo("Overall size");
echo(str("Total width:  ", totalw));
echo(str("Total height: ", totalh));
echo(str("Total depth:  ", totald));

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

module sevensegslots(mode=0) {
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

difference() {
    union() {
        sevensegslots(mode=0);
        segconn();
        if(plate) {
            translate([-st/2-blr,-st/2-btb,0])
                cube([totalw,totalh,fl-pf]);
        }
    }
    sevensegslots(mode=1);
}