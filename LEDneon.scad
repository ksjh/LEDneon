// OpenSCAD LED neon modules
// to be included in own OpenSCAD scripts
//

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
