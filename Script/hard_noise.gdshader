shader_type canvas_item;


const float alpha = 1.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float x = UV.x-0.5;
	float y = UV.y-0.5;
	float d = x*x + y*y;
	vec2 b = UV+vec2(x,y)*(d);
	
	COLOR = texture(TEXTURE, vec2(b.y/10.0,b.x * (TIME*100.0+1000.0))/10.0);
	//COLOR = texture(TEXTURE, vec2((UV.x+TIME),UV.y+(0.5+sin(TIME*10.0+UV.x*100.0)*0.2)/2.0));
	COLOR = vec4(COLOR.r+0.5, COLOR.g+0.5, COLOR.b+0.5, alpha);
	
	


}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
