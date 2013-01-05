CYLINDER_DIAMETER = 40;
CYLINDER_THICKNESS = 4;
//CYLINDER_LENGTH = 80;
CYLINDER_LENGTH = 50;
//CYLINDER_LENGTH = 30;
//CYLINDER_LENGTH = 20;
CYLINDER_EDGE = 4;

OVAL_HOLE_WIDTH = 8;
OVAL_HOLE_HEIGHT = 3;
OVAL_HOLE_ANGLE = 18;
OVAL_HOLE_DISTANCE = 3;

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
    for (angle = [0 : (OVAL_HOLE_ANGLE * 2) : 359])
    {
        rotate(a = [0, 0, angle])
        {
            for (z = [0 : OVAL_HOLE_WIDTH + OVAL_HOLE_DISTANCE : CYLINDER_LENGTH])
            {
                translate(v = [0, 0, z])
                    rotate(a = [90, 0, 0])
                        scale(v = [OVAL_HOLE_HEIGHT / OVAL_HOLE_WIDTH, 1, 1])
                            cylinder(h = CYLINDER_DIAMETER / 2, r = OVAL_HOLE_WIDTH / 2, $fn = DETAIL);
            }
        }
        rotate(a = [0, 0, angle + OVAL_HOLE_ANGLE])
        {
            translate(v = [0, 0, (OVAL_HOLE_WIDTH + OVAL_HOLE_DISTANCE) / 2])
            {
                for (z = [0 : OVAL_HOLE_WIDTH + OVAL_HOLE_DISTANCE : CYLINDER_LENGTH])
                {
                    translate(v = [0, 0, z])
                        rotate(a = [90, 0, 0])
                            scale(v = [OVAL_HOLE_HEIGHT / OVAL_HOLE_WIDTH, 1, 1])
                                cylinder(h = CYLINDER_DIAMETER / 2, r = OVAL_HOLE_WIDTH / 2, $fn = DETAIL);
                }
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
