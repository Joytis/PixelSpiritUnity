#ifndef LWG_SDFRAYS2D_INCLUDED
#define LWG_SDFRAYS2D_INCLUDED

#include "./sdfCircle2D.hlsl"

// Rays SDF
float sdfRays2D(float2 uv, float rays) {
    float tau = 6.28318530718;
    uv -= .5;
    return frac(atan2(uv.y, uv.x) / tau * rays);
}
half sdfRays2D_half(half2 uv, half rays) {
    half tau = 6.28318530718;
    uv -= .5;
    return frac(atan2(uv.y, uv.x) / tau * rays);
}

// Rays SDF Graph
void sdfRays2D_graph_float(float2 UV, float Rays, out float SDF) {
    SDF = sdfRays2D(UV, Rays);
}
void sdfRays2D_graph_half(half2 UV, half Rays, out half SDF) {
    SDF = sdfRays2D_half(UV, Rays);
}

#endif