d=20;
w=10;
l=400;

module par1(){
	cube(size=[d, l, w], center=true);

}

par1();
translate([400,0,0])
par1();

color("red"){
translate([l/2, -l/2, w]) {
rotate([0,0,90]){
par1();
translate([400,0,0])
par1();
}
}
}
