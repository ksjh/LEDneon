// OpenSCAD sign maker
// Example text block sign with holes for wires drilled
//

//Text to render
text="Zoom";

//Font to use
//https://fonts.google.com/specimen/Chicle
font="Chicle:style=Regular";

//Text size
size=72;

//Text spacing
space=1.05;

//Height of the sign body
h=45;

//Wall width outside
wo=5;

//Wall width inside
wi=1.2;

//Floor height (set to -1 for open base)
fl=2.4;

//Face height
fh=1.2;

//Play for fitting face
pl=0.2;

//Drill diameter
ddia=4;

//Construct face (true) or body (false)
face=false;

//Set debug to true to see the drill cylinder added,
//set it to false for final result
debug=true;

///////////////////////////
$fn=60;

include <include/signmaker.scad>;
include <include/util.scad>;

drill(debug=debug) {
    makesignio(h=h, wo=wo, wi=wi, fl=fl, fh=fh, pl=pl, face=face) {
        text(text, font=font, size=size, spacing=space);
    }
    if(!face) {
        translate([30,8.5,fl+ddia/2])
            rotate([0,90,0])
                cylinder(h=150,r=ddia/2);
        translate([183.5,5.5,-pl])
            cylinder(h=fl+2*pl,r=ddia/2);
    }
}
