

include <constants.scad>

//mount dimensions
outer_mount = 15;
inner_mount = 10;
mount_dist = 25;
mount_margin = 15;
mount_pheight = 6;

module panel(){
    difference(){
	cube([pwidth, pheight, thickness2]);
	translate([grovedepth, grovedepth, thickness1]){
	    cube([pwidth-grovedepth*2, pheight-grovedepth*2, thickness2]);
	}
    }
}


