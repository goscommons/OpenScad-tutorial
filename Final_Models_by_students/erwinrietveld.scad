use <../MCAD-master/bearing.scad>

// BEAM
b_ll = 600;
b_ls = 400;
b_w = 50;
b_h = 25;

// CYLINDER
c_ll = b_ls + 150;
c_ls = b_ls + 100;
c_r = 15;


// WHEEL
w_r = c_r + 20;
w_w = 20;
c_r2=16;

// TRANSLATION
trans_l = (b_ll - b_w)/2;
trans_w = (b_ls - b_w)/2;
trans_h = b_h;
trans_ch = (c_r + b_h/2);

// FRAME
module beam(var_length,var_rot) {
color("purple")
rotate(var_rot,0,0)
cube(size=[var_length, b_w, b_h], center=true);
}

translate([0, trans_w, 0])
beam(b_ll,0);

translate([0, -trans_w, 0])
beam(b_ll,0);

translate([trans_l,0,trans_h])
beam(b_ls,90);

translate([-trans_l,0,trans_h])
beam(b_ls,90);

// CYLINDERS
module cyl(var_cyllength) {
color("cyan")
rotate([90,0,0])
translate([0,-trans_ch,0])
cylinder(r=c_r, var_cyllength, center=true);
}

translate([-trans_l,0,0])
cyl(c_ls);

translate([0,c_ls-c_ll,0])
cyl(c_ll);

// BEARINGS
module bbearing() {
rotate([90, 0, 0])
translate([0,-trans_ch,0])
bearing(model="custom", inD=c_r2, outD=c_r2 + 40, bW=w_w);
}

bbearing();

translate([-trans_l,(trans_w + b_w),0])
bbearing();

translate([-trans_l,-(trans_w + b_w),0])
bbearing();