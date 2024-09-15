shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float x = UV.x-0.5;
	float y = UV.y-0.5;
	float d = x*x + y*y;
	COLOR = texture(TEXTURE,UV+vec2(x,y)*(-0.3+d));
	
	float s = (COLOR.g + COLOR.r )*(COLOR.g + COLOR.r )*(COLOR.g + COLOR.r );
	
	COLOR = vec4(s*(1.0-d),s*(1.0-d)/2.0,s*s*s,1 );
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
