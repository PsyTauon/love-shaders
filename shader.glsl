extern number time;
extern vec2 resolution;

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    // Calculate wave effect
    float wave = sin(texture_coords.y * 10.0 + time) * 0.005;
    vec2 uv = vec2(texture_coords.x + wave, texture_coords.y);
    vec4 pixel = Texel(texture, uv); // get pixel color from displaced coordinates
    return pixel * color;
}