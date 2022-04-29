// OpenSCAD LED neon BCDC text (size reduced extrusion)
//
// Unfortunately, the resulting shape is too large for most printers,
// so you need to print individual letters separately.
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

//Letter spacing
spacing=1.1;

///////////////////////////
$fn=60;

include <include/LEDneon.scad>;

frame3ds(ww=ww, sw=sw, rr=rr, h=h, fl=fl) {
    text("BCDC", font=font, size=size, spacing=spacing);
}