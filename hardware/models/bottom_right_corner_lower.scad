// these are all guesses ATM, but the bounding box should be limited to ~100mm3
design_version = "V1";
length = 100;
height = 100;
depth = 10;
frame_width = 20;
shelf_thickness = 3;
perimeter_thickness = 3;
screw_diameter = 3;
tab_diameter = 5;
hinge_diameter = 10;

difference(){
    // bounding box
    cube([length, height, depth]);
    
    // main cut-out
    translate([frame_width, frame_width, -1]){
        cube([length, height, depth + 2]);
    }
    
	// watermark
    rotate([0,180,0]){
        translate([-10,10,-1]){
            linear_extrude(height = 10){
               #text(design_version,size=4);
            }
        }
    }
    
    // this prevents shelf cut from penetrating the perimeter
    difference(){
        
        // shelf cut-out
        translate([perimeter_thickness, perimeter_thickness,        shelf_thickness]){
            cube([length, height, depth + 2]);
        }    
        
        // outer slash cut
        translate([perimeter_thickness, perimeter_thickness,0]){
            rotate([0,0,-45]){
                translate([-length,0,-1]){
                    cube([length *2, frame_width, depth +2]);
                }
            }     
        }
 
    }
/*    
    // outer slash cut
    rotate([0,0,-45]){
        translate([-length,0,-1]){
            cube([length *2, frame_width, depth +2]);
        }
    }
*/    
    // inner slash cut
    translate([length/2, height/2, 0]){
        rotate([0,0,-45]){
            translate([-length,0,-1]){
                cube([length *2, frame_width, depth +2]);
            }
        }
    }

    // mounting hole (complete guess for now)
    translate([perimeter_thickness*2, height/2,-1]){
        cylinder(r=screw_diameter/2,h=shelf_thickness+2,$fn=25);
    }
}

// upper tab
translate([0,height-5,0]){
    cylinder(r=tab_diameter/2,h=depth+1);
}

// lower tab
translate([length-5,0,0]){
    cylinder(r=tab_diameter/2,h=depth+1);
}

// hinge
difference(){
    union(){
        translate([-depth/2,0,0]){
            cube([10,30,depth]);
        }
        translate([-depth/2,0,depth/2]){
            rotate([-90,0,0]){
                cylinder(r=depth/2,h=30);
            }
        }
    }
    
    // hinge fork
    rotate([0,180,0]){
        translate([depth/2,10,-depth/2]){
            rotate([-90,0,0]){
                #cylinder(r=depth/2+1,h=10);
            }
        }
    }

    // hinge pin hole
    translate([-depth/2,-1,depth/2]){
        rotate([-90,0,0]){
            cylinder(r=depth/4,h=35);
        }
    }
}