// OpenSCAD LED neon BCDC logo
//
// Theoretically, you can vectorize bitmaps in Inkscape,
// convert the resulting object to a path, then convert all
// segments of the path to lines and export a DXF file which
// can be imported into OpenSCAD.
// Unfortunately, for sensible values of "rr", the 2D shape
// has to be scaled up so much that you cannot print it with
// commonly available 3D printers in one piece. Otherwise,
// you would lose way to many details or would create too sharp
// edges for the LED tape.
// This one here might even be printable on some printers,
// since it consists of multiple separate shapes. Just use
// intersection() with a cube to select the respective parts.
// Feel free to expriment with the parameters.

//Rounding radius
rr = 18;

//Slot (tape) width (<rr/2)
sw = 5;

//Total height (incl. floor)
h = 10;

//Wall width
ww = 1.2;

//Floor height
fl = 1.2;

///////////////////////////

$fn = 60;

module roundoff2d(rr=20) {
    offset(r=-rr/2)
        offset(r=rr)
            children();
}

module genslot2d(sw=5) {
    difference() {
        children();
        offset(r=-sw)
            children();
    }
}

module genslot3d(sw=5, rr=20, h=10) {
    linear_extrude(height=h)
        genslot2d(sw=sw)
            roundoff2d(rr=rr)
                children();
}

module wall3d(ww=1.2, sw=5, rr=20, h=10) {
    linear_extrude(height=h)
        offset(r=ww)
            genslot2d(sw=sw)
                roundoff2d(rr=rr)
                    children();
}

module frame3d(ww=1.2, sw=5, rr=20, h=10, fl=1.2) {
    difference() {
        wall3d(ww=ww, sw=sw, rr=rr, h=h)
            children();
        translate([0,0,fl])
            genslot3d(sw=sw, rr=rr, h=h)
                children();
    }
}

frame3d(ww=ww, sw=sw, rr=rr, h=h) {
    scale([12,12,1])
    import(file="BCDC.dxf");
}