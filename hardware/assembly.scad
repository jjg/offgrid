// OffGRiD Assembly
solar_panel_length = 220;
solar_panel_width = 175;
solar_panel_depth = 5;
display_length =235;
display_width =143;
display_depth = 2.8;
perimeter_thickness = 3;

translate([solar_panel_width+(display_length/2)-(solar_panel_width/2),0,0]){
	rotate([0,0,90]){
		include <components/solar_panel.scad>
	}
}

translate([0,(solar_panel_length/2)-(display_width/2),solar_panel_depth]){
	include <components/screen.scad>
}

translate([display_length+perimeter_thickness,-perimeter_thickness,-perimeter_thickness]){
	rotate([0,0,90]){
		include <models/bottom_right_corner_lower.scad>
	}
}

translate([display_length+perimeter_thickness,solar_panel_length+perimeter_thickness,-perimeter_thickness]){
	rotate([0,0,180]){
		include <models/top_left_corner_lower.scad>
		translate([0,0,perimeter_thickness+solar_panel_depth+display_depth]){
			include <models/top_left_corner_upper.scad>
		}
	}
}

translate([-perimeter_thickness,solar_panel_length+perimeter_thickness,-perimeter_thickness]){
	rotate([0,0,-90]){
		include <models/top_left_corner_lower.scad>
		translate([0,0,perimeter_thickness+solar_panel_depth+display_depth]){
			include <models/top_left_corner_upper.scad>
		}
	}
}