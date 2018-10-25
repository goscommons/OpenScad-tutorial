l=130;
h_l=58;
h_w=28;
h_h=40;



module hammer(){
/* rotate([60, 20, 10]) { */

	color("grey")
	cube([h_l,h_w,h_h],true);
	rotate([0,0,0])
	difference() {
		cylinder(r=15, h=l);
		translate([0, 0, 100])
		rotate([90, 0, 0]) {
			cylinder(r=10, h=100, center=true);

		}
	}

/* } */

}


rotate([0, 0, 10]) {
	hammer();
}
