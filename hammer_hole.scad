l=130;
h_l=48;
h_w=18;
h_d=30;



module hammer(){
/* rotate([60, 20, 10]) { */

	color("grey")
	cube([h_l,h_w,h_d],true);
	rotate([0,0,0])
	difference() {
		cylinder(r=10, h=l);
		translate([0, 0, 100])
		rotate([90, 0, 0]) {
			cylinder(r=5, h=100, center=true);

		}
	}

/* } */

}


rotate([0, 0, 10]) {
	hammer();
}
