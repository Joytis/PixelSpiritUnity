#ifndef LWG_SDFCROSS2D_INCLUDED
#define LWG_SDFCROSS2D_INCLUDED

#include "./sdfRect2D.hlsl"

// Cross SDF
float sdfCross2D(float2 uv, float s) {
    float2 size = float2(0.25, s);
    float sdf1 = sdfRect2D(uv.xy, size.xy);
    float sdf2 = sdfRect2D(uv.xy, size.yx);
    return min(sdf1, sdf2);
}
half sdfCross2D_half(half2 uv, half s) {
    half2 size = half2(0.25, s);
    half sdf1 = sdfRect2D_half(uv.xy, size.xy);
    half sdf2 = sdfRect2D_half(uv.xy, size.yx);
    return min(sdf1, sdf2);
}

// Cross SDF Graph
void sdfCross2D_graph_float(float2 UV, float Size, out float SDF) {
    SDF = sdfCross2D(UV, Size);
}
void sdfCross2D_graph_half(half2 UV, half Size, out half SDF) {
    SDF = sdfCross2D_half(UV, Size);
}

#endif