,
include <constants.scad>

margin = 1;

//Groves for the front and back pannels
module pgrove(displacement){
    union(){
	translate([displacement,-mfold ,thickness2-thickness1]) 
	    cube([grove_width, pheight+mfold, thickness1+mfold]);
	translate([displacement + thickness2/2, pheight ,thickness2-thickness1]) 
	    cylinder(h=thickness1+mfold, d=thickness2);
    }
}

module pgroves(){
    union(){
	pgrove(margin);
	pgrove(swidth-margin-thickness2);
    }
}

module lamella_grove(xpos, ypos, angle, length, width, ele){
    translate([xpos,ypos,ele]){
	rotate([0,0,angle])
	    union(){
	    cube([length, width, thickness2+mfold]);
	    translate([0, width/2,0]) cylinder(h=thickness2 + mfold, d=width);
	    translate([length, width/2,0]) cylinder(h=thickness2 + mfold, d=width);
	}
    }
}

module lamella_groves(startx, ypos, angle, separation, num){
    for(i= [0:num-1]){
	lamella_grove(startx, ypos + i*separation, angle, lamella_length, 
		      grove_width,thickness2-thickness1);
    }
}

difference(){
    cube([swidth, sheight, thickness2]);
    pgroves();
    lamella_groves(pwidth-18, pheight, 45, 8, 4);
    lamella_groves(1, pheight+8, -45, 8, 4);
}
