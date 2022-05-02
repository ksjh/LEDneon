// OpenSCAD LED neon heart
//

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//Radius
r = 40;

//Rounding radius
rr = 20;

///////////////////////////
$fn=60;

include <include/shapes2D.scad>;
include <include/LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
    m1x=-r;
    m1y=2.5*r;
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
    translate([m1x,m1y,0])
        circle(r=r);
    translate([m2x,m2y,0])
        circle(r=r);
    polygon([[qx,qy],[s1x,s1y],[m1x+r,m1y],[m2x+r,m2y],[s2x,s2y]]);
}
 