x1=400; //width front back
x2=x1*1.6; //width sides 160
x3=x1*1.2; //length steer 120
x4=x1*0.2; // 20


y1=x1/10; //depth
z1=x1/40; //thickness



module plank(x,y,z) {
color("SaddleBrown"){
  cube(size=[x, y, z], center=true);
}
}

module axis(r1,r2,h1){
  cylinder(r1,r2,h1, center=true);
}

module holder(x,y,z){
  color("SaddleBrown"){
  cube(size=[x,y,z], center=true);
}
}

//plank achter
translate([0, (-x2+y1)/2, 0]) {

  plank(x1,y1,z1);

}

//plank voor
translate([0, (x2-y1)/2, 0]) {
  plank(x1,y1,z1);
}

//plank links
translate([(-x1+y1)/2, 0, z1]) {
  rotate([0, 0, 90]) {

    plank(x2,y1,z1);
  }
}
//plank rechts
translate([(x1-y1)/2, 0, z1]) {
  rotate([0, 0, 90]) {
    plank(x2,y1,z1);
  }
}

//stuur
translate([(x3-x1)/2, 0, 0]) {

  plank(x3,y1,z1);
}

//handvat
translate([(x3/2)+z1, 0, (y1+z1)/2]) {
  r1=y1;
  r2=z1;
  h1=z1;
axis(r1,r2,h1);
}

translate([100, 0, 100]) {

difference() {
	cylinder (h = 40, r=10, center = true, $fn=100);
	rotate ([90,0,0]) cylinder (h = 40, r=9, center = true, $fn=100);
}
}

