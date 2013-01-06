#3D-Printed Parametric Cat Food Dispensing Toy

##Note

This GitHub project holds the source files for the [Food-Dispensing Cat
Toy](http://www.thingiverse.com/thing:40425).  For the printable 
final renders, please visit the Thingiverse project page at
<http://www.thingiverse.com/thing:40425>.

##Overview

This project is an exploration into designing and manufacturing a cat toy
that rolls around and occasionally dispenses a cat treat.  It consists of a
cylinder with small perforations so that the food contained within can be
seen, heard, and smelled.  It also contains one large hole that acts as the
dispensing mechanism.  The hole diameter (in relation to the size of the
treats inside) and the overall length of the tube dictate how easily a piece
of food will drop out.

##Parameters

This 3D model is parametric, meaning you can alter a number of things about
it.  Look at the top of each [OpenSCAD][] file for the all-uppercase
constants.  Each model shares some common ones (all in millimeters):

- CYLINDER_DIAMETER :: the outside diameter of the cylinder
- CYLINDER_THICKNESS :: the thickness of the cylinder
- CYLINDER_LENGTH :: the length of the cylinder
- CYLINDER_EDGE :: the margin at the top, bottom, and around the dispenser
  hole that has no cutouts
- DISPENSER_HOLE_DIAMETER :: the diameter of the dispenser hole

Each model then has some shape-specific hole parameters, be they OVAL,
SQUARE, or DIAMOND (technically, triangles):

- OVAL_HOLE_WIDTH :: the width of the hole
- OVAL_HOLE_HEIGHT :: the height of the hole
- OVAL_HOLE_ANGLE :: rotationally, the angle between each column of holes
- OVAL_HOLE_DISTANCE :: linearly, the distance between holes within a column

[OpenSCAD]: http://openscad.org

##Render Notes

Note that the sheer number of boolean subtracts makes this a difficult final
render to an STL-exportable object in OpenSCAD, even on a powerful modern
machine.  This is compounded by the length of the cylinder.  I've seen it
easily take 10 minutes.

##Design Notes

**Triangle variant** :: I was unable to get this to print correctly as-is on
the MakerBot Replicator.  I suppose I could have made the cylinder thicker
and/or the inter-triangle braces thicker, but I moved on to other, more
interesting designs.

**Oval variant (thin)** :: Visually, this one printed much nicer, but did not seem
structurally strong enough for use.  It was far too brittle.

**Oval variant (thick)** :: Ovals, spaced further apart than the "thin" variant
and with a thicker wall.

**Square variant** :: This version is the strongest, but is absolutely the
least interesting visually.

**Endcap (flat)** :: An end-cap design that friction-fits into the ends of
the tube.  It is flat on the end, making it easy to print.  It is a really 
tight friction fit, but it works for me.  If your printer is not as 
detailed as the Replicator, you might want to adjust the TOLERANCE constant
at the top of the file to loosen it up a bit.

##TODO

- I'd like to design an endcap with a partial sphere so that the tube cannot
flip up on one end get stuck in that position.  That sort of design will 
either be in two pieces (the flat endcap plus a partial sphere to glue on
to it) or will require support.



