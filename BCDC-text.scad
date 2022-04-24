// OpenSCAD LED neon BCDC text
//
// select the font name from the list of available fonts:
// Menu: "Help" > "Font List"

//Rounding radius
rr = 20;

//Slot (tape) width (<rr/2)
sw = 5;

//Total height (incl. floor)
h = 10;

//Wall width
ww = 1.2;

//Floor height
fl = 1.2;

//Font to use
font="Rockwell";

//Text size
size=180;

//Letter spacing
spacing=1.0;

///////////////////////////
$fn=60;

include <LEDneon.scad>;

frame3d(ww=ww, sw=sw, rr=rr, h=h) {
    text("BCDC", font=font, size=size, spacing=spacing);
}