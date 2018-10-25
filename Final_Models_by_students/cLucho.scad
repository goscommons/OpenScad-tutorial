use <../MCAD-master/bearing.scad>

h_l=20;
h_w=400;
h_d=10;
module plank1(){
color ("orange")
cube(size=[h_l, h_w, h_d], center=true);
}

module plank2(){
color ("orange")
cube(size=[h_l*8, h_w/15, h_d], center=true);
}

module seat(){
color ("blue"){
cube(size=[160, 170, h_d], center=true);
translate([0, -70, 50]) {
rotate([140, 0, 0]) {
cube(size=[160, 100, h_d], center=true);
}}}}

module wheel(){
color ("white")
rotate([90, 0, 90]) {
difference() {
cylinder(r=20, h=10, center=true);cylinder(r=8, h=20, center=true);;
}}}

module axis(){
color("orange")
cylinder(r=8, h=200, center=true);
}

module axis2(){
color("orange"){
cylinder(r=8, h=200, center=true);
translate([0, 0, 100]) {
cube(size=[20, 20, h_d+50], center=true);
}}}

module Lateral();{
color("grey"){
translate([-16, 0, 0]) {
rotate([0, 270, 0]) {
polygon(points=[[15,193], [45,180],[30,140], [10, 130], [10, -5], [25, -25], [25, -120], [105,-215], [90,-230], [40,-200], [-5,-200], [-5,193]]);
}}
translate([146, 0, 0]) {
rotate([0, 270, 0]) {
polygon(points=[[15,193], [45,180],[30,140], [10, 130], [10, -5], [25, -25], [25, -120], [105,-215], [90,-230], [40,-200], [-5,-200], [-5,193]]);
}}
}}

plank1 ();

translate([130, 0, 0]) {
plank1();
}

translate([65, 180, h_d]) {
plank2();
}

translate([65, -180, h_d]) {
plank2();
}

translate([65, -40, h_d]) {
plank2();
}

translate([65, 150, 30]) {
rotate([20, 0, 0]) {
plank2();
}}

translate([65, 180, 42]) {
rotate([20, 0, 0]) {
plank2();
}}

translate([65, -110, h_d*2]) {
seat();
}

translate([160, -180, -h_d*1.5]) {
wheel();
}

translate([-30, -180, -h_d*1.5]) {
wheel();
}

translate([65, 30, -h_d*1.5]) {
wheel();
}

translate([65, -180, -h_d*1.5]) {
rotate([0, 90, 0]) {
axis();;
}}

translate([100, 30, -h_d*1.5]) {
rotate([0, 270, 0]) {
axis2();;
}}