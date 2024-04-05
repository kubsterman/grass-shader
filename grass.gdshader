shader_type particles;


global uniform sampler2D height_map;
uniform sampler2D random_map;
uniform sampler2D color_map;

uniform float location;
uniform int rows = 400;
uniform float interval = 20.0;

void start() {
	vec2 randomv = vec2(texture(random_map,vec2(float(INDEX)/550.0,float(INDEX)/550.0)).rb);
	float zOffset = 0.0;
	float offset = 25.0;
	float curr_height = texture(height_map, TRANSFORM[3].xz/550.0*10.0 + offset).r * 1.0;
	
	zOffset = float(int(float(INDEX)/float(rows)))/interval;
	
	TRANSFORM[1].xyz = vec3(0,1,0);
	TRANSFORM[0].xyz = vec3(1,0,-randomv.x * 0.5);
	
	TRANSFORM[3].xyz = vec3(float(INDEX)/interval - zOffset*float(rows) - offset + randomv.x,curr_height*1.0,zOffset - offset);
	
	//texture(color_map,vec2(float(INDEX)/550.0)).g;
}
void process(){
	COLOR.rgb = vec3(0,texture(color_map,vec2(float(INDEX)/550.0)).g,0.2);
}


