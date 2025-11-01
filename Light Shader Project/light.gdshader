// // 
// // shader by Apanora:Tales_Of_Nivar
// //

shader_type canvas_item;

// Base darkness color
uniform vec4 modulate_color : source_color = vec4(1.0,1.0,1.0,1.0);

const int MAX_LIGHTS = 100;

// Array uniforms for multiple light sources
uniform vec2 light_positions[MAX_LIGHTS];
uniform vec4 light_colors[MAX_LIGHTS];
uniform float light_radii[MAX_LIGHTS];
uniform float light_strengths[MAX_LIGHTS];
uniform float light_falloffs[MAX_LIGHTS]; // Custom falloff value for each light
uniform bool light_on[MAX_LIGHTS];
uniform int number_of_lights = 0;

// Screen texture for sampling the current rendered frame
uniform sampler2D screen_texture : hint_screen_texture, filter_nearest;

// Function to compute the combined light color effect
vec3 compute_light_color(vec2 coords) {
    vec3 total_effect = vec3(0.0);

    for (int i = 0; i < number_of_lights; i++) {
        if (!light_on[i]) continue;

        vec2 pos = light_positions[i];
        vec4 color = light_colors[i];
        float radius = light_radii[i];
        float strength = light_strengths[i];
        float falloff_power = light_falloffs[i];

        float dist = distance(coords, pos);
        if (dist < radius) {
            float normalized = 1.0 - dist / radius;
            
            // Linear light falloff (no smoothstep)
            float falloff = pow(normalized, falloff_power);

            float factor = falloff * strength;
            total_effect += color.rgb * factor;
        }
    }

    // Soft tone mapping to avoid overexposure (whitening)
    total_effect = 1.0 - exp(-total_effect);
    return clamp(total_effect, 0.0, 1.0);
}

void fragment() {
    vec4 color = texture(screen_texture, SCREEN_UV);
    vec3 light_effect = compute_light_color(FRAGCOORD.xy);

    // Blend base darkness with light effect
    vec3 final_modulate = mix(modulate_color.rgb, modulate_color.rgb * (1.0 - light_effect) + light_effect, 1.0);
    vec3 final_color = color.rgb * final_modulate;

    COLOR = vec4(final_color, color.a);
}
