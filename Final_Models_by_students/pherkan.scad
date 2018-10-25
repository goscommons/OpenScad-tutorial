use <../MCAD-master/bearing.scad>


ltv=98;
btv=98;
htv=35;
lr=124;
br=38;
hr=6.3;

//Apple TV Box
module appletv () {
translate([0,0,(htv/2)]){
color("DarkSlateGrey")
minkowski() {
cube(size=[ltv,btv,htv],center=true);
cylinder(r=40, center=true);
}
}
}

//Cutout of AppleTV
module cutoutappletv(){
translate([75,0,(htv/2)]){
union(){
translate([10,-30,-5]){
cube(size=[20,10,3],center=true);
}

rotate([0,90]){
      translate([5,-35,0]){
        cylinder(r=4,h=20);
      }
      translate([5,-25,0]){
        cylinder(r=4,h=20);
      }
    }
rotate([0,90]){
  hull() {
      translate([0,5]){
      cylinder(r=3,h=20);
      }
      translate([0,-5]){
      cylinder(r=3,h=20);
    }
  }
}
    translate([10,30,0]){
    cube(size=[20,15,10],center=true);
    }
    translate([10,30,3]){
    cube(size=[20,10,10],center=true);
    }
}
}
}

//AppleTV with the cutout
module fullatv() {
color("DarkSlateGrey")
difference(){
appletv();
cutoutappletv();
}
}

//Apple Remote
module fullremote() {
translate([-38,150,6]){
color("DimGray")
minkowski() {
cube(size=[33,25,2],center=true);
cylinder(r=6, center=true);
}
}
translate([0,150,(hr/2)]){
translate([40,-8.5,3.2]){
color("DimGray")
cylinder(r=7,h=3);
}
translate([20,-8.5,3.2]){
color("DimGray")
cylinder(r=7,h=3);
}
translate([0,-8.5,3.2]){
color("DimGray")
cylinder(r=7,h=3);
}
translate([0,8.5,3.2]){
color("DimGray")
cylinder(r=7,h=3);
}
color("DimGray")
hull() {
translate([20,8.5,3.2]){
cylinder(r=7,h=3);
}
translate([40,8.5,3.2]){
cylinder(r=7,h=3);
}
}
color("DarkSlateGrey")
minkowski() {
cube(size=[(lr-14),(br-14),(hr)],center=true);
cylinder(r=7);
}

}
}

//Make it more fancy
translate ([0,-50,0]) {
mirror (v=[10,10,30]){
fullatv();
}
}

translate ([0,-30,-30]) {
rotate([45,30,10]){
fullremote();
}
}