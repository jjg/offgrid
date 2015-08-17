length = 235;
width = 143;
depth = 2.8;
visible_length = 222;
visible_width = 125.2;

difference(){
    cube([length,width,depth]);
    translate([(length-visible_length)/2,(width-visible_width)/2,depth-1]){
        cube([visible_length,visible_width,depth]);
    }
}