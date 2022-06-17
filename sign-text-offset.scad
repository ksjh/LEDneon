// OpenSCAD sign maker (box sign with offset)
//
// Inspried by script in description of
// BigClive's livestream from 2022-06-11.
//
// Applying an offset allows to make letters bolder.
//
// Select the font name from the list of available fonts:
// Menu: "Help" > "Font List"
//
// Suitable fonts might be found here:
// https://fonts.google.com/?category=Display,Handwriting

//Text to render
text="B";

//Font to use
//form: https://fonts.google.com/?category=Display,Handwriting
font="Qwigley:style=Regular";

//Text size
size=150;

//Text spacing
space=1.0;

//Height of the sign body
h=15;

//Make each letter bolder by a specified offset
delta=4.2;

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
    offset(delta=delta)
        text(text, font=font, size=size, spacing=space);
}
