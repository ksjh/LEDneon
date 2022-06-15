// OpenSCAD sign maker (shamrock sign body)
//
// Inspried by script in description of
// BigClive's livestream from 2022-06-11.
//

//Clover size
//(final size = 1.5*size + ww + 2*ext)
size = 100;


//Height of the sign body
h=20;

//Wall width
ww=2.4;

//Floor height
fl=1.2;

//Face depth
fh=1.2;

//Play for fitting face
pl=0.2;

//Extension for creating an open area in the middle
//of the clover leaf
ext=2;

///////////////////////////
$fn=60;

include <include/signmaker.scad>;
include <include/shapes2d.scad>;


// makesign(): A wrapper module that allows to create both
// the body and the front face of a sign using the same
// module. Set the parameter face to false to create the
// body, set it to true to create the front face.
// Just for convenience, reduces the amount of editing
// needed.
//
makesign(h=h, ww=ww, fl=fl, fh=fh, pl=pl, face=false) {
    offset(delta=ext)
        shamrock2d(cd=size, clwf=1.2);
}

%translate([0,0,h-fh])
    makesign(h=h, ww=ww, fl=fl, fh=fh, pl=pl, face=true) {
        offset(delta=ext)
            shamrock2d(cd=size, clwf=1.2);
    }