shader_type particles;


global uniform sampler2D height_map;
uniform sampler2D random_map_x;
uniform sampler2D random_map_z;
uniform sampler2D color_map;
uniform sampler2D wind_map;

uniform int rows = 300;
uniform float interval = 0.1;
uniform float texture_size = 550;

void start() {
	
	int index = int(INDEX);
	
	float zOffset = 0.0;
	float offset = 10.0;
	
	float curr_height = texture(height_map, TRANSFORM[3].xz/550.0*10.0 + offset).r * 1.0;
	
	
	

	
	
	int texture_x_offset = index%int(texture_size);
	int texture_y_offset = int(floor(float(INDEX)/texture_size))%int(texture_size);
	vec2 texture_offset = vec2(float(texture_x_offset), float(texture_y_offset));
	
	float randomx = (texture(random_map_x,texture_offset/texture_size).r - 0.5)*10.0;
	float randomy = (texture(random_map_z,texture_offset/texture_size).r - 0.5)*10.0;
	
	
	
	TRANSFORM[3].xyz = vec3(float(texture_x_offset) * interval + randomx -offset,1,float(texture_y_offset)*interval + randomy - offset);
	//TRANSFORM[1].xyz = vec3(0.0,randomx*10.0,0.0);
	
	if (int(INDEX) % 2 == 0){
		TRANSFORM[0].xyz = vec3(1,0,0);
	}else{
		TRANSFORM[0].xyz = vec3(0,0,1);
	}
		
		

	COLOR.rgb = vec3(0,texture(color_map,vec2(float(INDEX)/550.0)).g,0.2);
}
void process(){
	float newx = (texture(wind_map, vec2(TRANSFORM[3].x/texture_size, 0) * 1.0 * TIME).r - 0.5)*1.0;
	float newz = (texture(wind_map, vec2(0,TRANSFORM[3].z/texture_size) * 1.0 * TIME).r - 0.5)*1.0;
	
	TRANSFORM[1].xyz = vec3(newx, TRANSFORM[1].y, newz);
}


