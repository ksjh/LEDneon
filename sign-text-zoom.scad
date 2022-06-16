// OpenSCAD sign maker (Zoom call alert sign)
//
// Inspried by script in description of
// BigClive's livestream from 2022-06-11.
//
//
// Select the font name from the list of available fonts:
// Menu: "Help" > "Font List"
//

//Text to render
text="Zoom";

//Font to use
font="Arial:style=Bold";

//Text size
size=60;

//Text spacing
space=0.8;

//Height of the sign body
h=20;

//Wall width
ww=2.4;

//Floor height (set to -1 for open base)
fl=1.2;

//Face height
fh=1.2;

//Play for fitting face
pl=0.2;

///////////////////////////
$fn=60;

include <include/signmaker.scad>;

makesign(h=h, ww=ww, fl=fl, fh=fh, pl=pl, face=false) {
    text(text, font=font, size=size, spacing=space);
}
