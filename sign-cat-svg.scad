// OpenSCAD sign maker (cat SVG sign)
//
// Inspried by script in description of
// BigClive's livestream from 2022-06-11.
//

//Scale factor
sf = 0.3;


//Height of the sign body
h=20;

//Wall width
ww=2.4;

//Floor height
fl=1.2;

//Face height
fh=1.2;

//Play for fitting face
pl=0.2;

///////////////////////////
$fn=60;

include <include/signmaker.scad>;

// makesign(): A wrapper module that allows to create both
// the body and the front face of a sign using the same
// module. Set the parameter face to false to create the
// body, set it to true to create the front face.
// Just for convenience, reduces the amount of editing
// needed.
//
makesign(h=h, ww=ww, fl=fl, fh=fh, pl=pl, face=false) {
    scale([sf,sf,1])
        import(file="graphics/Cat_silhouette.svg");
}
