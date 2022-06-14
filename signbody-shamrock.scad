// OpenSCAD sign maker (sign body)
//
// Inspried by script in description of
// BigClive's livestream from 2022-06-11.
//
//
// Select the font name from the list of available fonts:
// Menu: "Help" > "Font List"
//

//Text to render
text="A";

//Font to use
font="Arial";


// Clover size
// final size = 1.5 * size + 2*ww + 2*ext
size = 150;


//Height of the sign body
h=10;

//Wall width
ww=2;

//Floor height
fl=1.2;

//Face depth
fh=1.2;

//Extension for open area
ext=1;

///////////////////////////
$fn=60;

include <include/signmaker.scad>;
include <include/shapes2d.scad>;

signbody(h=h, ww=ww, fl=fl, fh=fh) {
    offset(delta=ext)
        shamrock2d(cd=size);
}