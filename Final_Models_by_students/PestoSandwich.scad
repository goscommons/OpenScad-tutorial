use <../MCAD-master/bearing.scad>


board_length = 1200;
board_thickness = 8;
board_width = 250;

wheel_width = 45;
board_wheel_distance = 5;
ground_contact_area_width = 220;
axel_radius = 7;
connector_radius = 20;
bearing_radius = 25;
wheel_radius = 50;

wheel_color = "black";
connector_color = "red";
board_color = "grey";
pattern_color = "red";

number_of_cutouts = 6;
cutout_area_percentage = 0.2;

//Changes the shape of individual cutouts
module cutout(){
translate([0, board_width/4, 0])
cylinder(r=((board_length-board_thickness)/(2*number_of_cutouts))cutout_area_percentage, h=board_thickness+1, center=true);
translate([0, -board_width/4, 0])
cylinder(r=((board_length-board_thickness)/(2number_of_cutouts))*cutout_area_percentage, h=board_thickness+1, center=true);
}

//Create's the wheel
module wheel(){
color(wheel_color, 1.0 ) {
rotate([90, 0, 0]) {
difference() {
union(){
cylinder(r=wheel_radius-wheel_width/2, h=wheel_width, center=true);
rotate_extrude(angel = 360, convexity =2){
translate([wheel_radius-(wheel_width/2),0,0])
circle(d=wheel_width);
}
}
cylinder(r=bearing_radius, h=wheel_width+1, center=true);
}

}
}
}

//Creates the body connecting the wheel's to the board, and attaches the bearing and wheels
module connector(){
translate([0, 0, -(connectorHeight()/2+board_thickness/2)]) {
color(connector_color, 1.0 ) {
cube([connector_radius2,connectorWidth()0.5,connectorHeight()], center=true);
}
translate([0, 0, -(connectorHeight()/2-board_thickness/2)]) {
rotate([90, 0, 0]){
color(connector_color, 1.0 ) {
cylinder(h=connectorWidth()+2wheel_width, r=axel_radius, center=true);
cylinder(r=connector_radius, h=connectorWidth(), center=true);
}
}
translate([0,connectorWidth()/2+wheel_width/2,0]){
rotate([90, 0, 0])
bearing(model="custom", inD = axel_radius2, outD=2bearing_radius, bW= wheel_width0.8);
wheel();
}
translate([0,-(connectorWidth()/2+wheel_width/2),0]){
rotate([90, 0, 0])
bearing(model="custom", inD = axel_radius2, outD=2bearing_radius, bW= wheel_width*0.8);
wheel();
}
}
}
}

//Creates the board including the cutouts
module board(){
color(board_color, 1.0 ) {
cube([board_length-board_width,board_width,board_thickness], center=true);
translate([(board_length-board_width)/2,0,0]){
cylinder(r=board_width/2, h=board_thickness, center=true);
}
translate([-(board_length-board_width)/2,0,0]){
cylinder(r=board_width/2, h=board_thickness, center=true);
}
}
}

//Creates the cutout body
module combined_cutout(){
color(pattern_color,1.0) {
translate([-(board_length/2-board_width/2),0,0]) {
cutout_step(0,number_of_cutouts);
}
}
}

//Recursive function used for making multiple cutouts
module cutout_step(iterator, max){
if (iterator < max) {
translate([(board_length-board_width)/(number_of_cutouts+1), 0, 0]) {
cutout();
cutout_step(iterator+1, max);
}
}else{

}
}

function connectorHeight() = wheel_radius + board_thickness/2 + board_wheel_distance;
function connectorWidth() = ground_contact_area_width - 2*wheel_width;

//board
difference() {
board();
combined_cutout();
}
translate([0, 0, -(connectorHeight()(1.5/4)+board_thickness/2)]) {
color(connector_color, 1.0 ) {
cube([board_length0.8,connectorWidth()*0.25,connectorHeight()/2], center=true);
}}

translate([-(board_length0.4),0,0])
connector();
translate([(board_length0.4),0,0])
connector();
