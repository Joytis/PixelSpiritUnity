#ifndef LWG_SDFVESICA2D_INCLUDED
#define LWG_SDFVESICA2D_INCLUDED

#include "./sdfCircle2D.hlsl"

// Vesica SDF
float sdfVesica2D(float2 uv, float separation) {
    float2 offset = float2(separation * 0.5, 0);
    float sdf1 = sdfCircle2D(uv - offset);
    float sdf2 = sdfCircle2D(uv + offset);
    return max(sdf1, sdf2);
}
half sdfVesica2D_half(half2 uv, half separation) {
    half2 offset = half2(separation * 0.5, 0);
    half sdf1 = sdfCircle2D_half(uv - offset);
    half sdf2 = sdfCircle2D_half(uv + offset);
    return max(sdf1, sdf2);
}

// Vesica SDF
void sdfVesica2D_graph_float(float2 UV, float Separation, out float SDF) {
    SDF = sdfVesica2D(UV, Separation);
}
void sdfVesica2D_graph_half(half2 UV, half Separation, out half SDF) {
    SDF = sdfVesica2D_half(UV, Separation);
}

#endif