# LEDneon
OpenSCAD scripts for LED neon strip

Inspired by bigclive.com

Just some scripts to create 3D printed frames for LED neon stips from 2D objects in OpenSCAD.
Also works with text, but make sure the rounding radius is suitable.

Theoretically, you can vectorize bitmaps in Inkscape, convert the resulting object to a path, then convert all segments of the path to lines and export a DXF file which can be imported into OpenSCAD. Unfortunately, for sensible values of "rr", most 2D shapes have to be scaled up so much that you cannot print them with commonly available 3D printers in one piece. Otherwise, you would lose way too many details or would create too sharp edges for the LED tape.

Newer versions of OpenSCAD also support the direct import of SVG files without the need to convert all segments of the paths to lines.

Some shapes might even be printable on common printers when they consist of multiple separate shapes. Just use intersection() with a cube to select the respective parts.
