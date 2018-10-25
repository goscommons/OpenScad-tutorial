use <../MCAD-master/bearing.scad>

b_l=400;
b_w=40;
b_d=20;
b2_l=750;

module sidebeam(){
color([80/255,0/255,0/255]) {
cube([b_l,b_w,b_d],true);}}

sidebeam();
translate([0, (b2_l-b_w), 0]) {	sidebeam();}
translate([0,b_w+10,0]) {sidebeam();}
translate([0,(2*b_w)+20,0]) {sidebeam();}

module beam(){
rotate([0, 0, 90]) {
color([140/255,100/255, 60/255]) {
cube([b2_l,b_w,b_d],true); }}}

translate([0.5*b_l-(0.5*b_w),(0.5*b2_l-(0.5*b_w)), -b_d])beam();

translate([-0.5*b_l+(0.5*b_w),(0.5*b2_l-(0.5*b_w)), -b_d ])beam();

module bearing(){
//Radius of the entire bearing (all values in mm by default)
Bearing_Radius = 50;
//Height of the bearing balls (and the entire bearing if Custom_Height is off)
Ball_Height = 19.5;
//Use a different height for the bearing than the balls (this overrides the debur toggle if on)
Custom_Height_Toggle = "on"; // [on,off]
//Height of the entire bearing (only used if Custom_Height is on, should be greater than Race_Height)
Bearing_Height = 30;
//Minimum radius of the certer portion of the bearing
Bearing_Internal_Radius = 25;
//Number of balls within the bearing
Ball_Number = 11;
//Space between the balls and the internal bearing walls (on each side, must be greater than 0 or balls will print fused)
Ball_Tolerance = 0.5;
//Cleaning up of the rough edges on the exterior of the bearing (recommended on)
Debur = "on"; // [on,off]
//Amount of material removed by the deburring process (try it till you find a good result)
Debur_Severity = 5;
//Radius of the bearing hole
Hole_Radius = 20;
//Number of sides of the bearing hole (only enabled if Hole Type is set to "userdef")
Hole_Facets = 6;
//Type of hole
Hole_Type = "userdef"; // [circle,square,userdef]
//Definition of the entire model
Definition = 100;
//Cuts the bearing in half to aid with the design process
Design_Aid = "off"; // [on,off]
module bearing (radius, height, htoggle, customheight, intthickness, bearingnum, bearingtol, debur, deburseverity, holerad, holefacet, holetype) {
difference(){ if(htoggle == "off")cylinder(height, radius, radius, true);
else cylinder(customheight, radius, radius, true);
rotate_extrude()translate([intthickness+bearingtol+height/2,0,0])circle(bearingtol+height/2);
if(debur == "on" || htoggle == "on"){ difference(){
cylinder(max(height, customheight)+2, intthickness+bearingtol+height/2+deburseverity, intthickness+bearingtol+height/2+deburseverity, true);
cylinder(max(height, customheight)+2, intthickness+bearingtol+height/2-deburseverity, intthickness+bearingtol+height/2-deburseverity, true);	};	};
if(holetype == "circle"){
cylinder(max(height, customheight)+2,holerad,holerad,true);};
if(holetype == "square"){
cube([holerad2,holerad2,max(height, customheight)+2],true); };
if(holetype == "circle"){
cylinder(max(height, customheight)+2,holerad,holerad,true, $fn = holefacet);}	}
for(n = [0:bearingnum-1]){
rotate([0,0,(360/bearingnum)n])translate([intthickness+bearingtol+height/2,0,0])
    sphere(height/2);	}}
difference(){
bearing(Bearing_Radius,Ball_Height, Custom_Height_Toggle, Bearing_Height, Bearing_Internal_Radius,Ball_Number,Ball_Tolerance,Debur,Debur_Severity,Hole_Radius,Hole_Facets,Hole_Type,$fn = Definition);
if(Design_Aid == "on")translate([-1-Bearing_Radius,0,0])cube([Bearing_Radius2+2,Bearing_Radius*2, max(Ball_Height, Bearing_Height)]);
}; }

//bearing
rotate([90, 0, 90]) { translate([0.5b2_l,-1.5b_d-cr,0])
color([30/255,30/255,30/255]){
bearing();}}

cr=20;
module midden(){
color([80/255, 60/255, 50/255]) {
translate([75, 0.5b2_l,-1.5b_d-cr]) {
rotate([90, 0,90]) {
cylinder(r=cr, h=b_l+150, center=true);}}}}
midden();

module hand(){
color([50/255, 25/255, 25/255]) {
translate([(0.5b_l)+135, 0.5b2_l, -0.5*b_d]) {
cylinder(r=15, h=80, center=true); }}}
hand();

module spijker(){
translate([-0.5b_l+(0.5b_w), 0.5*b2_l, -40]) {
color([0/255, 0/255, 0/255]) {
cylinder(r=5, h=70, center=true);}}}
spijker();

difference() {
midden();
spijker(); }

cr2=30;
module back(){
color([80/255, 60/255, 50/255]) {
translate([0, b_w,-1.5*b_d-cr2]) {
rotate([90, 0,90]) {
cylinder(r=cr2, h=b_l+150, center=true);}}}}
back();

cr3=60;
module rw(){
color([30/255,30/255,30/255]) {
translate([0.6b_l, b_w,-1.5b_d-cr2]) {
rotate([90, 0,90]) {
cylinder(r=cr3, 50, center=true);}}}}
rw();

module lw(){
color([30/255,30/255,30/255]) {
translate([-0.6b_l, b_w,-1.5b_d-cr2]) {
rotate([90, 0,90]) {
cylinder(r=cr3, 50, center=true);}}}}
lw();

difference(){
rw();
back(); }

difference(){
lw();
back(); }

//bovenaan: use <MCAD-master/bearing.scad>
//bearing(model="custom", inD=18, outD=30, bW=14);
