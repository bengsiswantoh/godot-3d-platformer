shader_type spatial;
render_mode unshaded, cull_front, depth_draw_always;

uniform bool active = false;
uniform float thickness = 0.1;
uniform vec4 outline_color : source_color = vec4(1.0);

void vertex() {
	if (active == true) {
		VERTEX += NORMAL * thickness;
	}
}

void fragment() {
	ALBEDO = outline_color.rgb;
	if (outline_color.a < 1.0) {
		ALPHA = outline_color.a;
	}
}