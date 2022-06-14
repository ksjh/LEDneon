// OpenSCAD LED signmaker
// to be included in own OpenSCAD scripts
// inspired by bigclivelive stream 2022-06-11

module signbody(h=10, ww=2.4, fl=1.2, fh=1.2) {
    difference() {
        linear_extrude(height=h)
            offset(delta=ww)
                children();
        translate([0,0,fl])
            linear_extrude(height=h)
                children();
        translate([0,0,h-fh])	
            linear_extrude(height=h)
                offset(delta=ww/2)
                    children();
    }
}

module signface(ww=2.4, fh=1.2, pl=0.2) {
    linear_extrude(height=fh)
        offset(delta=ww/2-pl)
            children();
}
