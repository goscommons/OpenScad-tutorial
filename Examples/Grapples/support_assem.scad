/*
ssqa module{
dependent from full length
this module in particular needs to be customizable
integrated with the squares
}
*/

// INDEPENDENT VARIABLES
/* Tynes Subassemblies parameters*/
l=1600;// width of grapples
tynes_num=10;//ammmount of inner tynes
sh_thick=5; // Sheet thickness

/*Lid Parameters*/
l_lid=320;

// DEPENDENT VARIABLES**DON'T CHANGE**
d_b_tynes=l/tynes_num;// distance between tynes recalculation
l_ratio=(l_lid-l_lid*0.07)/450;// Recalculation of front and up plate based on original size

d_b_bar=l_lid/2;
h_bar=450;

module sq_tube(length,size){
	difference(length,size) {
		cube([length,size*24.5,size*24.5], center=true);
		cube([length+length*0.2, size*(24.5)-15, size*(24.5)-15], center=true);
	}
}
/* sq_tube(l,3); */



module support_assem() {
	translate([0,0,37])
	rotate([0, 0, 0]) {
		translate([l/2-sh_thick/2,0,400])
		rotate([0,0,0])
		color("blue")
		sq_tube(l,3);

		translate([sh_thick-sh_thick/2+l/2,0,0])
		rotate([0,0,0])
		color("yellow")
		sq_tube(l,3);

	}

	module hinch(){
		rotate([0,90,0])linear_extrude(center=true,  height = sh_thick)import(file="hinch.dxf");
	}

	module mount_cylinder(){
		for (i=[0:4]) {
			translate([i*(sh_thick+sh_thick*0.1)-sh_thick*2, 0, 0])
			rotate([0,90,0])
			linear_extrude(center=true,  height = sh_thick)import(file="mount_cylinder.dxf");
		}

	}

	/* translate([0,15,-20]){} */
module hinches(){
						color("green"){
						translate([l/4-l_lid/2,-55,420])
						hinch();
						translate([l/4+l_lid/2,-55,420])
						hinch();
						translate([l/4,-55,420])
						mount_cylinder();
					}

					translate([l/4+l_lid/2,74,540])
					rotate([90,0,90])
					tube(15,sh_thick*2+sh_thick*0.5,5);

					translate([l/4-l_lid/2,74,540])
					rotate([90,0,90])
					tube(15,sh_thick*2+sh_thick*0.5,5);
				}

translate([0, 20, -22]) {
	hinches();
	translate([l,0,0])
	mirror(){
		hinches();
		}
	}
}


module tube(r,lng,th){
	difference(){
		cylinder(r=r, h=lng, center=true);
		cylinder(r=r-th, h=lng+lng*0.2, center=true);
	}
}

module ssqa(){
	module base_part(){
		module triangle(o_len, a_len, depth, center=false){
			centroid = center ? [-a_len/3, -o_len/3, -depth/2] : [0, 0, 0];
			translate(centroid) linear_extrude(height=depth){
				polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
			}
		}

		cb_h=18.79;
		cb_l=44.45;
		translate([0,cb_h,0])
		triangle(cb_l-cb_h,cb_l,sh_thick, false);
		cube([cb_l,cb_h,sh_thick], center=false);
	}

	color("red") {
		translate([0,16,220])
		rotate([-45, 0, 0])
		union(){
			cube(size=[l_lid+l_lid*0.05,75,sh_thick], center=true);
		}
	}

translate([-l_lid/4,0,0]){
	translate([0,0,25])
	union(){
		translate([-d_b_bar/2-sh_thick/2,-10,-225])
		rotate([90,0,90])
		base_part();

		translate([d_b_bar/2-sh_thick/2,-10,-225])
		rotate([90,0,90])
		base_part();

		translate([d_b_bar/2,0,0])
		rotate([0, 90, 0])
		cube(size=[h_bar,20,sh_thick], center=true);

		translate([-d_b_bar/2,0,0])
		rotate([0, 90, 0])
		cube(size=[h_bar,20,sh_thick], center=true);
	}
		color("red")
		translate([0,15,-165]){
			rotate([-30, 0, 0]){
				difference() {
					cube(size=[d_b_bar+d_b_bar*0.2,60,sh_thick], center=true);
					translate([0,-30,0])
					cube(size=[100, 50, 50], center=true);
				}
			}
		}

}

}

translate([-l/2, 0, 0])
support_assem();

translate([0,-45,200]){
translate([l/4,0,0])
rotate([0, 0, 180])
ssqa();

mirror(){
translate([l/4,0,0])
rotate([0, 0, 180])
ssqa();
	}
}
