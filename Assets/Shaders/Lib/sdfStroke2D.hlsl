#ifndef LWG_SDFSTROKE2D_INCLUDED
#define LWG_SDFSTROKE2D_INCLUDED

#include "./aastep.hlsl"

// Stroke Sampler
float sdfStroke2D(float sdf, float stroke, float width) {
    float offset = width * 0.5;
    float res = aastep(stroke, sdf + offset) - aastep(stroke, sdf - offset);
    return clamp(res, 0, 1);
}
half sdfStroke2D_half(half sdf, half stroke, half width) {
    half offset = width * 0.5;
    half res = aastep(stroke, sdf + offset) - aastep(stroke, sdf - offset);
    return clamp(res, 0, 1);
}

// Stoke Sample Graph
void sdfStroke2D_graph_float(float SDF, float Stroke, float Width, out float Out) {
    Out = sdfStroke2D(SDF, Stroke, Width);
}
void sdfStroke2D_graph_half(half SDF, half Stroke, half Width, out half Out) {
    Out = sdfStroke2D_half(SDF, Stroke, Width);
}

#endif