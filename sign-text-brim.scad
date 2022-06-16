// OpenSCAD sign maker (text sign with brim)
//
// Inspried by script in description of
// BigClive's livestream from 2022-06-11.
//
//
// Select the font name from the list of available fonts:
// Menu: "Help" > "Font List"
//

//Text to render
text="Air";

//Font to use
font="Roboto Slab:style=Bold";

//Text size
size=90;

//Text spacing
space=1.0;

//Height of the sign body
h=20;

//Wall width
ww=2.8;

//Floor height (set to -1 for open base)
fl=2.4;

//Face height
fh=1.2;

//Play for fitting face
pl=0.2;

//Create face (true) or body (false)
face=false;

//brim width to hold letters together
brim=8;

///////////////////////////
$fn=60;

pf=0.01;

include <include/signmaker.scad>;

makesign(h=h, ww=ww, fl=fl, fh=fh, pl=pl, face=face) {
    text(text, font=font, size=size, spacing=space);
}
if(!face) {
    linear_extrude(fl-pf)
        offset(delta=brim, chamfer=true)
            text(text, font=font, size=size, spacing=space);
}