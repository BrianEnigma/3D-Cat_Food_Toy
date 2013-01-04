#3D-Printed Parametric Cat Food Dispensing Toy

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
take easily 10-20 minutes.

##Design Notes

**Triangle variant** :: I was unable to get this to print correctly as-is on
the MakerBot Replicator.  I suppose I could have made the cylinder thicker
and/or the inter-triangle braces thicker, but I moved on to other, more
interesting designs.

**Oval variant** :: Visually, this one printed much nicer, but did not seem
structurally strong enough for use.  I may work on sizing and spacing more.

**Square variant** :: So far, this one works best, but is absolutely the
least interesting visually.

##TODO

- I still needs to design the snap-in end caps.


