shader_type canvas_item;
uniform vec4 overlay_color : source_color;

void fragment() {
    vec4 tex_color = texture(TEXTURE, UV);
    COLOR = tex_color * overlay_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
