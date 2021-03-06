

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

module mountpoint(outer, inner, floor, pheight1, pheight2){
    difference(){
	difference(){
	    cylinder(d=outer, h=pheight1);
	    translate([0, 0, floor]) cylinder(d=inner, h=pheight1);
	}
	translate([0, inner/2, outer/2 + pheight2]) cube([inner, inner, outer], center=true);
    }
}

module mount_socket(outer, inner, floor, pheight1, pheight2, distance){
    union(){
	mountpoint(outer, inner, floor, pheight1, pheight2);
	translate([0,distance,0])  rotate([0,0,180]) mountpoint(outer, inner, floor, pheight1, pheight2);
    }
}


module back(){
    union(){
	panel();
	translate([mount_margin,mount_margin,0])
	    mount_socket(outer_mount, inner_mount, thickness1, mount_pheight, thickness2, mount_dist);
	translate([pwidth-mount_margin, mount_margin,0]) 
	    mount_socket(outer_mount, inner_mount, thickness1, mount_pheight, thickness2, mount_dist);
	translate([mount_margin, pheight-mount_dist-mount_margin,0]) 
	    mount_socket(outer_mount, inner_mount, thickness1, mount_pheight, thickness2, mount_dist);
	translate([pwidth-mount_margin, pheight-mount_dist-mount_margin,0]) 
	    mount_socket(outer_mount, inner_mount, thickness1, mount_pheight, thickness2, mount_dist);
    }
}
