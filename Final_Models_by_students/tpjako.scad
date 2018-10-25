use <../MCAD-master/bearing.scad>

plankWidth = 6;
plankHeigth = 3;
WithChivi = 50;
lengthChici = 100;

module Plank(length) {

cube(size=[plankWidth, length, plankHeigth], center=true);
}
translate([WithChivi/2, 0, 0]) {
Plank(lengthChici);
}
translate([-WithChivi/2, 0, 0]) {
Plank(lengthChici);
}

translate([0, 0, plankHeigth]) {
rotate([0, 0, 90]) {
translate([-lengthChici/2 + 5, 0, 0]) {
Plank(WithChivi + 10);
translate([plankWidth + 3, 0, 0]) {
Plank(WithChivi + 10);
}
translate([2*(plankWidth + 3), 0, 0])
Plank(WithChivi + 10);
}
translate([lengthChici/2 - 5, 0, 0]) {
Plank(WithChivi + 10);
}
}
}

translate([0,(lengthChici/2)/3 , -plankHeigth]) {
rotate([0, 0, 90]) {
rotate([90, 0, 0]) {
translate([0, 0, (WithChivi/2+20)/2]) {
cylinder(r=plankHeigth/2, h=((WithChivi + 40)/2), center=true);
}
}
translate([0,(WithChivi/2+5)/2,0]){
Plank((WithChivi + 10)/2);}
}
bearing([1.5,0,0],[0,90,0],model="custom", inD=plankHeigth,outD=plankHeigth+5,bW=3);
}
translate([0,-lengthChici/2 + (2plankHeigth) , -plankHeigth]) {
rotate([90,0 , 90]) {
cylinder(r=plankHeigth/2, h=WithChivi + 10+2plankWidth , center=true);
}
bearing([WithChivi/2+1.1plankWidth,0,0],[0,90,0],model="custom", inD=plankHeigth,outD=plankHeigth+5,bW=5);
bearing([-WithChivi/2-1.1plankWidth,0,0],[0,90,0],model="custom", inD=plankHeigth,outD=plankHeigth+5,bW=5);
}