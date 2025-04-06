shader_type canvas_item;

uniform float snow_speed : hint_range(0.0, 1.0) = 0.1;
uniform float snow_density : hint_range(0.0, 1.0) = 0.5;
uniform vec4 snow_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);

void fragment() {
    // Генерация случайных значений для эффекта снега
    float rand_val = fract(sin(dot(FRAGCOORD.xy ,vec2(12.9898,78.233))) * 43758.5453);

    // Плотность снега (частота появления снежинок)
    float snow = smoothstep(0.0, snow_density, rand_val);

    // Смещаем снежинки вниз с учетом времени
    vec2 movement = vec2(0.0, TIME * snow_speed);

    // Смещаем фрагменты для создания эффекта движения снега
    vec2 pos = FRAGCOORD.xy + movement;

    // Применяем цвет с эффектом снега
    vec4 color = snow_color * snow;

    // Если случайное число маленькое, показываем снежинку
    if (snow > 0.0) {
        COLOR = color;
    } else {
        discard;  // Пропускаем пиксели, которые не должны быть снежинками
    }
}