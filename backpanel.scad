
include <panels.scad>

module mountpoint(outer, inner, floor, pheight1, pheight2){
    difference(){
	difference(){
	    cylinder(d=outer, h=pheight1);
	    translate([0, 0, floor]) cylinder(d=inner, h=pheight1);
	}
	translate([0, inner/2, outer/2 + pheight2]) cube([inner, inner, outer], center=true);
    }
}


module mount(outer, inner, floor, pheight1, pheight2, distance){
    union(){
	mountpoint(outer, inner, floor, pheight1, pheight2);
	translate([0,distance,0])  rotate([0,0,180]) mountpoint(outer, inner, floor, pheight1, pheight2);
    }
}


module back(){
    union(){
	panel();
	translate([mount_margin,mount_margin,0])
	    mount(outer_mount, inner_mount, thickness1, mount_pheight, thickness2, mount_dist);
	translate([pwidth-mount_margin, mount_margin,0]) 
	    mount(outer_mount, inner_mount, thickness1, mount_pheight, thickness2, mount_dist);
	translate([mount_margin, pheight-mount_dist-mount_margin,0]) 
	    mount(outer_mount, inner_mount, thickness1, mount_pheight, thickness2, mount_dist);
	translate([pwidth-mount_margin, pheight-mount_dist-mount_margin,0]) 
	    mount(outer_mount, inner_mount, thickness1, mount_pheight, thickness2, mount_dist);
    }
}

back();
