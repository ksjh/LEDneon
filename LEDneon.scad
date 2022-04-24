// OpenSCAD LED neon modules
//

//Rounding radius
rr = 20;

//Slot (tape) width (<rr/2)
sw = 5;

//Total height (incl. floor)
h = 10;

//Wall width
ww = 1.2;

//Floor height
fl = 1.2;

//Points of the star
points = 5;

//Star outer radius
ro= 100 - rr / 2 - ww;

//Star inner radius
ri = 30;

///////////////////////////

$fn = 60;

module star2d(points=5, ro=100, ri=30) {
    delta = 180 / points;
    rd = ro - ri;
    pp = [
        for(i = [0:2*points-1])
            [sin(i*delta)*(ro-rd*(i%2)), cos(i*delta)*(ro-rd*(i%2))] 
    ];
    polygon(pp);
}

module letterC2d(ro=100, ri=70) {
    difference() {
        circle(r=ro);
        circle(r=ri);
        rotate([0,0,-45])
            square(ro);
    }
}

module letterO2d(ro=100, ri=70) {
    difference() {
        circle(r=ro);
        circle(r=ri);
    }
}

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

// select the font name from the list of available fonts:
// Menu: "Help" > "Font List"

//frame3d(ww=ww, sw=sw, rr=rr, h=h) {
//    text("BCDC", font="Rockwell", size=180, spacing=1);
//}

frame3d(ww=ww, sw=sw, rr=rr, h=h) {
    star2d(points=points, ro=ro, ri=ri);
}
