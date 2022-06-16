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

//Face height
fh=1.2;

///////////////////////////
$fn=60;

include <include/signmaker.scad>;

signface(fh=fh) {
    text(text, font=font, size=size);
}