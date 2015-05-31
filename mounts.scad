
include <panels.scad>

//To contain the mounts on the backside, to be glued to the mountpoints

module mount_bridge(){
    translate([-(inner_mount-fit)/2, 0,0]) cube([inner_mount-fit, mount_dist, 2]);
    cylinder(d=inner_mount-fit, h=mount_pheight-thickness1);
    translate([0, mount_dist,0]) cylinder(d=inner_mount-fit, h=mount_pheight-thickness1);
}

module mount_bridges(num){
    for(i = [0:num-1]){
	translate([i*(outer_mount+5),0,0]) mount_bridge();
    }
}

mount_bridges(5);
