CYLINDER_DIAMETER = 40;
CYLINDER_THICKNESS = 4;

ENDCAP_THICKNESS = 2;
ENDCAP_LENGTH = 4;

TOLERANCE = 0.4;
//DETAIL = 20;
DETAIL = 100;

module endcap()
{
    union()
    {
        cylinder(r = CYLINDER_DIAMETER / 2, h = ENDCAP_THICKNESS, $fn = DETAIL);
        cylinder(r = CYLINDER_DIAMETER / 2 - CYLINDER_THICKNESS - TOLERANCE, h = ENDCAP_LENGTH, $fn = DETAIL);
    }
}

module clip_style_1()
{
    intersection()
    {
        translate(v = [CYLINDER_DIAMETER / 2 - CYLINDER_THICKNESS - TOLERANCE, 2.5, ENDCAP_LENGTH - TOLERANCE])
            rotate(a = [90, 0, 0])
                linear_extrude(height = 5, center = false, convexity = 3, twist = 0, slices = DETAIL)
                    polygon(points=[[0,0],[-5, 0],[0, 10]]);
        cylinder(r = CYLINDER_DIAMETER / 2 - CYLINDER_THICKNESS - TOLERANCE, h = 20, $fn = DETAIL);
    }
    translate(v = [CYLINDER_DIAMETER / 2 - CYLINDER_THICKNESS - TOLERANCE, 0, 12])
        sphere(r = 0.75, $fn = DETAIL);
    translate(v = [CYLINDER_DIAMETER / 2 - CYLINDER_THICKNESS - TOLERANCE, 1.5, 11])
        sphere(r = 0.75, $fn = DETAIL);
    translate(v = [CYLINDER_DIAMETER / 2 - CYLINDER_THICKNESS - TOLERANCE, -1.5, 11])
        sphere(r = 0.75, $fn = DETAIL);
    translate(v = [CYLINDER_DIAMETER / 2 - CYLINDER_THICKNESS - TOLERANCE, 0, 9])
        sphere(r = 1, $fn = DETAIL);
    translate(v = [CYLINDER_DIAMETER / 2 - CYLINDER_THICKNESS - TOLERANCE, 0, 7])
        sphere(r = 1, $fn = DETAIL);
    translate(v = [CYLINDER_DIAMETER / 2 - CYLINDER_THICKNESS - TOLERANCE, 0, 5])
        sphere(r = 1, $fn = DETAIL);
}

module clip()
{
    clip_style_1();
}

module clips()
{
    for (angle = [0 : 120 : 240])
    {
        rotate(a = [0, 0, angle])
            clip();
    }
}

union()
{
    endcap();
    clips();
}
