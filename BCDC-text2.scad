// OpenSCAD LED neon BCDC text (size reduced extrusion)
//
// Uses extrusion method that does not increase the
// size of the letters that much, makes text more
// readable.
// Generates individual letters.
// You can play with the spacing parameter to
// change this.
//
// Select the font name from the list of available fonts:
// Menu: "Help" > "Font List"
//

//Global parameters for the dimension of the LED neon tape
include <neon-dimension.scad>

//Font to use
font="Rockwell";

//Text size
size=190;

//Rounding radius
rr=25;

//Letter spacing
spacing=1.2;

///////////////////////////
$fn=60;

include <include/LEDneon.scad>;

frame3ds(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
    text("BCDC", font=font, size=size, spacing=spacing);
}