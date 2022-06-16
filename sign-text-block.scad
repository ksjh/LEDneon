// OpenSCAD sign maker (text block sign)
//
// Inspried by script in description of
// BigClive's livestream from 2022-06-11.
//
// You can specify the inner and outer wall
// width separately.
//
// Select the font name from the list of available fonts:
// Menu: "Help" > "Font List"
//

//Text to render
text="ZOOM";

//Font to use
font="Arial:style=Bold";

//Text size
size=50;

//Text spacing
space=1.0;

//Height of the sign body
h=30;

//Wall width outside
wo=5.2;

//Wall width inside
wi=1.2;

//Floor height (set to -1 for open base)
fl=1.2;

//Face height
fh=1.2;

//Play for fitting face
pl=0.2;

///////////////////////////
$fn=60;

include <include/signmaker.scad>;

makesignio(h=h, wo=wo, wi=wi, fl=fl, fh=fh, pl=pl, face=false) {
    text(text, font=font, size=size, spacing=space);
}
