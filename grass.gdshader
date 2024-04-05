shader_type particles;


global uniform sampler2D height_map;
uniform sampler2D random_map;
uniform sampler2D color_map;
uniform sampler2D wind_map;

uniform int rows = 300;
uniform float interval = 30.0;

void start() {
	
	float zOffset = 0.0;
	float offset = 10.0;
	
	float curr_height = texture(height_map, TRANSFORM[3].xz/550.0*10.0 + offset).r * 1.0;
	
	zOffset = float(int(float(INDEX)/float(rows)))/interval;
	float randomv = texture(random_map,vec2(float(INDEX)/550.0,zOffset)).r;
	
	TRANSFORM[1].xyz = vec3(0,1,0);
	TRANSFORM[3].xyz = vec3(float(INDEX)/interval - zOffset*float(rows) - offset + randomv,curr_height*1.0,zOffset - offset +randomv*4.0);
	if (int(zOffset) % 2 == 0){
		TRANSFORM[0].xyz = vec3(1,0,0);
	}else{
		TRANSFORM[0].xyz = vec3(0,0,1);
	}
		
		

	COLOR.rgb = vec3(0,texture(color_map,vec2(float(INDEX)/550.0)).g,0.2);
}
void process(){
	float newx = (texture(wind_map, vec2(TRANSFORM[3].x/550.0, 0) * 5.0 * TIME).r - 0.5)*2.0;
	float newz = (texture(wind_map, vec2(TRANSFORM[3].z/550.0, 0) * 1.0 * TIME).r - 0.5)*2.0;
	
	TRANSFORM[1].xyz = vec3(newx, 1.0, newz);
}


