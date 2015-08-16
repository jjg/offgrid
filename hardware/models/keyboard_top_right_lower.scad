length = 100;
width = 100;
depth = 10;
screen_depth = 10;


// bounding box
cube([length,width,depth]);

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
            #cylinder(r=depth/4,h=12);
        }
    }
}