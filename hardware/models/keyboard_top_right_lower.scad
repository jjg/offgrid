design_version = "V1";
length = 100;
width = 100;
depth = 10;
screen_depth = 10;
perimeter_thickness = 3;

difference(){
    // bounding box
    cube([length,width,depth]);

    // main cut-out
    translate([perimeter_thickness,perimeter_thickness,1]){
        cube([length-(perimeter_thickness*2),width-(perimeter_thickness*2),depth+1]);
    }
    
	// watermark
    rotate([0,180,0]){
        translate([-length/2,width/2,-1]){
            linear_extrude(height = 10){
               #text(design_version,size=4);
            }
        }
    }
}

// hinge
difference(){
    union(){
        translate([-depth/2,width-20,0]){
            cube([10,10,depth+(depth/2)]);
        }
        translate([0,width-20,depth+(screen_depth/2)]){
            rotate([-90,0,0]){
                cylinder(r=depth/2,h=10);
            }
        }
    }
    
    // hinge pin hole
    translate([0,width-21,depth+(screen_depth/2)]){
        rotate([-90,0,0]){
            cylinder(r=depth/4,h=12);
        }
    }
}