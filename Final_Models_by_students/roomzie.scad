use <../MCAD-master/bearing.scad>


d1=5000;
w1=d1/9;
l1=d1/28;
module part1(){
translate([0,w1/2,0]){
color("red")
cube(size=[d1,w1,l1], center=true);
}
}

part1();
translate([0, d1/2.1, 0]) {
part1();
}

d2=d1/9;
w2=d1/1.7;
l2=d1/28;
module part2(){
color("brown")
cube(size=[d2,w2,l2], center=true);
}

translate([-d1/2.3, w2/2, d1/28]) {
part2();
}

translate([d1/2.3, w2/2, d1/28]) {
	part2();
}

translate([d1/2.3-d1/8, w2/2, d1/28]) {
  part2();
}

translate([d1/2.3-d1/4, w2/2, d1/28]) {
  part2();
}
color("yellow")
translate([(d1/2)-d2/2,d1/1.4,-l*11.5])
rotate([90, 0, 0]) {
cylinder(r=d1/28, h=w*21.4);
}

color("pink")
difference(){
translate([(d1/2)-d2/2,d1/1.4,-l1*1.5])
rotate([90, 0, 0]) {
cylinder(r=d1/13, h=d1/20);
cylinder(r=d1/20, h=d1/19);
}
}

color("purple")
translate([(d1/2)-d2/2,-d1/9,-l1*1.5])
rotate([90, 0, 0]) {
cylinder(r=d1/13, h=d1/20);
}

color("orange")
translate([-d1/5,d1/1.4,-l1*1.2])
rotate([90, 0, 0]) {
cylinder(r=d1/40, h=d1/1.4);
}

color("blue")
translate([-d1/5,d1/3,-l1*1.2]){
rotate([90, 0, 0]) {
cylinder(r=d1/10, h=d1/30);
}
}

color("black")
translate([-d1/5,d1/1.5,-l1*1.3])
rotate([0, 0, 90]) {
cylinder(r=d1/40, h=d1/15);
}
