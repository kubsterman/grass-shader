shader_type particles;


global uniform sampler2D height_map;
uniform sampler2D random_map;
uniform sampler2D color_map;

uniform float location;
uniform int rows = 200;
uniform float interval = 10.0;



void start() {
	float randomv = texture(random_map,vec2(float(INDEX),float(INDEX))/550.0).r;
	float zOffset = 0.0;
	float offset = 10.0;
	float curr_height = texture(height_map, TRANSFORM[3].xz/550.0*10.0 + offset).r;
	
	zOffset = float(int(float(INDEX)/float(rows)))/interval;
	
	TRANSFORM[3] = vec4(float(INDEX)/interval - zOffset*float(rows) - offset + randomv,curr_height,zOffset - offset,0.0);
}

