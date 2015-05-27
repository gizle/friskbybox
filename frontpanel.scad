
include <panels.scad>

module friskbylogo(){
    translate([7.5,50,0]){
	scale([0.2, 0.2, 0.026])
	    surface(file="friskby.png");
    }
}

module front(){
    union(){
	panel();
	friskbylogo();
    }
}

front();