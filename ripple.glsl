extern float time;
extern vec2 center;
extern vec2 resolution;

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    // Normalize coordinates
    vec2 uv = screen_coords / resolution;
    vec2 position = uv * resolution;

    // Calculate distance from the ripple center
    float distance = length(position - center);

    // Calculate ripple effect
    float ripple = sin(10.0 * distance - time * 5.0) * 0.05;

    // Apply ripple effect to texture coordinates
    vec2 ripple_coords = texture_coords + ripple;

    // Get pixel color from the displaced coordinates
    vec4 pixel = Texel(texture, ripple_coords);

    return pixel * color;
}