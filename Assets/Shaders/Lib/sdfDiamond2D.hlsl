#ifndef LWG_SDFDIAMOND2D_INCLUDED
#define LWG_SDFDIAMOND2D_INCLUDED

#include "./sdfTriangle2D.hlsl"

// Diamond SDF
float sdfDiamond2D(float2 uv) {
    float sdf1 = sdfTriangle2D(uv);
    float sdf2 = sdfTriangle2D(float2(uv.x, 1 - uv.y));
    return max(sdf1, sdf2);
}
half sdfDiamond2D_half(half2 uv) {
    half sdf1 = sdfTriangle2D_half(uv);
    half sdf2 = sdfTriangle2D_half(float2(uv.x, 1 - uv.y));
    return max(sdf1, sdf2);
}

// Diamond SDF Graph
void sdfDiamond2D_graph_float(float2 UV, out float SDF) {
    SDF = sdfDiamond2D(UV);
}
void sdfDiamond2D_graph_half(half2 UV, out half SDF) {
    SDF = sdfDiamond2D_half(UV);
}

#endif