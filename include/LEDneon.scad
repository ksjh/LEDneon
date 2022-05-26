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

// size reduced versions, roundoff does not increase the size that
// much with these versions

module roundoff2ds(rr=20) {
    offset(r=-rr/2)
        offset(r=rr)
            offset(delta=-rr/8)
                children();
}

module genslot3ds(sw=5, rr=20, h=10) {
    linear_extrude(height=h)
        genslot2d(sw=sw)
            roundoff2ds(rr=rr)
                children();
}

module wall3ds(ww=1.2, sw=5, rr=20, h=10) {
    linear_extrude(height=h)
        offset(r=ww)
            genslot2d(sw=sw)
                roundoff2ds(rr=rr)
                    children();
}

module frame3ds(ww=1.2, sw=5, rr=20, h=10, fl=1.2) {
    difference() {
        wall3ds(ww=ww, sw=sw, rr=rr, h=h)
            children();
        translate([0,0,fl])
            genslot3ds(sw=sw, rr=rr, h=h)
                children();
    }
}

module genslot2dl(sw=5) {
    offset(delta=sw/2, chamfer=false)
        children();
}

module genslot3dl(sw=5, h=10) {
    linear_extrude(height=h)
        genslot2dl(sw=sw)
            children();
}


module wall3dl(ww=1.2, sw=5, h=10) {
    linear_extrude(height=h)
        offset(r=ww)
            genslot2dl(sw=sw)
                children();
}

module lineframe3d(ww=1.2, sw=5, h=10, fl=1.2) {
    difference() {
        wall3dl(ww=ww, sw=sw, h=h)
            children();
        translate([0,0,fl])
            genslot3dl(sw=sw, h=h)
                children();
    }
}

module genslot2dlr(sw=5) {
    offset(r=sw/2, chamfer=false)
        children();
}

module genslot3dlr(sw=5, h=10) {
    linear_extrude(height=h)
        genslot2dlr(sw=sw)
            children();
}


module wall3dlr(ww=1.2, sw=5, h=10) {
    linear_extrude(height=h)
        offset(r=ww)
            genslot2dlr(sw=sw)
                children();
}

module lineframe3dr(ww=1.2, sw=5, h=10, fl=1.2) {
    difference() {
        wall3dlr(ww=ww, sw=sw, h=h)
            children();
        translate([0,0,fl])
            genslot3dlr(sw=sw, h=h)
                children();
    }		
}
