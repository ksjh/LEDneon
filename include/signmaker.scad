// OpenSCAD LED signmaker
// to be included in own OpenSCAD scripts
// inspired by BigClive's livestream from 2022-06-11.

module signbody(h=10, ww=2.4, fl=1.2, fh=1.2, pl=0.2, incha=true) {
    pf=0.001;
    difference() {
        linear_extrude(height=h)
            offset(delta=ww/2)
                children();
        translate([0,0,fl])
            linear_extrude(height=h-fl+pf)
                offset(delta=-ww/2, chamfer=incha)
                    children();
        translate([0,0,h-fh])
            linear_extrude(height=h)
                offset(delta=pl)
                    children();
    }
}

module signface(fh=1.2) {
    linear_extrude(height=fh)
        children();
}

module makesign(h=10, ww=2.4, fl=1.2, fh=1.2, pl=0.2, incha=true, face=false) {
    if(face)
        signface(fh=fh)
            children();
    else
        signbody(h=h, ww=ww, fl=fl, fh=fh, pl=pl)
            children();
}
        