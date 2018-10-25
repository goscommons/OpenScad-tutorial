module bearing(){
include<Examples/Ball_bearing_Generator/files/Bearing.scad>
}


// Civhichana basic parametric frame
fmW=600; // width
fmD=800; // Length


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
