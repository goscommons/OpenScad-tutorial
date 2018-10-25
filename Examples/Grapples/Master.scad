// ************* Credits part *************
// "Grapples customizable design "
// Programmed by Jose Carlos Urra  - September 2018
// Grapples design by Manolis Karamousas
//
//
//********************** License ******************
//**       "Grapples customizable design"        **
//**        by @polemidis and @jurra             **
//**  is licensed under the Creative Commons     **
//** - Attribution - Non-Commercial license.     **
//*************************************************
//
//
// ************* Declaration part *************
// INDEPENDENT VARIABLES
/* Tynes Subassemblies parameters*/
l=1300;// width of grapples
tynes_num=5;//ammmount of inner tynes
sh_thick=7; // Sheet thickness

/*Lid Parameters*/
l_lid=380;


// DEPENDENT VARIABLES**DON'T CHANGE**
d_b_tynes=l/tynes_num;// distance between tynes recalculation
l_ratio=(l_lid-l_lid*0.07)/450;// Recalculation of front and up plate based on original size

d_b_bar=l_lid/2;
h_bar=450;

module tynes(){
	color("purple"){
		translate([-sh_thick,0,0])rotate([0,90,0])linear_extrude(center=true,  height = sh_thick)import (file = "ingussets.dxf");

	}

	translate([-410,100,25])
	rotate([0,90,-30])linear_extrude(center=true,  height = sh_thick)import (file = "gussets.dxf");

	rotate([0,90,0])linear_extrude(center=true,  height = sh_thick)import (file = "outsidetine.dxf");

}

/* tynes(); */
/*Support Assembly
- [] mount cylinder base 01
- [] ssqa_module
- [] hinch 01
- [] Bussings for Cylinder 01
- [] Bushings for Cylinder 02
- [] pin 1
- [] pin 2
- [] Support plate on to of square tubing
*/

module hinch(){
	rotate([0,90,0])linear_extrude(center=true,  height = sh_thick)import(file="hinch.dxf");

}

module mount_cylinder(){
	for (i=[0:4]) {
		translate([i*(sh_thick+sh_thick*0.1)-sh_thick*2, 0, 0])rotate([0,90,0])linear_extrude(center=true,  height = sh_thick)import(file="mount_cylinder.dxf");
	}
}

// Square tube
module shreyas(length,size){
	/* difference() {
	cube([l,sq_tb*(24.5),sq_tb*(24.5)], center=true);
	cube(size=[l+l*0.2, sq_tb*(24.5)-15, sq_tb*(24.5)-15], center=true);
	} */

	difference(length,size) {
		cube([length,size*24.5,size*24.5], center=true);
		cube([length+length*0.2, size*(24.5)-15, size*(24.5)-15], center=true);
	}
}


module in_tynes(){
	rotate([0,90,0])
	linear_extrude(center=true,  height = sh_thick)
	import(file="insidetine.dxf");
	color("red"){
		translate([-sh_thick,0,0])rotate([0,90,0])linear_extrude(center=true,  height = sh_thick)import (file = "ingussets.dxf");
		translate([sh_thick,0,0])rotate([0,90,0])linear_extrude(center=true,  height = sh_thick)import (file = "ingussets.dxf");

		translate([415,115,30])
		rotate([0,90,30])linear_extrude(center=true,  height = sh_thick)import (file = "gussets.dxf");
		mirror([1,0,0]){
			translate([405,115,30])
			rotate([0,90,30])linear_extrude(center=true,  height = sh_thick)import (file = "gussets.dxf");
		}
	}
}

/* in_tynes(); */
module tube(r,lng,th){
	difference(){
		cylinder(r=r, h=lng, center=true);
		cylinder(r=r-th, h=lng+lng*0.2, center=true);
	}
}

translate([l/2,710,44])
color("white")
rotate([0,90,0])
tube(17,l,3);

module support_assem() {
	module sq_tube(length,size){
		difference(length,size) {
			cube([length,size*24.5,size*24.5], center=true);
			cube([length+length*0.2, size*(24.5)-15, size*(24.5)-15], center=true);
		}
	}

