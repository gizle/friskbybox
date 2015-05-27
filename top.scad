
include <constants.scad>

outer_margin = 6;
fit = 0.1;

grove_lift =  thickness2-thickness1;
grove_width = thickness2 + fit;

module side_grove(displacement){
    translate([0, displacement, grove_lift]){
	union(){
	    cube([swidth, grove_width, thickness2], center=true);
	    translate([swidth/2,0,0]) cylinder(d=grove_width,h=thickness2, center=true);
	    translate([-swidth/2,0,0]) cylinder(d=grove_width,h=thickness2, center=true);
	}
    }
}

module front_grove(displacement){
    translate([displacement, 0, grove_lift])
	cube([grove_width, pwidth, thickness2], center=true);
}

module mainshape(){
    linear_extrude(height=thickness2){
	minkowski(){
	    square([swidth, pwidth], center=true);
	    circle(3);
	}
    }
}

module top(){
    difference(){
	mainshape();
	side_grove( pwidth/2);
	side_grove(-pwidth/2);
	front_grove( swidth/2 - sidepannel_margin - thickness2/2);
	front_grove(-swidth/2 + sidepannel_margin + thickness2/2);
    }
}

top();
translate([0, 71, 0]) top();
