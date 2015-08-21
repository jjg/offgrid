// OffGRiD Assembly
solar_panel_length = 220;
solar_panel_width = 175;
solar_panel_depth = 5;
display_length =235;
display_width =143;
display_depth = 2.8;
perimeter_thickness = 3;
keyboard_width = 81;

// solar panel
translate([solar_panel_width+(display_length/2)-(solar_panel_width/2),0,0]){
	rotate([0,0,90]){
		include <components/solar_panel.scad>
	}
}

// lcd
translate([0,(solar_panel_length/2)-(display_width/2),solar_panel_depth]){
	include <components/screen.scad>
}

// screen bottom-right corner
translate([display_length+perimeter_thickness,-perimeter_thickness,-perimeter_thickness]){
	rotate([0,0,90]){
		include <models/bottom_right_corner_lower.scad>
	}
}

// screen top-right corner (this is the top-right corner built out of top-left parts, needs adjustment obviously...)
translate([display_length+perimeter_thickness,solar_panel_length+perimeter_thickness,-perimeter_thickness]){
	rotate([0,0,180]){
		include <models/top_left_corner_lower.scad>
		translate([0,0,perimeter_thickness+solar_panel_depth+display_depth]){
			include <models/top_left_corner_upper.scad>
		}
	}
}

// screen top-left corner
translate([-perimeter_thickness,solar_panel_length+perimeter_thickness,-perimeter_thickness]){
	rotate([0,0,-90]){
		include <models/top_left_corner_lower.scad>
		translate([0,0,perimeter_thickness+solar_panel_depth+display_depth]){
			include <models/top_left_corner_upper.scad>
		}
	}
}

// keyboard top-right corner
translate([display_length+perimeter_thickness-100,-8,-13]){
	rotate([0,0,-90]){
		include <models/keyboard_top_right_lower.scad>
	}
}

// keyboard top-left corner
translate([0,-8,-13]){
	rotate([0,0,-90]){
		include <models/keyboard_top_left_lower.scad>
	}
}

// keyboard
translate([perimeter_thickness,-100-keyboard_width,-10]){
	include <components/keyboard_top.scad>
}