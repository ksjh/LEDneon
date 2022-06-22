// OpenSCAD sign maker (box sign with offset)
//
// Inspried by script in description of
// BigClive's livestream from 2022-06-11.
//
// Applying an offset allows to make letters bolder.
// You can use the bolder() module in include/util.scad
// for this purpose.
// Specifying the parameter rond=true to both
// the bolder() and the makesign() modules allows
// you to round off both the (bolder) face plate
// and the sign body.
//
// The resulting sign is very similar to the
// ones created by BigClive's script in his video
// called "Make DIY custom LED signage"
//
// Select the font name from the list of available fonts:
// Menu: "Help" > "Font List"
//
// Suitable fonts might be found here:
// https://fonts.google.com/?category=Display,Handwriting

//Text to render
text="B";

//Font to use
//from: https://fonts.google.com/?category=Display,Handwriting
font="Qwigley:style=Regular";

//Text size
size=50;

//Text spacing
space=1.0;

//Height of the sign body
h=10;

//Wall width
ww=2.4;

//Floor height (set to -1 for open base)
fl=1.2;

//Face height
fh=1.2;

//Play for fitting face
pl=0.2;

//Make each letter bolder by a specified offset
bld=ww/2;

///////////////////////////
$fn=60;

include <include/signmaker.scad>;
include <include/util.scad>;

makesign(h=h, ww=ww, fl=fl, fh=fh, pl=pl, rond=true, face=false) {
    bolder(wdth=bld, rond=true)
        text(text, font=font, size=size, spacing=space);
}
