use <MCAD-master/gears.scad>
use <MCAD-master/bearing.scad>

/* include <examples/ball_bearing_generator/files/bearing.scad> */

/* module gear(number_of_teeth,
		circular_pitch=false, diametral_pitch=false,
		pressure_angle=20, clearance = 0) */

/*linear_extrude(10)
gear(25,100,50,30,0);*/

/* test_gears(); */
/* rotate([0,0,30]){
	translate([-200,0,0]){
		rotate([0,90,0]){
		cube([15,15,400], center=true);
		bearing(pos=[0,0,-10], angle=[0,0,0],
			model="custom",
			inD=20,
			outD=40,
			bW=18
		)
			;

									}
	}
} */
/* translate([2,0,0])
gear(25,10,50,20,0); */
translate([40,0,0])
bearing(model="custom", inD=18, outD=30, bW=14);
bearing(model="custom", inD=20, outD=40, bW=18);
