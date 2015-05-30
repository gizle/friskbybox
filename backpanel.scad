
include <panels.scad>


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
