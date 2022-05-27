// OpenSCAD LED neon modules
// to be included in own OpenSCAD scripts
//
// Rewritten 2022-05-27 by ksjh
//
// Modes:
// 0 : normal mode for areas (closed paths)
// 1 : size-reduced version for areas (closed paths)
// 2 : line tracing for open paths (visually and technical)
// 3 : line tracing for visually closed paths (technically open)
//

module genroundoff2d(rr=20, mode=0) {
    if(mode==0) {
        offset(r=-rr/2)
            offset(r=rr)
                children();
    } else if(mode==1) {
        offset(r=-rr/2)
            offset(r=rr)
                offset(delta=-rr/8)
                    children();
    } else {
        children();
    }
}

module genslot2d(sw=5, mode=0) {
    if((mode==0) || (mode==1)) {
        difference() {
            children();
            offset(r=-sw)
                children();
        }
    } else if(mode==2) {
        offset(delta=sw/2, chamfer=false)
            children();
    } else if(mode==3) {
        offset(r=sw/2, chamfer=false)
            children();
    }
}

module genslot3d(sw=5, rr=20, h=10, mode=0) {
    linear_extrude(height=h)
        genslot2d(sw=sw, mode=mode)
            genroundoff2d(rr=rr, mode=mode)
                children();
}

module genwall3d(ww=1.2, sw=5, rr=20, h=10, mode=0) {
    linear_extrude(height=h)
        offset(r=ww)
            genslot2d(sw=sw, mode=mode)
                genroundoff2d(rr=rr, mode=mode)
                    children();
}

module genframe3d(ww=1.2, sw=5, rr=20, h=10, fl=1.2, mode=0) {
    difference() {
        genwall3d(ww=ww, sw=sw, rr=rr, h=h, mode=mode)
            children();
        translate([0,0,fl])
            genslot3d(sw=sw, rr=rr, h=h, mode=mode)
                children();
    }
}

module frame3d(ww=1.2, sw=5, rr=20, h=10, fl=1.2) {
    genframe3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl, mode=0)
        children();
}

module frame3ds(ww=1.2, sw=5, rr=20, h=10, fl=1.2) {
    genframe3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl, mode=1)
        children();
}

module lineframe3d(ww=1.2, sw=5, h=10, fl=1.2) {
    genframe3d(ww=ww, sw=sw, rr=0, h=h, fl=fl, mode=2)
        children();
}

module lineframe3dr(ww=1.2, sw=5, h=10, fl=1.2) {
    genframe3d(ww=ww, sw=sw, rr=0, h=h, fl=fl, mode=3)
        children();
}
