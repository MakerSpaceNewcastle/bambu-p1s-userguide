include <qr.scad>

thickness = 1;
qr_depth = 0.4;

qr_size = 50;
margin = 5;
text_offset = -32;

module Body() {
    cube([qr_size+margin, qr_size+margin, thickness], center=true);

    translate([0, text_offset, 0])
    {
        cube([qr_size+margin, 15, thickness], center=true);
    }
}

module QrCode() {
    translate([0, 0, (thickness/2)-qr_depth])
    {
        qr("https://github.com/MakerSpaceNewcastle/bambu-p1s-userguide/blob/main/README.md", width=qr_size, height=qr_size, center=true, thickness=qr_depth);
    }
}

module Text() {
    translate([0, text_offset, (thickness/2)-qr_depth])
    {
        linear_extrude(qr_depth)
        {
            text("Manual", halign="center", valign="center");
        }
    }
}

Body();
color("red") QrCode();
color("blue") Text();
