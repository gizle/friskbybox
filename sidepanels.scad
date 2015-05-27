
include <constants.scad>

margin = 1;

//Groves for the front and back pannels
module pgrove(displacement){
    union(){
	translate([displacement,-mfold ,thickness2-thickness1]) 
	    cube([thickness2, pheight+mfold, thickness1+mfold]);
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

module lamella(xpos, ypos, angle, length, width, ele){
    translate([xpos,ypos,ele]){
	rotate([0,0,45])
	    union(){
	    cube([length, width, thickness2+mfold]);
	    translate([0, width/2,0]) cylinder(h=thickness2 + mfold, d=width);
	}
    }
}

module lamellas(startx, ypos, angle){
    lamella(pwidth-18,pheight,45,20,3,thickness2-thickness1);
}

difference(){
    cube([swidth, sheight, thickness2]);
    pgroves();
    lamellas();
}
