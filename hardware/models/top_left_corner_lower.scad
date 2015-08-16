length = 100;
height = 100;
depth = 10;
frame_width = 20;
shelf_thickness = 3;
perimeter_thickness = 3;
screw_diameter = 3;

difference(){
    // bounding box
    cube([length, height, depth]);
    
    // main cut-out
    translate([frame_width, frame_width, -1]){
        cube([length, height, depth + 2]);
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
    
    // outer slash cut
    rotate([0,0,-45]){
        translate([-length,0,-1]){
            cube([length *2, frame_width, depth +2]);
        }
    }
    
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
        cylinder(r=screw_diameter/2,h=shelf_thickness+2);
    }
}