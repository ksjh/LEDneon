# LEDneon
OpenSCAD scripts for LED neon strip

Inspired by [bigclive.com](http://bigclive.com/)

Just some scripts to create 3D printed frames for LED neon stips from 2D objects in OpenSCAD.
Also works with text, but make sure the rounding radius `rr` is suitable.

Theoretically, you can vectorize bitmaps in Inkscape, convert the resulting object to a path, then convert all segments of the path to lines and export a DXF file which can be imported into OpenSCAD. Unfortunately, for sensible values of `rr`, most 2D shapes have to be scaled up so much that you cannot print them with commonly available 3D printers in one piece. Otherwise, you would lose way too many details or would create too sharp edges for the LED tape.

Newer versions of OpenSCAD also support the direct import of SVG files without the need to convert all segments of the paths to lines.

Some shapes might even be printable on common printers when they consist of multiple separate shapes. Just use intersection() with a cube to select the respective parts.

## Files
- [`neon-dimension.scad`](neon-dimension.scad): the central configuration file for global parameters like the size of the LED neon strip
- [`circle.scad`](circle.scad): a simple circle
- [`square.scad`](square.scad): a simple square
- [`hexagon.scad`](hexagon.scad): a simple hexagon
- [`triangle.scad`](triangle.scad): a simple triangle
- [`roundstar.scad`](roundstar.scad): a star with rounded angles (this is how this little project started)
- [`BCDC-text.scad`](BCDC-text.scad): a script to render text
- [`BCDC-text2.scad`](BCDC-text2.scad): a script to render text clearer, uses extrusion method that does increase the size of the letters less
- [`BCDC-logo-dxf.scad`](BCDC-logo-dxf.scad): a script to generate frames from a DXF graphics file (old method)
- [`BCDC-logo-svg.scad`](BCDC-logo-svg.scad): a script to generate frames from a SVG graphics file (new method)
- [`BCDC-logo-parts-svg.scad`](BCDC-logo-parts-svg.scad): a script to generate 3D printable frames that form parts of a logo from separate SVG graphics files
- [`BCDC-logo-all-parts-svg.scad`](BCDC-logo-all-parts-svg.scad): a script that displays a logo that is composed of multiple parts, just for control purposes
- [`include/shapes2D.scad`](include/shapes2D.scad): creates simple 2D shapes for extruding, can be included in own projects
- [`include/LEDneon.scad`](include/LEDneon.scad): creates the LED neon frames from 2D shapes, can be included in own projects
- [`graphics/`](graphics/): contains an example BCDC logo vectorized from the [bigclive.com](http://bigclive.com/merch.htm) website

## Caveats
- The fames to not contain holes for the wires. Yon need to add them yourself.
- I have not printed a single one of these frames so far. Therefore, I cannot guarantee that they work as expected.

## Disclaimer
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
