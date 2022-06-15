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

//Text size
size=50;

//Height of the sign body
h=10;

//Wall width
ww=2;

//Floor height (set to -1 for open base)
fl=1.2;

//Face height
fh=1.2;

//Play for fitting face
pl=0.2;

///////////////////////////
$fn=60;

include <include/signmaker.scad>;

signbody(h=h, ww=ww, fl=fl, fh=fh, pl=pl) {
    text(text, font=font, size=size);
}
