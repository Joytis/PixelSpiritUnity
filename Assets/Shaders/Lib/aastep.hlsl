#ifndef LWG_AASTEP_INCLUDED
#define LWG_AASTEP_INCLUDED

// Anti-aliasing step
float aastep(float threshold, float value) {
    float afwidth = 0.7 * length(float2(ddx(value), ddy(value)));
    return smoothstep(threshold-afwidth, threshold+afwidth, value);
}
half aastep(half threshold, half value) {
    half afwidth = 0.7 * length(half2(ddx(value), ddy(value)));
    return smoothstep(threshold-afwidth, threshold+afwidth, value);
}

#endif