shader_type canvas_item;
uniform sampler2D ruidoTextura: repeat_enable, filter_nearest;
uniform float densidadNiebla: hint_range(0.0, 1.0, 0.01) = 0.25;
uniform vec2 velocidad = vec2(0.02, 0.01);

void fragment() {
	// Darle movimiento a la niebla
	vec2 uv = UV + (velocidad * TIME);
	// Agregando el ruido
	float ruido = texture(ruidoTextura, uv).r;
	// Convirtiendo el ruido (0.0 , 1.0) al rango de (-1.0, 1.0) y
	// limitarlo nuevamente entre 0 y 1
	float niebla = clamp(ruido * 2.0 - 1.0, 0.0, 1.0);
	
	// Implementando el ruido en la textura visual
	COLOR.a *= niebla * densidadNiebla;
	
}
