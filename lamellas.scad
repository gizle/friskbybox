
include <constants.scad>

module lamella(){
    difference(){
	cube([pwidth, lamella_length, thickness2], center=true);
	translate([0,0,thickness2-thickness1])
	    cube([pwidth-2*thickness1, lamella_length+mfold, thickness2], center=true);
    }
}

module lamellas(num_lamellas){
    for(i = [0:num_lamellas-1] ) {
	translate([0, i*(lamella_length+5), 0]) 
	    lamella();
    }
}

lamellas(6);


