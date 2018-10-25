use <../MCAD-master/bearing.scad>


module chiv()
{

bearingOR_diameter=85;
bearingOR_bore=70;
bearingOR_thickness=20;

bearingIR_diameter=50;
bearingIR_bore=25;
bearingIR_thickness=15;

Amount_Bearing_balls=1;
Bearing_Ball_size=6;

length_beam1=600;
thickness_beam1=20;
width_beam1=50;

length_beam2=450;
thickness_beam2=20;
width_beam2=50;

length_steerbeam=500;
thickness_stearbeam=12.5;

location=0;

module bearing()
{

difference()
{
color("gray")
cylinder(r=(bearingOR_diameter/2),h=bearingOR_thickness, center=true);
cylinder(r=(bearingOR_bore/2),h=bearingOR_thickness+2, center=true);
}
difference()
{
color("gray")
cylinder(r=(bearingIR_diameter/2),h=bearingIR_thickness, center=true);
cylinder(r=(bearingIR_bore/2),h=bearingIR_thickness+1, center=true);
}
for (i=[0:Amount_Bearing_balls]) {
location=((bearingOR_bore/2-bearingIR_diameter/2)/2)+bearingIR_diameter/2;
rotate([0, 0, (360/Amount_Bearing_balls)*i]) {
translate([location, 0, 0])
{
color("gray")
sphere(Bearing_Ball_size);
}
}
}
}

module steerbeam()
{
color("Brown")
cylinder(r=thickness_stearbeam, h=length_steerbeam, center=true);
}

module beam1()
{
color("yellow")
cube(size=[length_beam1, width_beam1, thickness_beam1], center=true);
}

module beam2()
{
color("yellow")
cube(size=[length_beam2, width_beam2, thickness_beam2], center=true);
}

translate([0,200,0]){
beam1();
}

translate([0,-200,0]){
beam1();
}

translate([270,0,20]){
rotate([0, 0, 90]) {
beam2();
}
}

translate([-270,0,20]){
rotate([0, 0, 90]) {
beam2();
}
}

translate([-150,0,-22]){
rotate([90, 0, 0]){
steerbeam();
}
}

translate([180,0,-22]){
rotate([90, 0, 0]){
steerbeam();
}
}

translate([-150,0,-22]){
rotate([90, 0, 0]) {
bearing();
}
}

translate([180,240,-22]){
rotate([90, 0, 0]) {
bearing();
}
}

translate([180,-240,-22]){
rotate([90, 0, 0]) {
bearing();
}
}
}

chiv();
