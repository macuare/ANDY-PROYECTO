shader_type canvas_item;
// se usara la textura para renderizar lo que en teoria esta bajo el agua
uniform sampler2D screen_texture: hint_screen_texture;
// Se agregara una textura de ruido para simular movimiento
uniform sampler2D noise_texture: filter_nearest, repeat_enable;
// Fuerza de la distorision
uniform float distorsion = 0.001;
// Velocidad del movimiento del agua
uniform vec2 speed = vec2(0.05,0.01);
// Fuerza del movimiento
uniform float fuerza = 0.01;

void vertex() {
	// Called for every vertex the material is visible on.
	VERTEX.y += sin(TIME) ;
}

void fragment() {
	// Called for every pixel the material is visible on.
	//vec2 uv = UV + (speed * TIME);
	// Obteniendo el valor de ruido entre un rango de [-1,1] 
	vec2 ruido = 2.0 * texture(noise_texture, UV +(speed * TIME)).rg - vec2(1.0);  //uv).rg - vec2(1.0);
	// Accediendo a la textura del agua
	COLOR =  texture(TEXTURE, UV + (ruido * fuerza));
	// Multiplicando el color de la textura por el fondo que seria lo que tomo de print screen
	COLOR *= texture(screen_texture, SCREEN_UV + (ruido * distorsion));
}
