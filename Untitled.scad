cube([10,20,40], center=true);


difference() {
	color("red") {
		cylinder(r=10, h=10, center=true);

	}

	cube(size=[10, 10, 10], center=true);

}

translate([20, 30, 0]) {
cylinder(r=10, h=20, center=true);
}
