// OpenSCAD LED neon 7 segment display cube
// 
// A cube with slots for pieces of LED neon
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
segd = 10;

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
//Prevent planefighting
pf = 0.01;

// mode = 0: generate slots
// mode = 1: generate holes

module onesegh(mode=0) {
    if(mode==0) {
        cube([segw, segt, segd+pf]);
    } else {
        translate([hoh-segt/2,0,-pf])
            cube([segt, segt, fl+3*pf]);
    }        
}

totalw = 2*blr+segt+segw+2*segg;
totalh = 2*btb+segt+2*segh+4*segg;
totald = fl+segd;

echo("Overall size");
echo(str("Total width:  ", totalw));
echo(str("Total height: ", totalh));
echo(str("Total depth:  ", totald));

module onesegv(mode=0) {
    if(mode==0) {
        cube([segt, segh, segd+pf]);
    } else {
        translate([0,hov-segt/2,-pf])
            cube([segt, segt, fl+3*pf]);
    }
}

module sevensegslots(mode=0) {
    translate([segg,-segt/2,0])
        onesegh(mode=mode);
    translate([-segt/2,segg,0])
        onesegv(mode=mode);
    translate([segg,segh+2*segg-segt/2,0])
        onesegh(mode=mode);
    translate([-segt/2,segh+3*segg,0])
        onesegv(mode=mode);
    translate([segg,2*segh+4*segg-segt/2,0])
        onesegh(mode=mode);
    translate([segw+2*segg-segt/2,segg,0])
        onesegv(mode=mode);
    translate([segw+2*segg-segt/2,segh+3*segg,0])
        onesegv(mode=mode);
}

difference(){
    translate([-segt/2-blr,-segt/2-btb,0])
        cube([totalw,totalh,totald]);
    translate([0,0,fl+pf])
        sevensegslots(mode=0);
    sevensegslots(mode=1);
}