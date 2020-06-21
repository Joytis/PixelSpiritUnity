#ifndef LWG_sdfBridge2D_INCLUDED
#define LWG_sdfBridge2D_INCLUDED

#include "./aastep.hlsl"
#include "./sdfStroke2D.hlsl"

// Bridge Sampler
float3 sdfBridge2D(float3 color, float sdf, float stroke, float width) {
    color *= 1 - sdfStroke2D(sdf, stroke, width * 2);
    return color + sdfStroke2D(sdf, stroke, width);
}
half3 sdfBridge2D_half(half3 color, half sdf, half stroke, half width) {
    color *= 1 - sdfStroke2D_half(sdf, stroke, width * 2);
    return color + sdfStroke2D_half(sdf, stroke, width);
}

// Stoke Sample Graph
void sdfBridge2D_graph_float(float3 color, float SDF, float Stroke, float Width, out float3 Out) {
    Out = sdfBridge2D(color, SDF, Stroke, Width);
}
void sdfBridge2D_graph_half(half3 color, half SDF, half Stroke, half Width, out half3 Out) {
    Out = sdfBridge2D_half(color, SDF, Stroke, Width);
}

#endif