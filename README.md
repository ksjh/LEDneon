# LEDneon
OpenSCAD scripts for LED neon strip

Inspired by [bigclive.com](http://bigclive.com/)

Just some scripts to create 3D printed frames for LED neon stips from 2D objects in OpenSCAD.
Also works with text, but make sure the rounding radius `rr` is suitable.

You can vectorize bitmaps in Inkscape, save the result as an SVN file and create LED neon frames from them. Unfortunately, for sensible values of `rr`, some 2D shapes have to be scaled up so much that you cannot print them with commonly available 3D printers in one piece. Otherwise, you would lose way too many details or would create too sharp edges for the LED tape. Some shapes work, however. Sometimes, it may make sense to print individual parts of the shapes individually. 

There are some scripts to create frames from text. The most viable approach might be to print single letters separately, not complete words.

## Files
- [`neon-dimension.scad`](neon-dimension.scad): the central configuration file for global parameters like the size of the LED neon strip
- [`circle.scad`](circle.scad): a simple circle
- [`square.scad`](square.scad): a simple square
- [`hexagon.scad`](hexagon.scad): a simple hexagon
- [`triangle.scad`](triangle.scad): a simple triangle
- [`roundstar.scad`](roundstar.scad): a star with rounded angles (this is how this little project started)
- [`BCDC-text.scad`](BCDC-text.scad): a script to render text
- [`BCDC-text2.scad`](BCDC-text2.scad): a script to render text clearer, uses extrusion method that does increase the size of the letters less. [Stencil fonts](https://fonts.google.com/?query=stencil) like in the [official BCDC merch](http://bigclive.com/merch.htm) still do not work as expected at reasonable sizes of the letters.
- [`BCDC-logo-dxf.scad`](BCDC-logo-dxf.scad): a script to generate frames from a DXF graphics file (old method)
- [`BCDC-logo-svg.scad`](BCDC-logo-svg.scad): a script to generate frames from a SVG graphics file (new method)
- [`BCDC-logo-parts-svg.scad`](BCDC-logo-parts-svg.scad): a script to generate 3D printable frames that form parts of a logo from separate SVG graphics files
- [`BCDC-logo-all-parts-svg.scad`](BCDC-logo-all-parts-svg.scad): a script that displays a logo that is composed of multiple parts, just for control purposes
- [`heart.scad`](heart.scad): a heart shape, inspired by discord user *Engineer_Nelfar*
- [`moon.scad`](moon.scad): a waning moon shape
- [`clover.scad`](clover.scad): a clover (shamrock) shape
- [`line-tracing-svg.scad`](line-tracing-svg.scad): generate 3D frames for LED neon from lines in an SVG file
- [`include/shapes2D.scad`](include/shapes2D.scad): creates simple 2D shapes for extruding, can be included in own projects
- [`include/LEDneon.scad`](include/LEDneon.scad): creates the LED neon frames from 2D shapes, can be included in own projects
- [`graphics/`](graphics/): contains an example BCDC logo vectorized from the [bigclive.com](http://bigclive.com/merch.htm) website

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