	module support_assem() {
		translate([0,0,37])
		rotate([0, 0, 0]) {
			translate([l/2-sh_thick/2,0,400])
			rotate([0,0,0])
			color("blue")
			sq_tube(l-sh_thick,3);

			translate([sh_thick-sh_thick/2+l/2,0,-20])
			rotate([0,0,0])
			color("yellow")
			sq_tube(l-sh_thick,3);

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
}
module tube(r,lng,th){
	difference(){
		cylinder(r=r, h=lng, center=true);
		cylinder(r=r-th, h=lng+lng*0.2, center=true);
	}
}

module ssqa(){
	translate([0,20,-150]){
		rotate([-35, 0, 0]){
			difference() {
				cube(size=[d_b_bar+d_b_bar*0.2,50,sh_thick], center=true);
				translate([0,-30,0])
				cube(size=[100, 50, 50], center=true);
			}
		}
	}
	color([0/255, 120/255, 100/255]) {
		translate([0,20,200])
		rotate([-35, 0, 0])
		union(){
			cube(size=[d_b_bar+d_b_bar*0.2,50,sh_thick], center=true);
			translate([d_b_bar/2,0,0])
			cube(size=[d_b_bar*2,50,sh_thick], center=true);
		}


	}

	translate([0,0,25]){
		translate([d_b_bar/2,0,0])
		rotate([0, 90, 0])
		cube(size=[h_bar,20,sh_thick], center=true);

		translate([-d_b_bar/2,0,0])
		rotate([0, 90, 0])
		cube(size=[h_bar,20,sh_thick], center=true);
	}
}


module integration(){
	// Square tube bottom
	translate([-sh_thick*2,-20,40]){
	}

	translate([d_b_tynes,0,0])for (i=[0:tynes_num-2])
	translate([i*d_b_tynes,0,0])
	// Replace this by a module
	/* rotate([0,90,0])linear_extrude(center=true,  height = sh_thick)import(file="insidetine.dxf"); */
	in_tynes();

	translate([l,0,0])tynes();
	mirror([1, 0, 0]) {
		translate([0,0,0])
		tynes();
	}
}

integration();

/*Lids subassembly*/
module lids_assem(){
	module lids(){
		/* - [] thickness space, coupling connection
		*/
		module lid_plate(){
			translate([0,0,700])rotate([0,90,0])linear_extrude(center=true,  height = sh_thick)import (file = "lid_plate.dxf");
		}
		translate([l_lid/2-sh_thick*1.3,0,0])
		lid_plate();
		mirror(){
			translate([l_lid/2-sh_thick*1.3,0,0])
			lid_plate();
		}
	}

	module up_plate(){
		linear_extrude(height = sh_thick)import (file = "brace_plate_lid_upper.dxf");
	}

	module front_plate(){
		linear_extrude(height = 10)
		import (file = "brace_plate_lid_front.dxf");
	}

	module lid_jaw(){
		linear_extrude(height = 10, center=true)
		import (file = "lid_jaw.dxf", center=true);
	}

	module rod_mount(args) {
		translate([0,0,sh_thick])
		linear_extrude(height = sh_thick)
		import (file = "cylinder_rod_mount.dxf");
		color("red")
		linear_extrude(height = sh_thick)
		import (file = "cylinder_rod_mount_in.dxf");
		translate([0,0,-sh_thick])
		linear_extrude(height = sh_thick)
		import (file = "cylinder_rod_mount.dxf");
	}

	for (i=[0:1]) {
		translate([i*l/2,0,0])

		union(){
			color("yellow"){
				translate([l/4.08,767,493])
				rotate([12,0,0])
				rotate([0,90,0])
				rod_mount();

				translate([l/4,856,160])
				rotate([90,0,90])
				tube(20,l_lid,3);

				translate([l/4,189,548])
				rotate([90,0,90])
				tube(15,l_lid,3);

				translate([l/4,880,-220])
				rotate([0,90,90])
				scale([1,l_ratio,1])
				lid_jaw();

				translate([l/4,181,-155])
				lids();

				translate([l/4,205,540])
				rotate([-6, 0, 0])
				rotate([0,0,90])
				scale([1,l_ratio,1])
				up_plate();

				translate([l/4,865,210])
				rotate([-77,0,0])
				rotate([0,0,270])
				scale([1,l_ratio,1])
				front_plate();


				translate([l/4-l/4*0.05,780,450])
				rotate([62,0,0])
				shreyas(l_lid-l_lid*0.05,2.2);

			}
			translate([l/4,760,530])
			rotate([90,0,90])
			tube(20,sh_thick*5+sh_thick*0.5,5);

			translate([l/4,216,705])
			rotate([90,0,90])
			tube(20,sh_thick*6+sh_thick*0.5,5);

		}
	}
}

translate([0, 0, 10])
lids_assem();
/* module support(){
include<support_assem.scad>
} */
translate([0, -35, 75])
translate([l/2,0,0])
rotate([-15, 0, 0])
/* color([100/255, 100/255, 100/255])  */
	support_assem();
