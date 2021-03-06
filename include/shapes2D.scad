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

module heart2d(w=160, h=160) {
    r=w/4;
    m1x=-r;
    m1y=h-r;
    m2x=-m1x;
    m2y=m1y;
    qx=0;
    qy=0;
    mq1=sqrt((m1x-qx)^2+(m1y-qy)^2);
    mq2=sqrt((m2x-qx)^2+(m2y-qy)^2);
    // calculate tangents
    s1x=m1x+(r^2/mq1^2)*(qx-m1x)-sqrt(mq1^2-r^2)*(r/mq1^2)*(-qy+m1y);
    s1y=m1y+(r^2/mq1^2)*(qy-m1y)-sqrt(mq1^2-r^2)*(r/mq1^2)*(qx-m1x);
    s2x=m2x+(r^2/mq2^2)*(qx-m2x)+sqrt(mq2^2-r^2)*(r/mq2^2)*(-qy+m2y);
    s2y=m2y+(r^2/mq2^2)*(qy-m2y)+sqrt(mq2^2-r^2)*(r/mq2^2)*(qx-m2x);
	union() {
        translate([m1x,m1y,0])
            circle(r=r);
        translate([m2x,m2y,0])
            circle(r=r);
        polygon([[qx,qy],[s1x,s1y],[m1x-r,m1y],[m2x+r,m2y],[s2x,s2y]]);
    }
}

module moon2d(moondia=160, fullness=0.25) {
    difference() {
        circle(d=moondia);
        translate([fullness*moondia,0,0])
            circle(d=moondia);
    }
}

module nclover2d(n=3, cd=200, clwf=1) {
    rotate([0,0,(1-n%2)*180/n])
        for(i=[0:n-1]) {
            rotate([0,0,i*360/n])
            heart2d(w=clwf*cd/2, h=cd/2);
        }
}

module shamrock2d(cd=200, clwf=1) {
    nclover2d(n=3, cd=cd, clwf=clwf);
    rotate([0,0,45/3])
        intersection() {
            translate([-cd,0,0])
                difference() {
                    circle(d=2*cd);
                    translate([0,0.05*2*cd,0])
                    circle(d=2*cd);
                }
            circle(d=1.5*cd);
        }
}

module seg7uh2d(segw=200, segt=40) {
    polygon(points=[[0,0],[segt/2,segt/2],[segw-segt/2,segt/2],[segw,0],[segw-segt/2,-segt/2],[segt/2,-segt/2]]);
}

module seg7uv2d(segh=200, segt=40) {
    polygon(points=[[0,0],[segt/2,segt/2],[segt/2,segh-segt/2],[0,segh],[-segt/2,segh-segt/2],[-segt/2,segt/2]]);
}
