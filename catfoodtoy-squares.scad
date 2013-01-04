CYLINDER_DIAMETER = 40;
CYLINDER_THICKNESS = 3;
//CYLINDER_LENGTH = 80;
CYLINDER_LENGTH = 32;
//CYLINDER_LENGTH = 20;
CYLINDER_EDGE = 2;

SQUARE_HOLE_WIDTH = 3;
SQUARE_HOLE_HEIGHT = 3;
SQUARE_HOLE_ANGLE = 18;
SQUARE_HOLE_DISTANCE = 3;

DISPENSER_HOLE_DIAMETER = 12;

DETAIL = 20;
//DETAIL = 100;

module mainTube()
{
    difference()
    {
        cylinder(h = CYLINDER_LENGTH, r = CYLINDER_DIAMETER / 2, $fn = DETAIL);
        translate(v = [0, 0, -1])
            cylinder(h = CYLINDER_LENGTH + 2, r = (CYLINDER_DIAMETER - CYLINDER_THICKNESS - CYLINDER_THICKNESS) / 2, $fn = DETAIL);
    }
}

module edge(height)
{
    translate(v = [0, 0, height])
    {
        difference()
        {
            cylinder(h = CYLINDER_EDGE, r = CYLINDER_DIAMETER / 2, $fn = DETAIL);
            translate(v = [0, 0, -1])
                cylinder(h = CYLINDER_EDGE + 2, r = (CYLINDER_DIAMETER - CYLINDER_THICKNESS - CYLINDER_THICKNESS) / 2, $fn = DETAIL);
        }
    }
}

module dispenserHole(height)
{
    translate(v = [0, 0, height])
        rotate(a = [90, 0, 0])
            cylinder(h = CYLINDER_DIAMETER, r = DISPENSER_HOLE_DIAMETER / 2, $fn = DETAIL);
}

module dispenserHoleRing(height)
{
    intersection()
    {
        translate(v = [0, 0, height])
            rotate(a = [90, 0, 0])
                cylinder(h = CYLINDER_DIAMETER, r = DISPENSER_HOLE_DIAMETER / 2 + CYLINDER_EDGE, $fn = DETAIL);
        difference()
        {
            cylinder(h = CYLINDER_LENGTH, r = CYLINDER_DIAMETER / 2, $fn = DETAIL);
            translate(v = [0, 0, -1])
                cylinder(h = CYLINDER_LENGTH + 2, r = (CYLINDER_DIAMETER - CYLINDER_THICKNESS - CYLINDER_THICKNESS) / 2, $fn = DETAIL);
        }
    }
}

module holeMesh()
{
    for (angle = [0 : SQUARE_HOLE_ANGLE : 359])
    {
        rotate(a = [0, 0, angle])
        {
            for (z = [CYLINDER_EDGE : SQUARE_HOLE_WIDTH + SQUARE_HOLE_DISTANCE : CYLINDER_LENGTH])
            {
                translate(v = [0, 0, z])
                    cube(size = [CYLINDER_DIAMETER / 2, SQUARE_HOLE_WIDTH, SQUARE_HOLE_HEIGHT]);
            }
        }
    }
}

difference()
{
    union()
    {
        difference()
        {
            mainTube();
            holeMesh();
        }
        dispenserHoleRing(CYLINDER_LENGTH / 2);
        edge(0);
        edge(CYLINDER_LENGTH - CYLINDER_EDGE);
    }
    dispenserHole(CYLINDER_LENGTH / 2);
}
