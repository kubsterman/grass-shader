shader_type particles;


global uniform sampler2D height_map;
uniform sampler2D random_map;
uniform sampler2D color_map;

uniform float location;
uniform int rows = 300;
uniform float interval = 15.0;

void start() {
	
	float zOffset = 0.0;
	float offset = 10.0;
	
	float curr_height = texture(height_map, TRANSFORM[3].xz/550.0*10.0 + offset).r * 1.0;
	
	zOffset = float(int(float(INDEX)/float(rows)))/interval;
	float randomv = texture(random_map,vec2(float(INDEX)/550.0,zOffset)).r;
	
	TRANSFORM[1].xyz = vec3(0,1,0);
	
	
	TRANSFORM[3].xyz = vec3(float(INDEX)/interval - zOffset*float(rows) - offset + randomv,curr_height*1.0,zOffset - offset +randomv*4.0);
	
	//texture(color_map,vec2(float(INDEX)/550.0)).g;
	COLOR.rgb = vec3(0,texture(color_map,vec2(float(INDEX)/550.0)).g,0.2);
}
void process(){
	float newuv = texture(color_map, vec2(TRANSFORM[3].xz/550.0) * 1.0 * TIME).r;
	TRANSFORM[0].xyz = vec3(cos(TIME),0,sin(TIME));
	TRANSFORM[1].xyz = vec3(newuv, 1.0, newuv);
}


