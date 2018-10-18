/*
ssqa module{
dependent from full length
this module in particular needs to be customizable
integrated with the squares
}
*/

// INDEPENDENT VARIABLES
/* Tynes Subassemblies parameters*/
l=1700;// width of grapples
tynes_num=10;//ammmount of inner tynes
sh_thick=5; // Sheet thickness

/*Lid Parameters*/
l_lid=620;

// DEPENDENT VARIABLES**DON'T CHANGE**
d_b_tynes=l/tynes_num;// distance between tynes recalculation
l_ratio=(l_lid-l_lid*0.07)/450;// Recalculation of front and up plate based on original size


module sq_tube(length,size){
	difference(length,size) {
		cube([length,size*24.5,size*24.5], center=true);
		cube([length+length*0.2, size*(24.5)-15, size*(24.5)-15], center=true);
	}
}

sq_tube(l,3);
