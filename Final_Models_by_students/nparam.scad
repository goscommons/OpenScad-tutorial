use <../MCAD-master/bearing.scad>

module bearing(){
include<../Examples/Ball_bearing_Generator/files/Bearing.scad>
}

use <MCAD-master/gears.scad>
translate([0,0,40])
bearing(model="custom", inD=18, outD=30, bW=14);

fmW=600;
fmD=800;

module prank(pw,ph,pl){
cube([pw,pl,ph], center=true);
}

translate([-40,0,0]){
translate([-fmD/2+20,0,0])
color("blue")
translate([40,0,0])
prank(40,40,fmW);

translate([fmD/2-20,0,0])
color("red")
translate([40,0,0])
prank(40,40,fmW);
}

translate([0,0,40]){
translate([0,fmW/2-20,0])
rotate([0,0,90])
prank(40,40,fmD);

translate([0,-fmW/2+20,0])
rotate([0,0,90])
prank(40,40,fmD);
}

translate([0,0,40]){
rotate([0,90,90]){
cylinder(r=8, h=600, center=true);
}
}

translate([320,0,-5]){
rotate([0,90,90]){
cylinder(r=25, h=650, center=true);
}
}

translate([-320,0,-5]){
rotate([0,90,90]){
cylinder(r=25, h=650, center=true);
}
}

difference(){
translate([320,310,-5]){
color("gray")
rotate([0,90,90]){
cylinder(r=40, h=40);
}
}
translate([320,310,-5]){
rotate([0,90,90]){
cylinder(r=25, h=50);
}
}
}

difference(){
translate([-320,310,-5]){
color("gray")
rotate([0,90,90]){
cylinder(r=40, h=40);
}
}
translate([-320,310,-5]){
rotate([0,90,90]){
cylinder(r=25, h=50);
}
}
}

difference(){
translate([-320,-360,-5]){
color("gray")
rotate([0,90,90]){
cylinder(r=40, h=40);
}
}
translate([-320,-360,-5]){
rotate([0,90,90]){
cylinder(r=25, h=50);
}
}
}

difference(){
translate([320,-360,-5]){
color("gray")
rotate([0,90,90]){
cylinder(r=40, h=40);
}
}
translate([320,-360,-5]){
rotate([0,90,90]){
cylinder(r=25, h=50);
}
}
}

translate([fmD/2-20,0,0])
color("green")
translate([0,0,200])
rotate([0,0,0])
prank(40,40,fmW);

translate([380,0,0]){
rotate([0,0,0]){
color("brown")
cylinder(r=15, h=250);
}
}