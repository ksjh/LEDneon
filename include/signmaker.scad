// OpenSCAD LED signmaker
// to be included in own OpenSCAD scripts
// inspired by BigClive's livestream from 2022-06-11.

module signbodyio(h=10, wi=1.2, wo=1.2, fl=1.2, fh=1.2, pl=0.2, incha=true, rond=false) {
    pf=0.001;
    if(!rond) {
        difference() {
            linear_extrude(height=h)
                offset(delta=wo)
                    children();
            translate([0,0,fl])
                linear_extrude(height=h-fl+pf)
                    offset(delta=-wi, chamfer=incha)
                        children();
            translate([0,0,h-fh])
                linear_extrude(height=h)
                    offset(delta=pl)
                        children();
        }
    } else {
        difference() {
            linear_extrude(height=h)
                offset(r=wo)
                    children();
            translate([0,0,fl])
                linear_extrude(height=h-fl+pf)
                    offset(r=-wi, chamfer=incha)
                        children();
            translate([0,0,h-fh])
                linear_extrude(height=h)
                    offset(delta=pl)
                        children();
        }
    }
}

module signbody(h=10, ww=2.4, fl=1.2, fh=1.2, pl=0.2, incha=true, rond=false) {
    signbodyio(h=h, wi=ww/2, wo=ww/2, fl=fl, fh=fh, pl=pl, incha=incha, rond=rond)
        children();
}

module signface(fh=1.2) {
    linear_extrude(height=fh)
        children();
}

module makesignio(h=10, wi=1.2, wo=1.2, fl=1.2, fh=1.2, pl=0.2, incha=true, rond=false, face=false) {
    if(face)
        signface(fh=fh)
            children();
    else
        signbodyio(h=h, wi=wi, wo=wo, fl=fl, fh=fh, pl=pl, incha=incha, rond=rond)
            children();
}

module makesign(h=10, ww=2.4, fl=1.2, fh=1.2, pl=0.2, incha=true, rond=false, face=false) {
    makesignio(h=h, wi=ww/2, wo=ww/2, fl=fl, fh=fh, pl=pl, incha=incha, rond=rond, face=face)
        children();
}
