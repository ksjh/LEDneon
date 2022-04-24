// Some 2D shapes for LED neon
// to be included in own OpenSCAD scripts
//

module ngon2d(n=6, r=100) {
    delta = 360 / n;
    pp = [
        for(i = [0:n-1])
            [sin(i*delta)*r, cos(i*delta)*r] 
    ];
    polygon(pp);
}

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
