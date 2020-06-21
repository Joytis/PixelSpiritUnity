#ifndef LWG_SDFSTAR2D_INCLUDED
#define LWG_SDFSTAR2D_INCLUDED

#include "./sdfRect2D.hlsl"

// Star SDF
float sdfStar2D(float2 uv, float points, float size) {
    float tau = 6.28318530718;
    uv = uv * 4 - 2;
    float a = atan2(uv.y, uv.x)/tau;
    float seg = a * points;
    a = ((floor(seg) + 0.5)/points + 
        lerp(size, -size, step(.5, frac(seg)))) 
        * tau;
    return abs(dot(float2(cos(a),sin(a)), uv));
}
half sdfStar2D_half(half2 uv, half points, half size) {
    half tau = 6.28318530718;
    uv = uv * 4 - 2;
    half a = atan2(uv.y, uv.x)/tau;
    half seg = a * points;
    a = ((floor(seg) + 0.5)/points + 
        lerp(size, -size, step(.5, frac(seg)))) 
        * tau;
    return abs(dot(half2(cos(a),sin(a)), uv));
}

// Star SDF Graph
void sdfStar2D_graph_float(float2 UV, float Points, float Size, out float SDF) {
    SDF = sdfStar2D(UV, Points, Size);
}
void sdfStar2D_graph_half(half2 UV, half Points, half Size, out half SDF) {
    SDF = sdfStar2D_half(UV, Points, Size);
}

#endif