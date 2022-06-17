# LEDneon
OpenSCAD scripts for LED neon strip

Inspired by [bigclive.com](http://bigclive.com/)

Just some scripts to create 3D printed frames for LED neon stips from 2D objects in OpenSCAD.
Also works with text, but make sure the rounding radius `rr` is suitable.

You can vectorize bitmaps in Inkscape, save the result as an SVN file and create LED neon frames from them. Unfortunately, for sensible values of `rr`, some 2D shapes have to be scaled up so much that you cannot print them with commonly available 3D printers in one piece. Otherwise, you would lose way too many details or would create too sharp edges for the LED tape. Some shapes work, however. Sometimes, it may make sense to print individual parts of the shapes individually. 

There are some scripts to create frames from text. The most viable approach might be to print single letters separately, not complete words. Another approach is to draw the (handwritten) text as thin lines in an SVG file and then use the line tracing module to generate frames.

The project also includes scripts to create box and lid style signs, inspired by BigClive's script in the description of his livestream on 2022-06-11. These signs are not intended for LED neon, but for fitting normal LEDs or (flat) LED tape inside. They work both with text, most 2D shapes, and imported SVG files. The examples for those do not use the central configuration file.

## Files
- [`neon-dimension.scad`](neon-dimension.scad): the central configuration file for global parameters like the size of the LED neon strip
- [`roundstar.scad`](roundstar.scad): a star with rounded angles (this is how this little project started)
- [`circle.scad`](circle.scad): a simple circle
- [`square.scad`](square.scad): a simple square
- [`hexagon.scad`](hexagon.scad): a simple hexagon
- [`triangle.scad`](triangle.scad): a simple triangle
- [`heart.scad`](heart.scad): a heart shape, inspired by discord user *Engineer_Nelfar*
- [`moon.scad`](moon.scad): a waning moon shape
- [`clover.scad`](clover.scad): a clover shape
- [`shamrock.scad`](shamrock.scad): a shamrock shape (clover with stem)
- [`BCDC-text.scad`](BCDC-text.scad): a script to render text
- [`BCDC-text2.scad`](BCDC-text2.scad): a script to render text clearer, uses extrusion method that does increase the size of the letters less. [Stencil fonts](https://fonts.google.com/?query=stencil) like in the [official BCDC merch](http://bigclive.com/merch.htm) still do not work as expected at reasonable sizes of the letters.
- [`BCDC-logo-dxf.scad`](BCDC-logo-dxf.scad): a script to generate frames from a DXF graphics file (old method)
- [`BCDC-logo-svg.scad`](BCDC-logo-svg.scad): a script to generate frames from an SVG graphics file (new method)
- [`BCDC-logo-parts-svg.scad`](BCDC-logo-parts-svg.scad): a script to generate 3D printable frames that form parts of a logo from separate SVG graphics files
- [`BCDC-logo-all-parts-svg.scad`](BCDC-logo-all-parts-svg.scad): a script that displays a logo that is composed of multiple parts, just for control purposes
- [`line-tracing-svg.scad`](line-tracing-svg.scad): generate 3D frames for LED neon from lines (e.g., handwritten text) in an SVG file
- [`line-flame-svg.scad`](line-flame-svg.scad): a flame generated using line tracing from an SVG path
- [`outline7seg.scad`](outline7seg.scad): generate outlines for large seven segment displays
- [`sevensegcube.scad`](sevensegcube.scad): a cube with slots for pieces of LED neon as segments of a 7-segment display, **does not use the central config file**
- [`sevensegplate.scad`](sevensegplate.scad): a plate with slots for pieces of LED neon as segments of a 7-segment display, **does not use the central config file**
- [`sevensegdigit.scad`](sevensegdigit.scad): a set of connected slots for one digit of a 7-segment display, **does not use the central config file**
- [`signbody.scad`](signbody.scad): the body of a sign, inspired by BigClive's script in the description of his livestream on 2022-06-11, **not for LED neon, does not use the central config file**
- [`signface.scad`](signface.scad): the front face of a sign, inspired by BigClive's script in the description of his livestream on 2022-06-11, **not for LED neon, does not use the central config file**
- [`signbody-shamrock.scad`](signbody-shamrock.scad): the body of a shamrock sign, inspired by BigClive's script in the description of his livestream on 2022-06-11, **not for LED neon, does not use the central config file**
- [`sign-cat-svg.scad`](sign-cat-svg.scad): create a box sign from imported SVG file of a cat, **not for LED neon, does not use the central config file**
- [`sign-text-zoom.scad`](sign-text-zoom.scad): one box sign for a complete word (e.g., video call alert), **not for LED neon, does not use the central config file**
- [`sign-text-brim.scad`](sign-text-brim.scad): one word box sign, held together by a brim, **not for LED neon, does not use the central config file**
- [`sign-text-block.scad`](sign-text-block.scad): one word box sign, different wall width inside and outside to create a block, **not for LED neon, does not use the central config file**
- [`sign-text-offset.scad`](sign-text-offset.scad): box sign, shows how to use `offset()` to make letters bolder, **not for LED neon, does not use the central config file**
- [`include/shapes2D.scad`](include/shapes2D.scad): creates simple 2D shapes for extruding, can be included in own projects
- [`include/LEDneon.scad`](include/LEDneon.scad): creates the LED neon frames from 2D shapes, can be included in own projects
- [`include/signmaker.scad`](include/signmaker.scad): creates box and lid style signs from 2D shapes and text, can be included in own projects
- [`graphics/`](graphics/): contains example graphics files to create LED neon signs from, e.g., a BCDC logo vectorized from the [bigclive.com](http://bigclive.com/merch.htm) website

## Caveats
- The frames to not contain holes for the wires. Yon need to add them yourself.
- I have not printed a single one of these frames so far. Therefore, I cannot guarantee that they work as expected.

## Disclaimer
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
