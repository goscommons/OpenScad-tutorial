use <MCAD-master/gears.scad>

/* module gear(number_of_teeth,
		circular_pitch=false, diametral_pitch=false,
		pressure_angle=20, clearance = 0) */

linear_extrude(10)
gear(25,100,50,30,0);

/* test_gears(); */

/* translate([2,0,0])
gear(25,10,50,20,0); */
