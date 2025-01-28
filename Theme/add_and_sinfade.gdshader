shader_type canvas_item;

render_mode blend_add;

uniform sampler2D noise;
uniform float alpha;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR = vec4(COLOR.r, COLOR.g, COLOR.b, alpha*COLOR.a*texture(noise,vec2(sin(TIME/2.0)*0.6+0.4,sin(TIME/10.0)*0.5+0.5)).x);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
