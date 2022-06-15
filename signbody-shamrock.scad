// OpenSCAD sign maker (shamrock sign body)
//
// Inspried by script in description of
// BigClive's livestream from 2022-06-11.
//

//Clover size
//(final size = 1.5*size + ww + 2*ext)
size = 150;


//Height of the sign body
h=10;

//Wall width
ww=2;

//Floor height
fl=1.2;

//Face depth
fh=1.2;

//Extension for creating open area
ext=2;

///////////////////////////
$fn=60;

include <include/signmaker.scad>;
include <include/shapes2d.scad>;

signbody(h=h, ww=ww, fl=fl, fh=fh) {
    offset(delta=ext)
        shamrock2d(cd=size, clwf=1.2);
}