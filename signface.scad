// OpenSCAD sign maker (sign front face)
//
// Inspried by script in description of
// BigClive's livestream from 2022-06-11.
//
// Select the font name from the list of available fonts:
// Menu: "Help" > "Font List"
//

//Text to render
text="A";

//Font to use
font="Arial";

//Text size
size=50;

//Wall width
ww=2;

//Face depth
fh=1.2;

//Play for fitting face
pl=0.2;

///////////////////////////
$fn=60;

include <include/signmaker.scad>;

signface(ww=ww, fh=fh, pl=pl) {
    text(text, font=font, size=size);
}