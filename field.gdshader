shader_type spatial;

global uniform sampler2D height_map;
uniform sampler2D grass_texture;
uniform float scale = 1.0;
void vertex() {
	VERTEX.y = texture(height_map, UV).r ;
	
}

void fragment() {
	ALBEDO.rgb = texture(grass_texture, UV).rgb;
}

